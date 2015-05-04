// atributo e local com mesmo nome(OK)
class m110
{
    public static void main(String[] args)
    {
    	System.out.println(new c().i(1));
    }
}

class c
{
	int p;
	int q;
	public int i(int a){
		int q;
		int r;
		int[] b;
		b = new int[4];
		p = 20;
		q = 300;
		r = 4000;
		b[0] = 50000;
		// System.out.println(p);
		return p+q+r+a+b[0];
	}
}
