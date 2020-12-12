window.addEventListener("load", function() {
	var section3 = document.getElementById("section3");

	var txtX = section3.querySelector("input[name='x']");
	var txtY = section3.querySelector(".txt-y");
	var btnAdd = section3.querySelector(".btn-add");
	var txtSum = section3.querySelector(".txt-sum");

	btnAdd.onclick = function () {
		var x = parseInt(txtX.value);
		var y = parseInt(txtY.value);

		txtSum.value = x+y;
	}
});
