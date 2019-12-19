package org.smy.Vocabulary;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Scanner;

import javax.swing.JOptionPane;
/**
 * 	@fn		public class vocaword 
 * 
 *	@brief	변수선언
 *
 *	@details	단어 출제를 위한 변수 선언
 *
 *	@author	김설규
 *	@date	2019-10-24
 
 *	@param 	String text, korean, input, count, save, test, gotword, score
 *
 *	@remark	상단 부터 뜻과 영어 단어를 저장하는 변수, 단어의 개수를 세는 변수, 출제된 단어를 적을 변수, 틀린 단어를 적을 변수, 출제할 단어의 변호를 임시저장할 변수, 틀린 개수를 세는 변수 [2019-10-24; 김설규] \n
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
	 *	@brief .txt 파일을 스캔
	 *
	 *	@details
	 *
	 *	@author	김설규
	 *	@date	2019-10-24
	 
	 *	@param 	ip 참조할 파일 위치
	 *
	 *	@remark	Scanner s 스캔될 파일의 위치 변수 저장 [2019-10-24; 김설규] \n
	 *
	 */
 public static void main(String[] args){
  
  try{
   FileInputStream ip = new FileInputStream("./word.txt");
   InputStreamReader inputStreamReader = new InputStreamReader(ip, "UTF-8");
   BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
   
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
 	 *	@brief	문제출제
 	 *
 	 *	@details	문제를 출제하고 문제를 틀렸다고 표시 틀린 갯수 추가
 	 *
 	 *	@author	김설규
 	 *	@date	2019-10-24
 	 
 	 *	@param 	j, count, score
 	 *
 	 *	@remark	j 문제 변수을 이용해 반복 count 변수를 이용해 출제될 문제 수, score 틀린문제 변수 [2019-10-24; 김설규] \n
 	 *
 	 */
  for(int j =0;j <count;j++){
   random();
            input[gotword] = JOptionPane.showInputDialog(j+1+": "+korean[gotword]+"             틀린횟수 : "+score);
            if(!(text[gotword].equalsIgnoreCase(input[gotword]))){
             test[gotword] = true;
             score+=1;
            }
  }
  /**
	 * 	@fn		for(int j=0; j<count; j++), if(test[j]), JOptionPane.showInputDialog(korean[j]+" : "+text[j]);
	 * 
	 *	@brief	틀린 문제 출제
	 *
	 *	@details	문제를 출제하고 문제를 틀렸다고 표시 틀린 갯수 추가
	 *
	 *	@author	김설규
	 *	@date	2019-10-24
	 
	 *	@param 	j, count
	 *
	 *	@remark	j 문제 변수을 이용해 반복 count 변수를 이용해 틀린 문제 수 [2019-10-24; 김설규] \n
	 *
	 */
  for(int j=0; j<count; j++){
	   if(test[j]){ 
	    for(int i =0; i<3;i++) 
	    JOptionPane.showInputDialog("틀린 단어 = " + korean[j]+" : "+text[j]); 
	   }
  }
 }
 /**
	 * 	@fn		int got = (int)(Math.random()*count+0);
	 * 
	 *	@brief	문제 랜덤 출제
	 *
	 *	@details	랜덤하게 단어를 뽑아내고, 이미 출제된 번호라면 다시 뽑고 중복 된게 아니면 출제 됬다고 표시 후 임시저장
	 *
	 *	@author	김설규
	 *	@date	2019-10-24
	 
	 *	@param 	count, got, save, gotword
	 *
	 *	@remark	 랜덤하게 단어를 뽑아내고, 이미 출제된
	 * 번호라면 다시 뽑고 중복 된게 아니면 출제 됬다고 표시 후 임시저장 [2019-10-24; 김설규] \n
	 *
	 */
 
 static void random(){
  int got = (int)(Math.random()*count+0); //랜덤하게 단어를 뽑아낸다.
  if(save[got]){//만약 이미 출제된 번호라면
   random(); //다시 번호를 뽑아낸다
  }else{//출제된 단어가 아니라면
   save[got]=true;//출제가 됬다고 표시를 하고,
   gotword = got;//출제될 단어를 임시저장한다.
  }
  return;
 }
}