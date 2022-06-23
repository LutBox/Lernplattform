/**
 *	@author Merlin
 *	@source w3schools: https://www.w3schools.com/howto/howto_js_popup_form.asp
 */

document.addEventListener("DOMContentLoaded", init);

function init(){
		var editbuttons = document.getElementsByClassName("editierenButton");
		var loeschenforms = document.getElementsByClassName("loeschenform");
		for ( var i = 0; i < editbuttons.length; i++) {
			editbuttons[i].addEventListener("click", editieren);
			loeschenforms[i].addEventListener("click", loeschen);
		}
		document.getElementById("neuAnlegenButton").addEventListener("click", anlegen);
		document.getElementById("postenButton").addEventListener("click", posten);
		document.getElementById("postenAbbrButton").addEventListener("click", postenAbbrechen);
		document.getElementById("aktualisierenButton").addEventListener("click", aktualisieren);
		document.getElementById("aktualisierenAbbrButton").addEventListener("click", aktualisierenAbbrechen);
}

function anlegen(evt){
	document.getElementById("maskenvorhang").style.display = "block";
	document.getElementById("neuAnlegenMaske").style.display = "block";
}

function editieren(evt){
	document.getElementById("maskenvorhang").style.display = "block";
	document.getElementById("aktualisierenMaske").style.display = "block";
}

function aktualisieren(evt){
	var aktURL = "../../NeuigkeitAktualisierenServlet";
	var neuigkeitAktualisiert = document.getElementById("neuigkeitAktualisiert");
	if (neuigkeitAktualisiert != null && neuigkeitAktualisiert != "") {
		var zlnnr = document.getElementbyId("zlnnr");
		var body = "neuigkeitAktualisiert="+neuigkeitAktualisiert+"&zlnnr="+zlnnr;
		var xmlhttpAkt = new XMLHttpRequest();
		xmlhttpAkt.addEventListener("load", function(){
			document.getElementById("maskenvorhang").style.display = "none";
			document.getElementById("neuAnlegenMaske").style.display = "none";
			window.location.reload();
		});
		xmlhttpAkt.open("POST",aktURL,flase);
		xmlhttpPost.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttpAkt.send(body);
	}
}

function aktualisierenAbbrechen(evt){
	document.getElementById("maskenvorhang").style.display = "none";
	document.getElementById("aktualisierenMaske").style.display = "none";
}

function posten(evt){
	var postURL = "../../NeuigkeitEinstellenServlet.java";
	var neuigkeit = document.getElementById("neuerPost").value;
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
	var zlnnr = this.querySelector(".zlnnr").value;
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