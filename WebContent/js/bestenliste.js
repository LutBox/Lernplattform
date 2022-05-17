/**
 * Erstellt von Lukas Theinert
 */

"use strict";

document.addEventListener("DOMContentLoaded", init);
function init() {
	document.getElementById("button").addEventListener("click", changeContent);
}

function changeContent() {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		console.log("Callback reached with status " + xmlhttp.status + " and readyState " + xmlhttp.readyState);
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("serverzeit").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BestenlisteBilderMemorieAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();
	
}