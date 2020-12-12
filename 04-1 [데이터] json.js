// [JSON] (JavaScript Object Notation - 표기법)
// 자바 스크립트에서 변수는 모두 참조변수이다. 값을 저장할 공간을 갖지 않는다.
// 따라서 new 를 이용해 데이터를 생성하고 이를 가리키는 참조변수를 사용하는데
// 쓸 때 매번 귀찮게 쓰기 귀찮으니 줄여서 표현할 수 있다 -> JSON
// 마치 대입처럼 보이나 내부적으로는 참조하는 과정이다.
var n = true;       // var n = new Boolean(true);
var n = 3;          // var n = new Number(3);
var s = "hello";    // var s = new String("hello"); // 자바스크립트에서는 "", '' 가 같다
var s = 'hello';    // var s = new String("hello");
var ar = [];        // var ar = new Array();
var ob = {};        // var obj = new Object();

var exam = {"kor":30, "eng":70, "math":80};
exam.kor = 30;

var ar = [3,4,5,6,exam,[7,8,9]]; // 배열안에 배열이나 객체를 넣을 수 있다.
console.log(ar[4].math);
console.log(ar[5][1]);

// 중첩된 데이터의 구조도 쉽게 표현할 수 있다.
// 3개의 객체가 있다고 하자
var obj1 = {"id":1, "title":"hello json1"};
var obj2 = {"id":2, "title":"hello json2"};
var obj3 = {"id":3, "title":"hello json3"};

// 얘를 JSON 형태로 배열에 담아서 표시하게 되면
var notices = [
    {"id":1, "title":"hello json1"},
    {"id":2, "title":"hello json2"},
    {"id":3, "title":"hello json3"}
];

// 데이터를 꺼내 쓰기 쉽다.
console.log(notices[1].title);


// ### 데이터를 구분하기 위한 표현방법
// JSON은 자바스크립트의 범위를 벗어나서 모든 영역에서 데이터를 표현할 수 있을 때 쓰여지게 되었다.

// (1) XML: 코드량이 많아져서 복잡
<noticies>
        <notice id="1" title="hello json1" />
        <notice id="2" title="hello json2" />
        <notice id="3" title="hello json3" />
</noticies>

// (2) CSV: 단순하고 가볍긴 한데 복잡한 데이터를 표현하기 어렵다.
1, hello json1
2, hello json2
3, hello json3

// (3) JSON: 단순하게 쓰면서 복잡한 데이터도 표현할 수 있다는 장점이 있다.
[
    {"id":1, "title":"hello json1"},
    {"id":2, "title":"hello json2"},
    {"id":3, "title":"hello json3"}
];