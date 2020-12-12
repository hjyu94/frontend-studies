var ar = ["철수", "영희", "맹구", "동천"];

for(var i=0; i<ar.length; i++)
    console.log(ar[i]+"<br />");

// for in
// 배열에서 값을 가지고 올 때나, 객체에서 값을 가지고 올 때 모두 순회할 수 있도록
// 데이터가 아니라 키 값을 돌면서 순회한다.

for(i in ar) // value 가 나오는게 아니라 key, index가 나온다.
    console.log(ar[i]+"<br />");

var ob = {id:1, title:"hello", writeId:"hjeong"};
for (i in ob)
    console.log(ob[i]+"<br />");

