// 원격 문서에서 데이터를 가지고 올 때 문자열로 가지고 오게 된다.
// 여러 줄을 하나의 문자열로 만들고 싶을 땐 한칸 띄고 역슬러시로 묶는다.
var data = '[ \
                {"id":1, "title":"hello json1"}, \
                {"id":2, "title":"hello json2"}, \
                {"id":3, "title":"hello json3"} \
            ]';

// data[0].title; 로 가지고 올 수 없다.
// 이럴 때 eval() 을 사용한다.

'var x = 30;';
console.log(x); // undefined

eval('var x = 30;');
console.log(x); // 30

// 위의 케이스를 이용해서 data 에 적용해보자
eval("var ar = " + data + ";");
console.log(data[0]);