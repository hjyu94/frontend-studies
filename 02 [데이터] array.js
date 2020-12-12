// Array 객체 생성, 사용
// (1) push, pop 을 이용하는 Stack 형태
var nums = new Array();
nums.push(5);
nums.push(10);
nums.push(21);
var n1 = nums.pop();
var n2 = nums.pop();
var n3 = nums.pop();

// (2) 인덱스를 이용한 List 형태
var nums = new Array();
nums[0] = 5;
nums[1] = 10;
nums[2] = 21;
console.log(nums[0]);
console.log(nums[1]);
console.log(nums[2]);

var nums = new Array();
nums[3] = 5; // 0번째부터 넣어야 하는건가?
console.log(nums.length); // 0, 1, 2 는 undefined 로 채워짐. length: 4

// Array 초기화, 조작
var nums = new Array();
var nums = new Array(5);
var nums = new Array(5, 10, 21);
var nums = new Array(5, 10, 21, "hello");
console.log(typeof nums[3]);
var nums = new Array(5, 10, 21, "hello", new Array(2,3,4));
console.log(nums[4][1]);

// splice() 삭제, 삽입
var nums = new Array(5, 10, 21, "hello");
nums.splice(1); // nums[1] 이후가 다 지워짐 // [5]
nums.splice(1, 1); // nums[1] 이후로 1개만 지워짐 // [5, 21, "hello"]
nums.splice(1, 2); // nums[1] 이후로 2개가 지워짐 // [5, "hello"]
nums.splice(3, 1, "hoho"); // nums[3] 이후로 1개를 지우고 "hoho" 삽입 // [5, 10, 21, "hoho"]
nums.splice(3, 0, "hoho"); // nums[3] 이후로 0개를 지우고 "hoho" 삽입 // [5, 10, 21, "hello", "hoho"]
