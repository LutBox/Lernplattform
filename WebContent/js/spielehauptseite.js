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
	document.getElementById("ZufallAuswahl").style.margin="auto";
} 

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
			document.getElementById("spieleBeschreibung").innerHTML = "Wähle zufällig ein Spiel aus!";
		}
	}
	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteMathe') {
		b1 = document.getElementById("leichtMathe");
		b1.checked = true
		b2 = document.getElementById("timerAnMathe");
		b2.checked = true
		b3 = document.getElementById("gewertetAnMathe");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Löse die Rechenaufgaben!";
	}
	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteBilderWort') {
		b1 = document.getElementById("leichtBilderWort");
		b1.checked = true
		b2 = document.getElementById("timerAnBilderWort");
		b2.checked = true
		b3 = document.getElementById("gewertetAnBilderWort");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Errate zu den Bilder das passende Wort!";
	}
	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteBilderOrdnen') {
		b1 = document.getElementById("leichtBilderOrdnen");
		b1.checked = true
		b2 = document.getElementById("timerAnBilderOrdnen");
		b2.checked = true
		b3 = document.getElementById("gewertetAnBilderOrdnen");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Ordne die Bilder zu den passenden Begriffen!";
	}
	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteBilderMemorie') {
		b1 = document.getElementById("leichtBilderMemorie");
		b1.checked = true
		b2 = document.getElementById("timerAnBilderMemorie");
		b2.checked = true
		b3 = document.getElementById("gewertetAnBilderMemorie");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Finde alle Karten-Paare!";
	}
	
	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteJumpnrun') {
		b1 = document.getElementById("leichtJumpnrun");
		b1.checked = true
		b2 = document.getElementById("timerAnJumpnrun");
		b2.checked = true
		b3 = document.getElementById("gewertetAnJumpnrun");
		b3.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Weiche den Hindernissen aus und überlebe so lange wie es geht!";
	}
	
})

