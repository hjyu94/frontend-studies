var x = 3; 
// 대입이 아니라 3이라는 값을 박싱해서 그 박스를 참조변수가 가리킴
// x는 박스의 이름

var y = 3; 
// 이 경우 3이라는 값을 박싱하는 박스를 하나 더 만드는걸까?? 
// Nope. 이전에 3이라는 값을 감쌌던 박스를 가리키는 다른 참조변수
// 예전에 만든 박스의 재활용임

// x 와 y 를 비교를 할 때 값이 같은지, 박스가 같은지에 대한 비교 연산이 필요하다

document.write(x == y); // 값이 같은가? // true
document.write(x === y); // 주소(박스)가 같은가? // true

// 다른 박스를 만들고 싶을 때?
var x2 = 3;
var y2 = new Number(3); // new Number(); 직접 박스를 따로 만드는 방식

document.write(x2 == y2); // true
document.write(x2 === y2); // false


document.write(3 + 4 * 2); // 11
document.write(3 + "4"); // 34
document.write(3.5 + "4"); // 3.54
document.write(3 - "2"); // 1
document.write(3.5 - "2"); // 1.5
document.write(5 < 3 + 4); // 우선순위에 따라서 3 + 4 가 먼저 연산됨. true
document.write("32" > "4"); // false
document.write(32 > "4"); // true