/**
 *	@author Merlin
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init(){
		var editfomrs = document.getElementsByClassName("editierenform");
		var loeschenforms = document.getElementsByClassName("loeschenform");
		for ( var i = 0; i < editfomrs.length; i++) {
			editfomrs[i].addEventListener("click", editieren);
			loeschenforms[i].addEventListener("click", loeschen);
		}
		document.getElementById("neuAnlegenButton").addEventListener("click", anlegen);
		document.getElementById("postenButton").addEventListener("click", posten);
		document.getElementById("postenAbbrButton").addEventListener("click", postenAbbrechen);
		document.getElementById("aktualisierenButton").addEventListener("click", aktualisieren);
		document.getElementById("aktualisierenAbbrButton").addEventListener("click", aktualisierenAbbrechen);
}

/**
 * @source w3schools: https://www.w3schools.com/howto/howto_js_popup_form.asp START
 */
function anlegen(evt){
	document.getElementById("maskenvorhang").style.display = "block";
	document.getElementById("neuAnlegenMaske").style.display = "block";
}
/**
 * w3schools: https://www.w3schools.com/howto/howto_js_popup_form.asp END
 */

function editieren(evt){
	document.getElementById("maskenvorhang").style.display = "block";
	document.getElementById("aktualisierenMaske").style.display = "block";
	document.getElementById("neuigkeitAktualisiert").value = this.querySelector(".zennachricht").value;
	document.getElementById("zennr").value = this.querySelector(".zueditierendeNeuigkeitNummer").value;
}

function aktualisieren(evt){
	var aktURL = "../../NeuigkeitAktualisierenServlet";
	var neuigkeitAktualisiert = encodeURIComponent(document.getElementById("neuigkeitAktualisiert").value);
	var zennr = encodeURIComponent(document.getElementById("zennr").value);
	if (neuigkeitAktualisiert != null && neuigkeitAktualisiert != "") {
		var body = "neuigkeitAktualisiert="+neuigkeitAktualisiert+"&zennr="+zennr;
		var xmlhttpAkt = new XMLHttpRequest();
		xmlhttpAkt.addEventListener("load", function(){
			document.getElementById("maskenvorhang").style.display = "none";
			document.getElementById("neuAnlegenMaske").style.display = "none";
			window.location.reload();
		});
		xmlhttpAkt.open("POST",aktURL,false);
		xmlhttpAkt.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttpAkt.send(body);
	}
}

/**
 * @source w3schools: https://www.w3schools.com/howto/howto_js_popup_form.asp START
 */
function aktualisierenAbbrechen(evt){
	document.getElementById("maskenvorhang").style.display = "none";
	document.getElementById("aktualisierenMaske").style.display = "none";
}
/**
 * @source w3schools: https://www.w3schools.com/howto/howto_js_popup_form.asp END
 */


function posten(evt){
	var postURL = "../../NeuigkeitEinstellenServlet";
	var neuigkeit = encodeURIComponent(document.getElementById("neuigkeitNeu").value);
	if (neuigkeit != null && neuigkeit != "") {
		var body = "neuigkeitNeu="+neuigkeit;
		var xmlhttpPost = new XMLHttpRequest();
		xmlhttpPost.addEventListener("load", function (){
			document.getElementById("maskenvorhang").style.display = "none";
			document.getElementById("neuAnlegenMaske").style.display = "none";
			window.location.reload();
		});
		xmlhttpPost.open("POST", postURL, false);
		xmlhttpPost.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttpPost.send(body);
	}
}

function postenAbbrechen(evt){
	document.getElementById("maskenvorhang").style.display = "none";
	document.getElementById("neuAnlegenMaske").style.display = "none";
}

function loeschen(evt){
	var delURL = "../../NeuigkeitLoeschenServlet";
	var zlnnr = encodeURIComponent(this.querySelector(".zlnnr").value);
	var body = "zlnnr=" + zlnnr;
	var bestaetigt = confirm("Möchten Sie die Neuigkeit wirklich löschen?");
	if (bestaetigt){
		var xmlhttpDel = new XMLHttpRequest();
		xmlhttpDel.addEventListener("load", function (){
			window.location.reload();
		});
		xmlhttpDel.open("POST", delURL,false);
		xmlhttpDel.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttpDel.send(body);
	}
}