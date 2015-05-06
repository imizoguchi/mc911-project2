// heranca entre cinco classes (OK)
class m210
{
    public static void main(String[] args)
    {
    	System.out.println(new z().i());
    }
}

class z extends a
{
   public int i() {
	   x = 2;
	   y1 = 1;
	   y2 = 2;
	   y3 = 3;
	   y11 = 11;
	   y22 = 22;
	   y33 = 33;
	   System.out.println(y11);
	   return 999;
	   }
}

class a extends b
{
	int y1;
	int y2;
	int y3;
   public int i() {
	   return 0;
	   }
}

class b extends c
{
   public int i() { return 0; }
}

class c extends d
{
	int y11;
	int y22;
	int y33;
   public int i() { return 2; }
}

class d extends e
{
	int x;
   public int i() { return 3; }
}

class e extends m210
{
   public int i() { return 4; }
}