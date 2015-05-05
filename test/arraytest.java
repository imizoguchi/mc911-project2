// atributo e local com mesmo nome(OK)
class m110
{
    public static void main(String[] args)
    {
    	System.out.println(new testeArray().i(1));
    }
}

class testeArray
{
	int[] b;
	int p;
	int q;
	
	public int i(int a){
		int q;
		int r;
		int size;
		int i;
		i = 0;
		size = 20;
		b = new int[size];
		p = 20;	
		q = 300;
		r = 4000;
		b[0] = 50000;
//		b[1] = 600000;
//		b[2] = 7000000;
//		b[3] = 80000000;
//		
		i = this.arrayAssign();
		
		i = this.printArray();
		
		System.out.println(b.length);
		return p+q+r+a+b[0]+b[1]+b[2]+b[3];
	}
	
	public int arrayAssign() {
		int i;
		int base;
		int num;
		i = 1;
		base = 100000;
		num = 6;
		
		while(i < b.length) {
			b[i] = base*num;
			base = base * 10;
			num = num + 1;
			i = i + 1;
		}
		
		return 0;
	}
	
	public int printArray() {
		int i;
		i = 0;
		System.out.println(b.length);
		while(i < b.length) {
			System.out.println(b[i]);
			i = i + 1;
		}
		
		return 0;
	}
}
