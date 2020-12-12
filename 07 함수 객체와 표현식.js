/*
    자바 스크립트는 함수를 정의하지 않고 함수를 만든다고 한다.
    
    int add(int x, int y) { return x+y; } // X

    var add = new Function("x, y", "return x+y;"); // javascript !!!
    alert(add(3,4));
*/
var add = new Function("x, y", "return x+y;"); // 원래는 이게 정석인데...
console.log(add(3,4));

/*
    많은 사람, 입문자들에게 함수가 객체라고 설명하면 힘들어함. 
    따라서 더 쉬운 방식인 여러가지 표현식이 발달했음
    내부적으론 함수 객체를 만들어 주겠지만 다른 방식으로 표현 할 수 있는 것.

    var add = function (x,y) { return x+y; }
    function add(x, y) { return x+y; }
*/

var add = function(x, y) {
    return x+y;
}; // ; 필요
console.log(add(3,4));


function add(x, y) {
    return x+y;
} // ; 필요 없음
console.log(add(3,4));

/*
    알아야 할 포인트! 함수도 객체이다!
*/