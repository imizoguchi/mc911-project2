package llvmast;
public class LlvmClassType extends LlvmType {
	String name;
	
	public LlvmClassType(String name) {
		this.name = name;
	}
	
	public String toString(){
		return "%class."+name;
	}
}