// 자바 스크립트는 모든 데이터가 객체로 되어 있고 이를 참조하기 위한 변수가 필요하다

// 다른 언어에서는 변수를 선언하고 true 라는 값을 변수에 대입한다고 하는데
// 자바 스크립트에서는 대입이란 개념이 없고, 
// 값을 저장할 수 있는 공간을 가지지 않는다 
// 자바스크립트의 모든 변수들은 참조 변수가 되고 
// 참조변수는 값을 저장할 수 없으니 new 를 통해서 Boolean 형 객체로 true 를 박싱함 
// 박싱한 놈을 n 이라는 변수가 참조하게 된다.
var n = new Boolean(true);

// Wrapper 클래스를 통해 값들을 박싱해야 한다.
var n = new Number(3);
var s = new String("hello");
var ar = new Array();
var obj = new Object();

// x, y, z -> 참조 변수 (레퍼런스 변수, &, 주소를 따로 가지지 않는다)
var x = 3; // var x = new Number(3);
var y = 3.7; // var y = new Number(3.7);

console.log(x + y);

var x = 'A';
var x = "Hello";

var z; // undefined // 객체를 참조해야 하는데 참조해야 할 대상이 정해지지 않았다.
console.log(z == "undefined")
console.log(z == undefined)

