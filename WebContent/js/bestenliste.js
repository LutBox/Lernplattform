/*
 * Erstellt von Lukas Theinert
 */

"use strict";

document.getElementById("bilderMemorie").onclick = function() {
		
	if (!document.getElementById("bilderMemorie").checked) {
		document.getElementById("bilderMemorieTabelle").style.display = 'none';
	}
	if (document.getElementById("bilderMemorie").checked) {
		document.getElementById("bilderMemorieTabelle").style.display = 'block';
	}
}

document.getElementById("bilderOrdnen").onclick = function() {
	
	if (!document.getElementById("bilderOrdnen").checked) {
		document.getElementById("bilderOrdnenTabelle").style.display = 'none';
	}
	if (document.getElementById("bilderOrdnen").checked) {
		document.getElementById("bilderOrdnenTabelle").style.display = 'block';
	}
}

document.getElementById("bilderWort").onclick = function() {
	
	if (!document.getElementById("bilderWort").checked) {
		document.getElementById("bilderWortTabelle").style.display = 'none';
	}
	if (document.getElementById("bilderWort").checked) {
		document.getElementById("bilderWortTabelle").style.display = 'block';
	}
}

document.getElementById("jumpnrun").onclick = function() {
	
	if (!document.getElementById("jumpnrun").checked) {
		document.getElementById("jumpnrunTabelle").style.display = 'none';
	}
	if (document.getElementById("jumpnrun").checked) {
		document.getElementById("jumpnrunTabelle").style.display = 'block';
	}
}

document.getElementById("mathe").onclick = function() {
	
	if (!document.getElementById("mathe").checked) {
		document.getElementById("matheTabelle").style.display = 'none';
	}
	if (document.getElementById("mathe").checked) {
		document.getElementById("matheTabelle").style.display = 'block';
	}
}

//----------------------------
//---------- Events ----------
//----------------------------

//Bestenlisten auslesen
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