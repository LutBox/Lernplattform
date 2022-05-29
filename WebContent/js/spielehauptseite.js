/**
 * Erstellt von Lukas Theinert
 */

document.addEventListener('mouseover', event => {
	const eventTarget = event.target

	if (eventTarget.nodeName === 'IMG' && event.target.id === 'KarteZufall') {
		b1 = document.getElementById("leichtZufall");
		b1.checked = true
		document.getElementById("spieleBeschreibung").innerHTML = "Wähle zufällig ein Spiel aus!";
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
		document.getElementById("spieleBeschreibung").innerHTML = "Weiche den Hindernissen aus und überlebe so lange wie es geht!";
	}
	
})

