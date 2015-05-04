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
		b[1] = 600000;
		b[2] = 7000000;
		b[3] = 80000000;
		// System.out.println(p);
		return p+q+r+a+b[0]+b[1]+b[2]+b[3];
	}
}
