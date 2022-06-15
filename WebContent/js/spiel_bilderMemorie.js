/*
 * Erstellt von Lukas Theinert
 */
 
//Memorie-Idee von Tutorial: https://www.freecodecamp.org/news/vanilla-javascript-tutorial-build-a-memory-game-in-30-minutes-e542c4447eae

"use strict";

//-------------------------------
//---------- Verhalten ----------
//-------------------------------

//Const-Objekte können nicht neu deklariert oder zugewiesen werden und muessen initialisiert werden
//Eigenschaften eines Const-Objektes kann man jederzeit ändern 
//Quelle: https://www.w3schools.com/js/js_const.asp

const karten = document.querySelectorAll(".memorieKarte");

const spielEigenschaften = {
	spielbrett: document.querySelector(".spielbrett-container"),
	versuche: document.querySelector(".versuche"),
	zeit: document.querySelector(".zeit"),
	start: document.querySelector("button"),
	win: document.querySelector(".win")
}

const spielStatus = {
	spielGestartet: false,
	aktuellUmgedrehteKarten: 0,
	insgesamtUmgedrehteKarten: 0,
	insgesamtZeit: 0,
	loop: null
}

//Timer und Versuche jede Sekunde aktualisieren
var startGame = () => {
	spielStatus.spielGestartet = true

	spielStatus.loop = setInterval(() => {
		spielStatus.insgesamtZeit++

		//alert(document.getElementById("gewertet").innerHTML);
			
		if (document.getElementById("gewertet").innerHTML === "gewertetAn") {
			spielEigenschaften.versuche.innerText = `Versuche: ${spielStatus.insgesamtUmgedrehteKarten} `
		}
		
		if (document.getElementById("timerID").innerHTML === "timerAn") {
			spielEigenschaften.zeit.innerText = `Zeit: ${spielStatus.insgesamtZeit} Sekunden`
		}
		
	}, 1000)
}

//Memorie-Idee:
//----------- Anfang ----------------------
var istUmgedreht = false;
var istAufgedeckt = false;
var ersteKarte, zweiteKarte;

//Karte nach vorne drehen
function karteVorneDrehen() {
	if (istAufgedeckt){
		return;
	} 
	if (this === ersteKarte) {
		return;
	}
	
	spielStatus.insgesamtUmgedrehteKarten++
	spielStatus.aktuellUmgedrehteKarten++
	
	//Animation "drehen" hinzufügen
	this.classList.add("drehen");

	if (!istUmgedreht) {
		istUmgedreht = true;
		ersteKarte = this;
		return;
	}

	zweiteKarte = this;
	versuchChecken();
}

//Nach Karten-Paar prüfen
function versuchChecken() {
	//dataset = document.getElement -> liest alle daten aus, die mit "data-" beginnen
	if(ersteKarte.dataset.bild === zweiteKarte.dataset.bild){
		kartenDeaktivieren();
	} else {
		karteHintenDrehen();
	}

	//Jede Sekunde prüfen, ob alle Karten umgedreht worden sind
	if (spielStatus.aktuellUmgedrehteKarten === document.querySelectorAll(".memorieKarte").length) {
		setTimeout(() => {
			spielEigenschaften.spielbrett.classList.add("flipped")
			document.getElementById("informationen").style.visibility = "hide";
			document.getElementById("spielbrett-container").style.visibility = "visible";
			spielEigenschaften.win.innerHTML = 
			`       
                    Du hast gewonnen!<br>       
                    Versuche: <span class="highlight">${spielStatus.insgesamtUmgedrehteKarten}</span><br>
                    Zeit: <span class="highlight">${spielStatus.insgesamtZeit}</span> Sekunden
            `
            //Intervall: Zeit und Versuche aktualisieren -> stoppen
			clearInterval(spielStatus.loop);		
				
			//DatenbankEintrag
			if (document.getElementById("nutzer").innerHTML !== "") {
				datenbankEintrag();	
				//alert(document.getElementById("nutzer").innerHTML);
			}
		}, 1000)
	}
}

//Gelöste Kartenpaare können nicht mehr angeklickt werden
function kartenDeaktivieren() {
	ersteKarte.removeEventListener("click", karteVorneDrehen);
	zweiteKarte.removeEventListener("click", karteVorneDrehen);
	
	//Alle Variablen zurücksetzten
	versuchFalsch();
}

//Karte nach hinten drehen
function karteHintenDrehen() {
	istAufgedeckt = true;

	spielStatus.aktuellUmgedrehteKarten--;
	spielStatus.aktuellUmgedrehteKarten--;

	setTimeout(() => {
		//Animationen "drehen" entfernen
		ersteKarte.classList.remove("drehen");
		zweiteKarte.classList.remove("drehen");

		versuchFalsch();
	}, 1500);
}

//Versuch falsch -> alle Variablen zurücksetzten
function versuchFalsch() {
	istUmgedreht = false;
	istAufgedeckt = false;
	ersteKarte = null;
	zweiteKarte = null;
}

//Alle Karten durchmischen
(function kartenMischen() {
	karten.forEach(karte => {
		let randomPos = Math.floor(Math.random() * 12);
		karte.style.order = randomPos;
	});
})();
//----------- Ende ----------------------

//----------------------------
//---------- Events ----------
//----------------------------

//Spiel wird gestartet, sobald die erste Karte oder der Start-Button angeklickt wird
document.addEventListener("click", event => {
	const eventTarget = event.target

	if (eventTarget.nodeName === "BUTTON" && spielStatus.spielGestartet === false) {
		startGame()
	}
	if (eventTarget.nodeName === "IMG" && spielStatus.spielGestartet === false) {
		startGame()
	}
})

//Karte drehen
karten.forEach(karte => karte.addEventListener("click", karteVorneDrehen));

//Restart-Button
document.getElementById("restartButton").onclick = function() {
	window.location.reload();
}

//Datenbankeintrag
function datenbankEintrag() {

	var zeit = spielStatus.insgesamtZeit;
	var versuche = spielStatus.insgesamtUmgedrehteKarten;

	var sendData = "zeit=" + zeit + "&versuche=" + versuche;

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BilderMemorieAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	//alert("Spiel in Datenbank gespeichert");
}