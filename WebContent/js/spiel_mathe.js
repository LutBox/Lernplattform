/*
 * Erstellt von Lukas Theinert
 */
 
//Mathe-Spiel Idee von: https://codepen.io/bobbidigi34/pen/rWzZgQ

"use strict";

if (document.getElementById("gewertet").innerHTML === "gewertetAus") {
	document.getElementById("punktezahl").style.visibility = 'hidden';
}

if (document.getElementById("timerID").innerHTML === "TimerAus") {		
	document.getElementById("verbleibendeZeit").style.visibility = 'hidden';
} 

//-------------------------------
//---------- Verhalten ----------
//-------------------------------

var spielGestartet = false;
var punkteStand;
var action;
var verbleibendeZeit;
var richtigAntwort;

//Antworten

//Mathe-Spiel-Idee:
//----------- Anfang ----------------------
let i;
for (i = 1; i < 5; i++) {
	document.getElementById("box" + i).onclick = function() {
		if (spielGestartet == true) {
			if (this.innerHTML == richtigAntwort) {

				//Punkt erhöhen
				punkteStand++;
				document.getElementById("punkte").innerHTML = punkteStand;
				hide("falsch");
				show("richtig");
				setTimeout(function() {
					hide("richtig");
				}, 1000);
				zahlenGenerieren();

			} else {
				//falsch Antwort
				hide("richtig");
				show("falsch");
				setTimeout(function() {
					hide("falsch");
				}, 1000);
			}
		}
	}
}

//Timer starten
function startCountdown() {
	action = setInterval(function() {
		verbleibendeZeit -= 1;

		document.getElementById("verbleibendeZeitWert").innerHTML = verbleibendeZeit;
		if (verbleibendeZeit == 0) {
			stopCountdown();
			show("spielVorbei");

			//game over			
			document.getElementById("spielVorbei").innerHTML = "<p>Zeit abgelaufen!</p>";
			hide("richtig");
			hide("falsch");
			spielGestartet = false;

			document.getElementById("start-restart").innerHTML = "Start";
			
			if (document.getElementById("nutzer").innerHTML !== "") {
				datenbankEintrag();
				//alert(document.getElementById("nutzer").innerHTML);
			}
		}
	}, 1000);
}

//Timer stoppen
function stopCountdown() {
	clearInterval(action);
}

//verstecken
function hide(Id) {
	document.getElementById(Id).style.display = "none";
}

//zeigen
function show(Id) {
	document.getElementById(Id).style.display = "block";
}

//----------- Ende ----------------------

//Zahlen je nah Schwierigkeitsgrad generieren
function zahlenGenerieren() {
	
	//Schwierigkeitsgrad: Leicht
	if(document.getElementById("schwierigkeit").innerHTML === 'leicht'){
		var x = Math.round(10 * Math.random());
		var y = Math.round(10 * Math.random());
		richtigAntwort = x + y;
	}
	
	//Schwierigkeitsgrad: Mittel
	if(document.getElementById("schwierigkeit").innerHTML === 'mittel'){
		var x = Math.round(100 * Math.random());
		var y = Math.round(100 * Math.random());
		richtigAntwort = x + y;
	}
	
	//Schwierigkeitsgrad: Schwer
	if(document.getElementById("schwierigkeit").innerHTML === 'schwer'){
		var x = Math.round(1000 * Math.random());
		var y = Math.round(1000 * Math.random());
		richtigAntwort = x + y;
	}

	document.getElementById("aufgabe").innerHTML = x + "+" + y;

	//Zufällige Position zwischen 1 und 4 -> 0 ausgeschlossen
	var richtigPosition = 1 + Math.round(3 * Math.random());

	document.getElementById("box" + richtigPosition).innerHTML = richtigAntwort;//richtig Antwort

	//falsch Antwort
	var Antwort = [richtigAntwort];

	for (i = 1; i < 5; i++) {
		if (i != richtigPosition) {
			var falschAntwort;
			do {
				//Schwierigkeitsgrad: Leicht
				if(document.getElementById("schwierigkeit").innerHTML === 'leicht'){
					falschAntwort = (Math.round(10 * Math.random())) + (Math.round(10 * Math.random()));
				}
				//Schwierigkeitsgrad: Mittel
				if(document.getElementById("schwierigkeit").innerHTML === 'mittel'){
					falschAntwort = (Math.round(100 * Math.random())) + (Math.round(100 * Math.random()));
				}
				//Schwierigkeitsgrad: Schwer
				if(document.getElementById("schwierigkeit").innerHTML === 'schwer'){
					falschAntwort = (Math.round(1000 * Math.random())) + (Math.round(1000 * Math.random()));
				}			

			} while (Antwort.indexOf(falschAntwort) > -1)

			document.getElementById("box" + i).innerHTML = falschAntwort;
			Antwort.push(falschAntwort);
		}
	}
}


//----------------------------
//---------- Events ----------
//----------------------------

//Start-Reset
document.getElementById("start-restart").onclick = function() {
	
	if (spielGestartet == true) {
		window.location.reload();
	}
	else {
		spielGestartet = true;
		punkteStand = 0;

		document.getElementById("punkte").innerHTML = punkteStand;
		
		//show count
		if (document.getElementById("timerID").innerHTML === "timerAn") {	
			show("verbleibendeZeit");
			verbleibendeZeit = 60;
		} 
		

		document.getElementById("verbleibendeZeitWert").innerHTML = verbleibendeZeit;

		//hide game over
		hide("spielVorbei");

		//change start to reset		
		document.getElementById("start-restart").innerHTML = "Restart";

		//start count
		startCountdown();

		//generate quetion
		zahlenGenerieren();

	}
}

//Datenbankeintrag
//"use strict";

function datenbankEintrag() {
	//alert("Punktestand: " + punkteStand)
	
	var zeit = punkteStand;
	var versuche = punkteStand;

	var sendData = "zeit=" + zeit + "&versuche=" + versuche;
	
	//var sendData = "punkteStand=" + punkteStand;

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "MatheAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	//alert("Spiel in Datenbank gespeichert");
}