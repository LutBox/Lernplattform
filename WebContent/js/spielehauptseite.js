/*
 * Erstellt von Lukas Theinert
 */


if (document.getElementById("nutzer").innerHTML === "") {
	//alert("Niemand angemeldet!");

	document.getElementById("MatheAuswahl").style.display = 'none';
	document.getElementById("BilderWortAuswahl").style.display = 'none';
	document.getElementById("BilderMemorieAuswahl").style.display = 'none';
	document.getElementById("BilderOrdnenAuswahl").style.display = 'none';
	document.getElementById("JumpnrunAuswahl").style.display = 'none';
	document.getElementById("ZufallAuswahl").style.margin = "auto";
}

//---------- Zufall ----------
document.addEventListener('mouseover', event => {
	const eventTarget = event.target

	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteZufall') {

		if (document.getElementById("nutzer").innerHTML === "") {
			b1 = document.getElementById("leichtZufall");
			b1.checked = true
			b2 = document.getElementById("timerAnZufall");
			b2.checked = true
			b3 = document.getElementById("gewertetAnZufall");
			b3.checked = true
			document.getElementById("ZufallTimer").style.visibility = 'hidden';
			document.getElementById("ZufallGewertet").style.visibility = 'hidden';

			document.getElementById("spieleBeschreibung").innerHTML = "Melde dich an, um eine Auswahl von allen Spielen zu erhalten!";
		} else {
			b1 = document.getElementById("leichtZufall");
			b1.checked = true
			b2 = document.getElementById("timerAnZufall");
			b2.checked = true
			b3 = document.getElementById("gewertetAnZufall");
			b3.checked = true
			document.getElementById("spieleBeschreibung").innerHTML = `Wählt zufällig ein Spiel zwischen Mathe, 4 Bilder 1 Wort, Bilder ordnen, Bildermemorie und Jump n run aus!`;
		}

		document.getElementById("gewertetAnZufall").addEventListener('click', function() {
			if (document.getElementById("gewertetAnZufall").checked) {
				document.getElementById("timerAnZufall").checked = true;
			}
		});
		document.getElementById("timerAusZufall").addEventListener('click', function() {
			document.getElementById("gewertetAusZufall").checked = true;
		});
	}

	//---------- Mathe -----------
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteMathe') {
		b1 = document.getElementById("leichtMathe");
		b1.checked = true
		b2 = document.getElementById("timerAnMathe");
		b2.checked = true
		b3 = document.getElementById("gewertetAnMathe");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Löse die Rechenaufgaben! Zwei zufällige Zahlen erscheinen, die addiert werden müssen. Klickst du das richtige Ergebnis an, erhälst du einen Punkt! Du hast 60 Sekunden zeit, so viele Punkte wie möglich zu sammeln!";
		
		document.getElementById("gewertetAnMathe").addEventListener('click', function() {
			if (document.getElementById("gewertetAnMathe").checked) {
				document.getElementById("timerAnMathe").checked = true;
			}
		});
		document.getElementById("timerAusMathe").addEventListener('click', function() {
			document.getElementById("gewertetAusMathe").checked = true;
		});
	}

	//---------- 4 Bilder 1 Wort -----------	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteBilderWort') {
		b1 = document.getElementById("leichtBilderWort");
		b1.checked = true
		b2 = document.getElementById("timerAnBilderWort");
		b2.checked = true
		b3 = document.getElementById("gewertetAnBilderWort");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Es werden dir 4 zufällige Bilder angezeigt. Deine Aufgabe ist es ein Wort zu finden, dass alle 4 Bilder beschreibt. Errätst du das richtige Wort, erhälst du einen Punkt! Du hast 60 Sekunden zeit, so viele Punkte wie möglich zu sammeln";
		
		document.getElementById("gewertetAnBilderWort").addEventListener('click', function() {
			if (document.getElementById("gewertetAnBilderWort").checked) {
				document.getElementById("timerAnBilderWort").checked = true;
			}
		});
		document.getElementById("timerAusBilderWort").addEventListener('click', function() {
			document.getElementById("gewertetAusBilderWort").checked = true;
		});
	}

	//---------- Bilder ordnen -----------	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteBilderOrdnen') {
		b1 = document.getElementById("leichtBilderOrdnen");
		b1.checked = true
		b2 = document.getElementById("timerAnBilderOrdnen");
		b2.checked = true
		b3 = document.getElementById("gewertetAnBilderOrdnen");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Ordne die Bilder zu den passenden Begriffen! Aber Achtung: die Begriffe sind nicht immer das, was auf dem Bild zu sehen ist!";
		
		document.getElementById("gewertetAnBilderOrdnen").addEventListener('click', function() {
			if (document.getElementById("gewertetAnBilderOrdnen").checked) {
				document.getElementById("timerAnBilderOrdnen").checked = true;
			}
		});
		document.getElementById("timerAusBilderOrdnen").addEventListener('click', function() {
			document.getElementById("gewertetAusBilderOrdnen").checked = true;
		});
	}

	//---------- Bildermemorie -----------	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteBilderMemorie') {
		b1 = document.getElementById("leichtBilderMemorie");
		b1.checked = true
		b2 = document.getElementById("timerAnBilderMemorie");
		b2.checked = true
		b3 = document.getElementById("gewertetAnBilderMemorie");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = `Versuche möglichst viele Paare zu finden! Zu Beginn des Spiels werden alle Plättchen verdeckt verteilt. Du darfst immer nur zwei Plättchen aufdecken. Zeigen die Plättchen identische Motive, dann hast du ein Paar gefunden!`;
		
		document.getElementById("gewertetAnBilderMemorie").addEventListener('click', function() {
			if (document.getElementById("gewertetAnBilderMemorie").checked) {
				document.getElementById("timerAnBilderMemorie").checked = true;
			}
		});
		document.getElementById("timerAusBilderMemorie").addEventListener('click', function() {
			document.getElementById("gewertetAusBilderMemorie").checked = true;
		});
	}

	//---------- Jump n run -----------	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteJumpnrun') {
		b1 = document.getElementById("leichtJumpnrun");
		b1.checked = true
		b2 = document.getElementById("timerAnJumpnrun");
		b2.checked = true
		b3 = document.getElementById("gewertetAnJumpnrun");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Weiche den Hindernissen aus und überlebe so lange wie es geht! Hüpfe über die Steine, ducke dich bei den Vögeln und sammle so viele Punkte wie möglich! <br><br> Steuerung:<br> Ducken: Taste S oder Pfeiltaste Unten <br>Hüpfen: Taste W oder Pfeiltaste Oben";
		
		document.getElementById("gewertetAnJumpnrun").addEventListener('click', function() {
			if (document.getElementById("gewertetAnJumpnrun").checked) {
				document.getElementById("timerAnJumpnrun").checked = true;
			}
		});
		document.getElementById("timerAusJumpnrun").addEventListener('click', function() {
			document.getElementById("gewertetAusJumpnrun").checked = true;
		});
	}

});





