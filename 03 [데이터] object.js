// Object 객체
// C++, C#, Java -> Object 는 클래스란 것으로 형식을 정의하고 만들어 내는 것
// Javascript -> 객체를 만들고 이후에 정의를 한다. -> prototype 이란 것이 있다.
 
// 그냥 객체를 만들고 . 찍어서 만든다. (Expand Object)
var exam = new Object();
exam.kor = 30;
exam.eng = 70;
exam.math = 80;
console.log(exam.kor + exam.eng);

// 키를 이용한 데이터 관리 Map
// cf) Array 는 선형, Object 는 해쉬형
var exam = new Object();
exam["kor"] = 30;
exam["eng"] = 70;
exam["math"] = 80;
