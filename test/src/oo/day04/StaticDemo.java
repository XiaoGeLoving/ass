package oo.day04;
//static����ʾ
public class StaticDemo {
	public static void main(String[] args) {
		Loo o1 = new Loo();
		o1.show();
		Loo o2 = new Loo();
		o2.show();
		System.out.println(Loo.b); //����ͨ������������
		System.out.println(o1.b);  //������ͨ������������
		
		Moo.test(); //��̬����ͨ��������������
		
		Noo o3 = new Noo();
		Noo o4 = new Noo();
		
	}
}


class Noo{
	static{
		System.out.println("��̬��");
	}
	Noo(){
		System.out.println("���췽��");
	}
}










class Moo{ //��ʾ��̬����
	int a;
	static int b;
	void show(){
		a = 1;
		b = 2;
	}
	static void test(){ //û����ʽ��this
		//a = 1; //û��this��ζ��û�ж��󣬶�a����ͨ�����������ʣ����Դ˴����ܷ���
		b = 2;
	}
}

class Loo{ //��ʾ��̬����
	int a;
	static int b;
	Loo(){
		a++;
		b++;
	}
	void show(){
		System.out.println("a="+a);
		System.out.println("b="+b);
	}
}













