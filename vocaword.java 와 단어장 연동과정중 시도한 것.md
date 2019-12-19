## vocaword.java 와 단어장 연동과정중 시도한 것

###### 기존에 구현되어있던 단어장과 별개로 vocaword.java(영단어 테스트 프로그램) 이 개발되어 있었기 때문에 두개를 어떻게 합칠지 고민을 했음.

1. vocaword.java 가 word.txt파일을 긁어와서 거기에 저장된 단어들로 단어를 출제하는 java application으로 실행되는 프로그램임. java application으로 실행되는 자바파일과 jsp를 연동할 수 있는지 찾아보았으나 방법을 못찾음.

2. mysql 쿼리를 사용해서 단어장에 저장되어있는 단어 데이터를 word.txt로 export 해서 사용할 수 있나 싶어서 해보았으나                                                                                                                 `SELECT word, description
   INTO OUTFILE '/tmp/word.txt'
   FIELDS TERMINATED BY '\t'
   FROM Vocabulary;`

   

   Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement 0.000 sec

   해당 오류로 인해 쿼리가 작동되지도 않음.

   오류 해결법  https://sssunho.tistory.com/56 을 참고해보았으나 변수 설정된 경로가 변경이안됨.

   

   workbench 내부에 있는 export 기능으로 해보아도 저장되는 양식 그대로 사용하면 vocaword.java가 실행이 안되기 때문에 포기.

3. ##### java application 자체를 JSP나 HTML형식의 웹페이지에서 자동 실행되게끔 할 수 있는지 구글링해봤더니 외부파일 자체는 JSP상에서 실행시킬 수 없다고함.

4. **그래서 java파일을 exe로 변환 후 임시 word.txt파일과 사용법을 첨부해서 zip파일로 압축해 다운로드 링크를 vocabulary_list.jsp에 걸어두었음.  (vocabulary_list.jsp에 id부분을 없앤 이유는 사용법을 보면 알겠지만 그대로 복붙할 시 word.txt에 id까지 복사되기때문에 없애버리고 수정링크를 단어부분에 달아둠)**