window.addEventListener("load", function() {
	var section4 = document.querySelector("#section4");

	// .box1
	var box1 = section4.querySelector(".box1");

	var input1 = box1.childNodes[0];
	var input2 = box1.childNodes[1];

	input1.value = "hello";
	input2.value = "okay";

	// .box2
	var box2 = section4.querySelector(".box2");

	var input1 = box2.childNodes[0];
	var input2 = box2.childNodes[1];

	input1.value = "hello";
	input2.value = "okay";
});

// 주석과 text 노드이기 때문에 사이에 whitespace(줄바꿈) 가 노드로 추가된 것 
// 따라서 주석이나 텍스트는 제외해야 하는 경우에는
// childNodex[i] 대신에 childeren[i] 을 사용해야 한다!