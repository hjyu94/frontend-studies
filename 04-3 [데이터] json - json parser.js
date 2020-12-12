// 사실 eval()은 자바스크립트의 코드를 실행해주는 역할을 하는 함수이지
// json 을 파싱해주는데 사용하려는 목적으로 만든 함수는 아니다.

// 여태까지는 object의 key(컬럼, 속성)에 해당하는 값을 문자열로 사용했었는데 (-> JSON 규칙)
// 문자열이 아니어도 사용 가능하긴 하다.
// {"id":1, "title":"hello json1"}
// == {id:1, title:"hello json1"}

// 문자열로 써야하는 케이스가 있기는 하다
var data = {"n id":1, title:"aaa"};
console.log(data.n id); // X
console.log(data["n id"]); // O

// 문법 구조가 JSON 형태에 맞다면 자바스크립트의 데이터 형태로 변경해준다.
// 단 파라미터로 들어온 값에서 키 값이 문자열이 아니라면 제대로 동작하지 않는다.
var rv = JSON.parse('{id:1, title:"aaa"}');
console.log(rv.title); // X

var rv2 = JSON.parse('{"id":1, "title":"aaa"}');
console.log(rv2.title); // O

var data2 = {id:2, title:"bbb"};
var json = JSON.stringify(data2);
console.log(json); // {"id":2, "title":"bbb"};
