/* 
    function add(x,y) { return x+y; };

    var sum = add(2,3);
    var sum = add(2, 3, "hello", 3, 4, 5, 6, 7, 87); // ???????????
*/

function add(x, y) {
    return x + y;
}

console.log(add(6,4,5,6,7,"hello"));
/*
    에러 안남!

    자바 스크립트는 매개변수는 다른 Java 나 C 와 같은 언어와 의미가 다르다
    매개변수는 값을 받는 그릇으로써의 역할을 하지 않는다.

    자바 스크립트는 데이터가 전부다 객체이기 때문에
    매개변수는 담는 그릇이 아니라 참조하는 역할을 할 뿐.
    넘겨지는 인자들은 가변으로 받을 수 있는 "컬렉션"이 있는 것

    내부적으로는 function 객체 안에 사용할 수 있는 arguments 라는 컬렉션이 있고
    넘겨진 인자들을 차곡 차곡 쌓아놓는다.
*/
function add(x, y) {
    console.log("length: " + arguments.length);
    let string = "";
    for(i in arguments) {
        string += arguments[i] + ", ";
    }
    console.log(string);
    return x + y;
}
console.log(add(6,4,5,6,7,"hello"));