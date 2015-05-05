// heranca entre duas classes (OK)
class m209
{
    public static void main(String[] args)
    {
    	System.out.println(new a().i());
    }
}

class a extends b
{
	int vary;
	public int i() {
		var = 10;
	   	return this.g();
	}
	
	public int g() {
		return var;
	}
}

class b
{
	b cl;
	int other;
	int another;
	int var;
   public int i() { var = 5; return var; }
}