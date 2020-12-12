window.addEventListener("load", function() {
	var section2 = document.getElementById("section2");
	var inputs = section2.getElementsByTagName("input");

	var txtX = inputs[0];
	var txtY = inputs[1];
	var btnAdd = inputs[2];
	var txtSum = inputs[3];

	btnAdd.onclick = function () {
		var x = parseInt(txtX.value);
		var y = parseInt(txtY.value);

		txtSum.value = x+y;
	}
});