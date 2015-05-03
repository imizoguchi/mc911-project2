/*****************************************************
Esta classe Codegen é a responsável por emitir LLVM-IR. 
Ela possui o mesmo método 'visit' sobrecarregado de
acordo com o tipo do parâmetro. Se o parâmentro for
do tipo 'While', o 'visit' emitirá código LLVM-IR que 
representa este comportamento. 
Alguns métodos 'visit' já estão prontos e, por isso,
a compilação do código abaixo já é possível.

class a{
    public static void main(String[] args){
    	System.out.println(1+2);
    }
}

O pacote 'llvmast' possui estruturas simples 
que auxiliam a geração de código em LLVM-IR. Quase todas 
as classes estão prontas; apenas as seguintes precisam ser 
implementadas: 

// llvmasm/LlvmBranch.java
// llvmasm/LlvmIcmp.java
// llvmasm/LlvmMinus.java
// llvmasm/LlvmTimes.java


Todas as assinaturas de métodos e construtores 
necessárias já estão lá.


Observem todos os métodos e classes já implementados
e o manual do LLVM-IR (http://llvm.org/docs/LangRef.html) 
como guia no desenvolvimento deste projeto. 

 ****************************************************/
package llvm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import llvmast.LlvmAlloca;
import llvmast.LlvmAnd;
import llvmast.LlvmArray;
import llvmast.LlvmBool;
import llvmast.LlvmBranch;
import llvmast.LlvmCall;
import llvmast.LlvmClassType;
import llvmast.LlvmCloseDefinition;
import llvmast.LlvmConstantDeclaration;
import llvmast.LlvmDefine;
import llvmast.LlvmExternalDeclaration;
import llvmast.LlvmGetElementPointer;
import llvmast.LlvmIcmp;
import llvmast.LlvmInstruction;
import llvmast.LlvmIntegerLiteral;
import llvmast.LlvmLabel;
import llvmast.LlvmLabelValue;
import llvmast.LlvmLoad;
import llvmast.LlvmMinus;
import llvmast.LlvmNamedValue;
import llvmast.LlvmPlus;
import llvmast.LlvmPointer;
import llvmast.LlvmPrimitiveType;
import llvmast.LlvmRegister;
import llvmast.LlvmRet;
import llvmast.LlvmStore;
import llvmast.LlvmStructure;
import llvmast.LlvmTimes;
import llvmast.LlvmType;
import llvmast.LlvmValue;
import llvmast.LlvmXor;
import semant.Env;
import symbol.ClassInfo;
import symbol.MethodInfo;
import symbol.Symbol;
import symbol.VarInfo;
import syntaxtree.And;
import syntaxtree.ArrayAssign;
import syntaxtree.ArrayLength;
import syntaxtree.ArrayLookup;
import syntaxtree.Assign;
import syntaxtree.Block;
import syntaxtree.BooleanType;
import syntaxtree.Call;
import syntaxtree.ClassDecl;
import syntaxtree.ClassDeclExtends;
import syntaxtree.ClassDeclSimple;
import syntaxtree.Equal;
import syntaxtree.False;
import syntaxtree.Formal;
import syntaxtree.Identifier;
import syntaxtree.IdentifierExp;
import syntaxtree.IdentifierType;
import syntaxtree.If;
import syntaxtree.IntArrayType;
import syntaxtree.IntegerLiteral;
import syntaxtree.IntegerType;
import syntaxtree.LessThan;
import syntaxtree.MainClass;
import syntaxtree.MethodDecl;
import syntaxtree.Minus;
import syntaxtree.NewArray;
import syntaxtree.NewObject;
import syntaxtree.Not;
import syntaxtree.Plus;
import syntaxtree.Print;
import syntaxtree.Program;
import syntaxtree.Statement;
import syntaxtree.This;
import syntaxtree.Times;
import syntaxtree.True;
import syntaxtree.VarDecl;
import syntaxtree.VisitorAdapter;
import syntaxtree.While;

public class Codegen extends VisitorAdapter {
	private List<LlvmInstruction> assembler;
	private Codegen codeGenerator;

	private SymTab symTab;
	private ClassNode classEnv; // Aponta para a classe atualmente em uso em
								// symTab
	private MethodNode methodEnv; // Aponta para a metodo atualmente em uso em
									// symTab

	private Env env;

	public Codegen() {
		assembler = new LinkedList<LlvmInstruction>();
	}

	// Método de entrada do Codegen
	public String translate(Program p, Env env) {
		codeGenerator = new Codegen();
		codeGenerator.env = env;
		// Preenchendo a Tabela de Símbolos
		// Quem quiser usar 'env', apenas comente essa linha
		// codeGenerator.symTab.FillTabSymbol(p);

		// Formato da String para o System.out.printlnijava "%d\n"
		codeGenerator.assembler.add(new LlvmConstantDeclaration(
				"@.formatting.string",
				"private constant [4 x i8] c\"%d\\0A\\00\""));

		// NOTA: sempre que X.accept(Y), então Y.visit(X);
		// NOTA: Logo, o comando abaixo irá chamar codeGenerator.visit(Program),
		// linha 75
		p.accept(codeGenerator);

		// Link do printf
		List<LlvmType> pts = new LinkedList<LlvmType>();
		pts.add(new LlvmPointer(LlvmPrimitiveType.I8));
		pts.add(LlvmPrimitiveType.DOTDOTDOT);
		codeGenerator.assembler.add(new LlvmExternalDeclaration("@printf",
				LlvmPrimitiveType.I32, pts));
		List<LlvmType> mallocpts = new LinkedList<LlvmType>();
		mallocpts.add(LlvmPrimitiveType.I32);
		codeGenerator.assembler.add(new LlvmExternalDeclaration("@malloc",
				new LlvmPointer(LlvmPrimitiveType.I8), mallocpts));

		String r = new String();
		for (LlvmInstruction instr : codeGenerator.assembler)
			r += instr + "\n";
		return r;
	}

	public LlvmValue visit(Program n) {
		n.mainClass.accept(this);

		for (util.List<ClassDecl> c = n.classList; c != null; c = c.tail)
			c.head.accept(this);

		return null;
	}

	public LlvmValue visit(MainClass n) {

		// definicao do main
		assembler.add(new LlvmDefine("@main", LlvmPrimitiveType.I32,
				new LinkedList<LlvmValue>()));
		assembler.add(new LlvmLabel(new LlvmLabelValue("entry")));
		LlvmRegister R1 = new LlvmRegister(new LlvmPointer(
				LlvmPrimitiveType.I32));
		assembler.add(new LlvmAlloca(R1, LlvmPrimitiveType.I32,
				new LinkedList<LlvmValue>()));
		assembler.add(new LlvmStore(new LlvmIntegerLiteral(0), R1));

		// Statement é uma classe abstrata
		// Portanto, o accept chamado é da classe que implementa Statement, por
		// exemplo, a classe "Print".
		n.stm.accept(this);

		// Final do Main
		LlvmRegister R2 = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmLoad(R2, R1));
		assembler.add(new LlvmRet(R2));
		assembler.add(new LlvmCloseDefinition());
		return null;
	}

	public LlvmValue visit(Plus n) {
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmPlus(lhs, LlvmPrimitiveType.I32, v1, v2));
		return lhs;
	}

	public LlvmValue visit(Print n) {

		LlvmValue v = n.exp.accept(this);

		// getelementptr:
		LlvmRegister lhs = new LlvmRegister(new LlvmPointer(
				LlvmPrimitiveType.I8));
		LlvmRegister src = new LlvmNamedValue("@.formatting.string",
				new LlvmPointer(new LlvmArray(4, LlvmPrimitiveType.I8)));
		List<LlvmValue> offsets = new LinkedList<LlvmValue>();
		offsets.add(new LlvmIntegerLiteral(0));
		offsets.add(new LlvmIntegerLiteral(0));
		List<LlvmType> pts = new LinkedList<LlvmType>();
		pts.add(new LlvmPointer(LlvmPrimitiveType.I8));
		List<LlvmValue> args = new LinkedList<LlvmValue>();
		args.add(lhs);
		args.add(v);
		assembler.add(new LlvmGetElementPointer(lhs, src, offsets));

		pts = new LinkedList<LlvmType>();
		pts.add(new LlvmPointer(LlvmPrimitiveType.I8));
		pts.add(LlvmPrimitiveType.DOTDOTDOT);

		// printf:
		assembler.add(new LlvmCall(new LlvmRegister(LlvmPrimitiveType.I32),
				LlvmPrimitiveType.I32, pts, "@printf", args));
		return null;
	}

	public LlvmValue visit(IntegerLiteral n) {
		return new LlvmIntegerLiteral(n.value);
	};

	// Todos os visit's que devem ser implementados
	public LlvmValue visit(ClassDeclSimple n) {

		// Var declarations
		List<LlvmValue> vars = new ArrayList<LlvmValue>();
		List<LlvmType> types = new ArrayList<LlvmType>();
		for (util.List<VarDecl> varList = n.varList; varList != null; varList = varList.tail) {
			LlvmValue var = varList.head.accept(this);
			vars.add(var);
			types.add(var.type);
		}
		classEnv = new ClassCustomNode(n.name.s, new LlvmStructure(types), vars);
		assembler.add(classEnv.getClassDeclaration());

		// Method Declarations
		for (util.List<MethodDecl> methodList = n.methodList; methodList != null; methodList = methodList.tail) {
			methodList.head.accept(this);
		}
		return null;
	}

	// TODO
	public LlvmValue visit(ClassDeclExtends n) {
		return null;
	}

	public LlvmValue visit(VarDecl n) {
		LlvmValue value = n.type.accept(this);
		LlvmNamedValue v = new LlvmNamedValue("%" + n.name.s, value.type);
		if (methodEnv != null) {
			assembler.add(new LlvmAlloca(v, value.type,
					new LinkedList<LlvmValue>()));
		}
		// Alloca se pertence a uma declaracao de metodo
		return v;
	}

	public LlvmValue visit(MethodDecl n) {

		LlvmType returnType = n.returnType.accept(this).type;
		List<LlvmValue> args = new LinkedList<LlvmValue>();
		args.add(classEnv.getClassValue());

		for (util.List<Formal> formals = n.formals; formals != null; formals = formals.tail) {
			LlvmValue formal = formals.head.accept(this);
			args.add(formal);
		}
		
		methodEnv = classEnv.getMethodNode(n.name.s);

		// define
		assembler.add(new LlvmDefine("@__" + methodEnv.getName() + "_"
				+ classEnv.getName(), returnType, args));
		// label
		assembler.add(new LlvmLabel(new LlvmLabelValue("entry")));

		// alloc formals
		for (LlvmValue val : args) {
			if (!(val.toString().equals("%this"))) {
				LlvmRegister R1 = new LlvmRegister(new LlvmPointer(val.type));
				assembler.add(new LlvmAlloca(R1, LlvmPrimitiveType.I32,
						new LinkedList<LlvmValue>()));
				assembler.add(new LlvmStore(new LlvmIntegerLiteral(0), R1));
			}
		}

		List<LlvmValue> vars = new LinkedList<LlvmValue>();
		// alloc vars
		for (util.List<VarDecl> locals = n.locals; locals != null; locals = locals.tail) {
			LlvmValue local = locals.head.accept(this);
			vars.add(local);
		}

		// accept expr
		for (util.List<Statement> exprList = n.body; exprList != null; exprList = exprList.tail) {
			exprList.head.accept(this);
		}

		// ret
		LlvmValue returnValue = n.returnExp.accept(this);
		assembler.add(new LlvmRet(returnValue));
		assembler.add(new LlvmCloseDefinition());

		methodEnv = null;
		return null;
	}

	public LlvmValue visit(Formal n) {
		return new LlvmNamedValue("%" + n.name.s, n.type.accept(this).type);
	}

	public LlvmValue visit(IntArrayType n) {
		return new LlvmNamedValue("int[]", new LlvmPointer(
				LlvmPrimitiveType.I32));
	}

	public LlvmValue visit(BooleanType n) {
		return new LlvmNamedValue("boolean", LlvmPrimitiveType.I1);
	}

	public LlvmValue visit(IntegerType n) {
		return new LlvmNamedValue("int", LlvmPrimitiveType.I32);
	}

	// TODO
	public LlvmValue visit(IdentifierType n) {
		return null;
	}

	public LlvmValue visit(Block n) {
		for (util.List<Statement> c = n.body; c != null; c = c.tail) {
			c.head.accept(this);
		}
		return null;
	}

	public LlvmValue visit(If n) {
		int line = n.line;
		LlvmValue cmp = n.condition.accept(this);
		LlvmLabelValue trueLabel = new LlvmLabelValue("iftrue" + line);
		LlvmLabelValue elseLabel = new LlvmLabelValue("ifelse" + line);
		LlvmLabelValue endLabel = new LlvmLabelValue("ifend" + line);

		// If
		assembler.add(new LlvmBranch(cmp, trueLabel, elseLabel));
		assembler.add(new LlvmLabel(trueLabel));
		n.thenClause.accept(this);
		assembler.add(new LlvmBranch(endLabel));

		// Else
		assembler.add(new LlvmLabel(elseLabel));
		if (n.elseClause != null)
			n.elseClause.accept(this);
		assembler.add(new LlvmBranch(endLabel));

		// End
		assembler.add(new LlvmLabel(endLabel));

		return cmp;
	}

	public LlvmValue visit(While n) {
		int line = n.line;
		LlvmValue cmp = n.condition.accept(this);
		LlvmLabelValue beginLabel = new LlvmLabelValue("whileBegin" + line);
		LlvmLabelValue doLabel = new LlvmLabelValue("whileDo" + line);
		LlvmLabelValue endLabel = new LlvmLabelValue("whileEnd" + line);
		assembler.add(new LlvmBranch(beginLabel));

		assembler.add(new LlvmLabel(beginLabel));
		assembler.add(new LlvmBranch(cmp, doLabel, endLabel));

		assembler.add(new LlvmLabel(doLabel));
		n.body.accept(this);
		assembler.add(new LlvmBranch(beginLabel));

		assembler.add(new LlvmLabel(endLabel));

		return cmp;
	}

	// TODO
	public LlvmValue visit(Assign n) {
		LlvmValue val = n.exp.accept(this);
		LlvmValue var = n.var.accept(this);

		LlvmRegister R;

		// Var is from superclass
		if (methodEnv.hasLocalVariable(n.var.s)) {
			R = new LlvmRegister(var.type);
			new LlvmGetElementPointer(R, methodEnv.getSource(classEnv),
					methodEnv.getOffsetTo(n.var.s));
			// R = new LlvmRegister("%"+var.toString(),new LlvmPointer(new
			// LlvmClassType(classEnv.getName())));
		}

		// Var is from class

		// Var is local
		R = new LlvmRegister("%" + var.toString(), new LlvmPointer(var.type));
		assembler.add(new LlvmStore(val, R));

		return R;
	}

	// TODO
	public LlvmValue visit(ArrayAssign n) {
		return null;
	}

	public LlvmValue visit(And n) {
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I1);
		assembler.add(new LlvmAnd(lhs, LlvmPrimitiveType.I1, v1, v2));
		return lhs;
	}

	public LlvmValue visit(LessThan n) {
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmIcmp(lhs, LlvmIcmp.ULT, LlvmPrimitiveType.I32,
				v1, v2));
		return lhs;
	}

	public LlvmValue visit(Equal n) {
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmIcmp(lhs, LlvmIcmp.EQ, LlvmPrimitiveType.I32, v1,
				v2));
		return lhs;
	}

	public LlvmValue visit(Minus n) {
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmMinus(lhs, LlvmPrimitiveType.I32, v1, v2));
		return lhs;
	}

	public LlvmValue visit(Times n) {
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmTimes(lhs, LlvmPrimitiveType.I32, v1, v2));
		return lhs;
	}

	// TODO
	public LlvmValue visit(ArrayLookup n) {
		return null;
	}

	// TODO
	public LlvmValue visit(ArrayLength n) {
		return null;
	}

	// TODO
	public LlvmValue visit(Call n) {
		return null;
	}

	public LlvmValue visit(True n) {
		return new LlvmBool(LlvmBool.TRUE);
	}

	public LlvmValue visit(False n) {
		return new LlvmBool(LlvmBool.FALSE);
	}

	// TODO
	public LlvmValue visit(IdentifierExp n) {
		return null;
	}

	public LlvmValue visit(This n) {
		return new LlvmNamedValue("%this", new LlvmPointer(new LlvmClassType(
				classEnv.getName())));
	}

	// TODO
	public LlvmValue visit(NewArray n) {
		return null;
	}

	// TODO
	public LlvmValue visit(NewObject n) {
		return null;
	}

	public LlvmValue visit(Not n) {
		LlvmValue v = n.exp.accept(this);
		LlvmBool b = new LlvmBool(LlvmBool.TRUE);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I1);
		assembler.add(new LlvmXor(lhs, LlvmPrimitiveType.I1, v, b));
		return lhs;
	}

	// TODO
	public LlvmValue visit(Identifier n) {
		return new LlvmNamedValue(n.s, LlvmPrimitiveType.I32);
	}
}

/**********************************************************************************/
/*
 * === Tabela de Símbolos ====
 */
/**********************************************************************************/

class SymTab extends VisitorAdapter {
	public Map<String, ClassNode> classes;
	private ClassNode classEnv; // aponta para a classe em uso

	public LlvmValue FillTabSymbol(Program n) {
		n.accept(this);
		return null;
	}

	public LlvmValue visit(Program n) {
		n.mainClass.accept(this);

		for (util.List<ClassDecl> c = n.classList; c != null; c = c.tail)
			c.head.accept(this);

		return null;
	}

	public LlvmValue visit(MainClass n) {
		classes = new HashMap<String, ClassNode>();
		classes.put(n.className.s, new ClassCustomNode(n.className.s, null,
				null));
		return null;
	}

	public LlvmValue visit(ClassDeclSimple n) {
		List<LlvmType> typeList = null;
		// Constroi TypeList com os tipos das variáveis da Classe (vai formar a
		// Struct da classe)

		List<LlvmValue> varList = null;
		// Constroi VarList com as Variáveis da Classe

		classes.put(n.name.s, new ClassCustomNode(n.name.s, new LlvmStructure(
				typeList), varList));
		// Percorre n.methodList visitando cada método
		return null;
	}

	public LlvmValue visit(ClassDeclExtends n) {
		return null;
	}

	public LlvmValue visit(VarDecl n) {
		return null;
	}

	public LlvmValue visit(Formal n) {
		return null;
	}

	public LlvmValue visit(MethodDecl n) {
		return null;
	}

	public LlvmValue visit(IdentifierType n) {
		return null;
	}

	public LlvmValue visit(IntArrayType n) {
		return null;
	}

	public LlvmValue visit(BooleanType n) {
		return null;
	}

	public LlvmValue visit(IntegerType n) {
		return null;
	}
}

interface ClassNode {
	String getName();

	public MethodNode getMethodNode(String methodName);

	public LlvmNamedValue getClassValue();
	
	public LlvmClassType getClassType();

	public LlvmStructure getStructure();

	public LlvmInstruction getClassDeclaration();
}

class ClassCustomNode extends LlvmType implements ClassNode {
	private String name;
	private LlvmStructure structure;

	public ClassCustomNode(String nameClass, LlvmStructure structure,
			List<LlvmValue> varList) {
		this.name = nameClass;
		this.structure = structure;
	}

	public String getName() {
		return name;
	}

	public LlvmClassType getClassType() {
		return new LlvmClassType(this.name);
	}
	
	public LlvmNamedValue getClassValue() {
		return new LlvmNamedValue("%this", getClassType());
	}

	@Override
	public MethodNode getMethodNode(String methodName) {
		return null;
	}

	@Override
	public LlvmStructure getStructure() {
		// TODO Auto-generated method stub
		return structure;
	}

	@Override
	public LlvmInstruction getClassDeclaration() {
		// TODO Auto-generated method stub
		return new LlvmInstruction() {
			public String toString() {
				return getClassType() + " = type " + getStructure();
			}
		};
	}
}

class ClassEnvNode extends LlvmType implements ClassNode {
	private ClassInfo info;

	public ClassEnvNode(ClassInfo info) {
		this.info = info;
	}

	public String getName() {
		return info.name.toString();
	}

	public MethodNode getMethodNode(String methodName) {
		return new MethodEnvNode(info.methods.get(Symbol.symbol(methodName)));
	}

	@Override
	public LlvmClassType getClassType() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LlvmStructure getStructure() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LlvmInstruction getClassDeclaration() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LlvmNamedValue getClassValue() {
		// TODO Auto-generated method stub
		return null;
	}
}

interface MethodNode {
	public String getName();

	public String getStructure();

	public Boolean hasLocalVariable(String name);

	public LlvmValue getSource(ClassNode classEnv);

	public List<LlvmValue> getOffsetTo(String name);
}

class MethodCustomNode extends LlvmType implements MethodNode {
	public MethodCustomNode(String nameMethod, List<LlvmValue> formalList,
			List<LlvmValue> varList) {
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getStructure() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean hasLocalVariable(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LlvmValue getSource(ClassNode classEnv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LlvmValue> getOffsetTo(String name) {
		// TODO Auto-generated method stub
		return null;
	}
}

class MethodEnvNode extends LlvmType implements MethodNode {

	private MethodInfo info;

	MethodEnvNode(MethodInfo info) {
		this.info = info;
	}

	public String getName() {
		return info.name.toString();
	}

	public Boolean hasLocalVariable(String name) {
		if (info.formalsTable.get(Symbol.symbol(name)) == null
				&& info.localsTable.get(Symbol.symbol(name)) == null) {
			return false;
		}

		return true;
	}

	@Override
	public LlvmValue getSource(ClassNode classEnv) {
		// TODO Auto-generated method stub
		return new LlvmNamedValue("%this", new LlvmPointer(new LlvmClassType(
				classEnv.getName())));
	}

	@Override
	public List<LlvmValue> getOffsetTo(String name) {
		List<LlvmValue> offsets = new LinkedList<LlvmValue>();
		for (util.List<VarInfo> locals = info.locals; locals != null; locals = locals.tail) {
			VarInfo local = locals.head;

		}
		return null;
	}

	@Override
	public String getStructure() {
		// TODO Auto-generated method stub
		return null;
	}
}