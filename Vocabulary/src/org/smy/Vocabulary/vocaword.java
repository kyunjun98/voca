package org.smy.Vocabulary;

import java.io.FileInputStream;
import java.util.Scanner;

import javax.swing.JOptionPane;
/**
 * 	@fn		public class vocaword 
 * 
 *	@brief	��������
 *
 *	@details	�ܾ� ������ ���� ���� ����
 *
 *	@author	�輳��
 *	@date	2019-10-24
 
 *	@param 	String text, korean, input, count, save, test, gotword, score
 *
 *	@remark	��� ���� ��� ���� �ܾ �����ϴ� ����, �ܾ��� ������ ���� ����, ������ �ܾ ���� ����, Ʋ�� �ܾ ���� ����, ������ �ܾ��� ��ȣ�� �ӽ������� ����, Ʋ�� ������ ���� ���� [2019-10-24; �輳��] \n
 *
 */
public class vocaword {
 static String text[]= new String[100],korean[] = new String[100], input[] = new String[100];
 static int count=0;
 static boolean[] save = new boolean[100];
 static boolean test[];
 static int gotword;
 static int score;
 
 /**
	 * 	@fn		public static void main(String[] args)
	 * 
	 *	@brief .txt ������ ��ĵ
	 *
	 *	@details
	 *
	 *	@author	�輳��
	 *	@date	2019-10-24
	 
	 *	@param 	ip ������ ���� ��ġ
	 *
	 *	@remark	Scanner s ��ĵ�� ������ ��ġ ���� ���� [2019-10-24; �輳��] \n
	 *
	 */
 public static void main(String[] args){
  
  try{
   FileInputStream ip = new FileInputStream("./word.txt");
   
   Scanner s = new Scanner(ip);
   
   while(true){
    if(s.hasNext()){    
     text[count] = s.next();
     korean[count] = s.next();
     count+=1;
     
    }else{
     break;
    }
   }
   
   }catch(Exception e){
    e.printStackTrace();
  }
  save = new boolean[count];
  test = new boolean[count];
  /**
 	 * 	@fn		for(int j =0;j <count;j++), if(!(text[gotword].equalsIgnoreCase(input[gotword]))), score+=1;
 	 * 
 	 *	@brief	��������
 	 *
 	 *	@details	������ �����ϰ� ������ Ʋ�ȴٰ� ǥ�� Ʋ�� ���� �߰�
 	 *
 	 *	@author	�輳��
 	 *	@date	2019-10-24
 	 
 	 *	@param 	j, count, score
 	 *
 	 *	@remark	j ���� ������ �̿��� �ݺ� count ������ �̿��� ������ ���� ��, score Ʋ������ ���� [2019-10-24; �輳��] \n
 	 *
 	 */
  for(int j =0;j <count;j++){
   random();
            input[gotword] = JOptionPane.showInputDialog(j+1+": "+korean[gotword]+"             Ʋ��Ƚ�� : "+score);
            if(!(text[gotword].equalsIgnoreCase(input[gotword]))){
             test[gotword] = true;
             score+=1;
            }
  }
  /**
	 * 	@fn		for(int j=0; j<count; j++), if(test[j]), JOptionPane.showInputDialog(korean[j]+" : "+text[j]);
	 * 
	 *	@brief	Ʋ�� ���� ����
	 *
	 *	@details	������ �����ϰ� ������ Ʋ�ȴٰ� ǥ�� Ʋ�� ���� �߰�
	 *
	 *	@author	�輳��
	 *	@date	2019-10-24
	 
	 *	@param 	j, count
	 *
	 *	@remark	j ���� ������ �̿��� �ݺ� count ������ �̿��� Ʋ�� ���� �� [2019-10-24; �輳��] \n
	 *
	 */
  
  for(int j=0; j<count; j++){
   if(test[j]){ 
    for(int i =0; i<5;i++) 
    JOptionPane.showInputDialog(korean[j]+" : "+text[j]); 
   }
  }
 }
 /**
	 * 	@fn		int got = (int)(Math.random()*count+0);
	 * 
	 *	@brief	���� ���� ����
	 *
	 *	@details	�����ϰ� �ܾ �̾Ƴ���, �̹� ������ ��ȣ��� �ٽ� �̰� �ߺ� �Ȱ� �ƴϸ� ���� ��ٰ� ǥ�� �� �ӽ�����
	 *
	 *	@author	�輳��
	 *	@date	2019-10-24
	 
	 *	@param 	count, got, save, gotword
	 *
	 *	@remark	 �����ϰ� �ܾ �̾Ƴ���, �̹� ������ ��ȣ��� �ٽ� �̰� �ߺ� �Ȱ� �ƴϸ� ���� ��ٰ� ǥ�� �� �ӽ����� [2019-10-24; �輳��] \n
	 *
	 */
 
 static void random(){
  int got = (int)(Math.random()*count+0); //�����ϰ� �ܾ �̾Ƴ���.
  if(save[got]){//���� �̹� ������ ��ȣ���
   random(); //�ٽ� ��ȣ�� �̾Ƴ���
  }else{//������ �ܾ �ƴ϶��
   save[got]=true;//������ ��ٰ� ǥ�ø� �ϰ�,
   gotword = got;//������ �ܾ �ӽ������Ѵ�.
  }
  return;
 }
}
