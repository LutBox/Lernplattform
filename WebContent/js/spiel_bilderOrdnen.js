/*
 * Erstellt von Lukas Theinert
 */

//Drag-and-Drop-Verhalten: https://www.w3schools.com/html/html5_draganddrop.asp
//Bilder-Ordnen-Idee von Tutorial: https://codepen.io/Coding_Journey/pen/YzKpLvE

"use strict";

//-------------------------------
//---------- Verhalten ----------
//-------------------------------

//Const-Objekte können nicht neu deklariert oder zugewiesen werden und muessen initialisiert werden
//Eigenschaften eines Const-Objektes kann man jederzeit ändern 
//Quelle: https://www.w3schools.com/js/js_const.asp

var correct = 0;
var total = 0;

const totalDraggableItems = document.querySelectorAll('.draggable').length;
const draggableElements = document.querySelectorAll(".draggable");
const droppableElements = document.querySelectorAll(".droppable");

const spielEigenschaften = {
	versuche: document.querySelector('.versuche'),
	zeit: document.querySelector('.zeit'),
	win: document.querySelector('.win')
}

const spielStatus = {
	spielGestartet: false,
	totalFlips: 0,
	totalTime: 0,
	loop: null
}



//Spiel wurde gestartet, zeit und Versuche werden jede Sekunde aktualisieren
var startGame = () => {
	spielStatus.spielGestartet = true
	spielStatus.loop = setInterval(() => {
		spielStatus.totalTime++

		//alert(document.getElementById("gewertet").innerHTML);

		if (document.getElementById("gewertet").innerHTML === "gewertetAn") {
			spielEigenschaften.versuche.innerText = `Versuche: ${spielStatus.totalFlips} `
		}

		if (document.getElementById("timerID").innerHTML === "timerAn") {
			spielEigenschaften.zeit.innerText = `Zeit: ${spielStatus.totalTime} Sekunden`
		}

	}, 1000)
}

//Bilder werden gemischt
(function bildMischen() {
	droppableElements.forEach(droppableElements => {
		let randomPos = Math.floor(Math.random() * 12);
		droppableElements.style.order = randomPos;
	});
})();

//Wörter werden gemischt
(function wortMischen() {
	draggableElements.forEach(draggableElements => {
		let randomPos = Math.floor(Math.random() * 12);
		draggableElements.style.order = randomPos;
	});
})();

//Bilder-Ordnen-Idee:
//----------- Anfang ----------------------

// Drag-and-Drop-Funktion

//Bildkategorie aus 'id' lesen
function dragStart(event) {
	event.dataTransfer.setData("text", event.target.id);
}

//CSS hinzufügen: Bild über Kategorie hovern
function dragEnter(event) {
	if (!event.target.classList.contains("dropped")) {
		event.target.classList.add("droppable-hover");
	}
}

//event.preventDefault() 
//-> verhindert standartmäßige Verarbeitung der Daten vom Browser
//-> standardmäßig als Link beim Ablegen öffnen
//-> ermöglicht ausführen von drop-events 
function dragOver(event) {
	if (!event.target.classList.contains("dropped")) {
		event.preventDefault();
	}
}

//CSS entfernen: Bild nicht mehr über Kategorie hovern 
function dragLeave(event) {
	if (!event.target.classList.contains("dropped")) {
		event.target.classList.remove("droppable-hover");
	}
}

//Bild loslassen 
function drop(event) {
	event.preventDefault(); 
	event.target.classList.remove("droppable-hover");
	
	var draggableElementData = event.dataTransfer.getData("text");
	var droppableElementData = event.target.getAttribute("data-draggable-id");
	
	//alert("Draggable: " + draggableElementData + " -> Droppable: " + droppableElementData);
	
	var isCorrectMatching = draggableElementData === droppableElementData;
	spielStatus.totalFlips++

	if (isCorrectMatching) {
		var draggableElement = document.getElementById(draggableElementData);
		
		//class="dropped" zum Bild hinzufügen
		event.target.classList.add("dropped");
		event.target.style.backgroundColor = 'black';
		
		//class="dragged" zum Bild hinzufügen
		draggableElement.classList.add("dragged");
		//Bild nicht mehr draggable machen
		draggableElement.setAttribute("draggable", "false");
		correct++;
	}
	
//----------- Ende ----------------------  

	//Prüfen ob Spiel zuende ist
	if (correct === totalDraggableItems) {

		setTimeout(() => {

			document.getElementById("buttonStart").style.display = "none";
			document.getElementById("start").style.visibility = "hide";
			document.getElementById("buttonRestart").style.display = "block";

			spielEigenschaften.win.innerHTML =
				`       
                    Du hast gewonnen!<br>       
            `
			clearInterval(spielStatus.loop)
			//DatenbankEintrag
			if (document.getElementById("nutzer").innerHTML !== "") {
				datenbankEintrag();
				//alert(document.getElementById("nutzer").innerHTML);
			}
		}, 1000)
	}
}

//----------------------------
//---------- Events ----------
//----------------------------

//Starten sobald Button gedrückt wird
document.addEventListener('click', event => {
	const eventTarget = event.target
	if (eventTarget.nodeName === 'BUTTON' && spielStatus.spielGestartet === false) {
		startGame()
	}
})

//Starten sobald Bild bewegt wird
document.addEventListener('drag', event => {
	const eventTarget = event.target
	if (eventTarget.nodeName === 'IMG' && spielStatus.spielGestartet === false) {
		startGame()
	}
})

//Funktionen für jedes festgehaltene Bild
draggableElements.forEach(elem => {
	elem.addEventListener("dragstart", dragStart);
});

//Funktionen für jede Kategorie
droppableElements.forEach(elem => {
	elem.addEventListener("dragenter", dragEnter);
	elem.addEventListener("dragover", dragOver);
	elem.addEventListener("dragleave", dragLeave);
	elem.addEventListener("drop", drop);
});

//Restart-Button
document.getElementById("restartButton").onclick = function() {
	window.location.reload();
}

//Datenbankeintrag
function datenbankEintrag() {

	var zeit = spielStatus.totalTime;
	var versuche = spielStatus.totalFlips;

	var sendData = "zeit=" + zeit + "&versuche=" + versuche;

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadyspielStatuschange = function() {
		if (xmlhttp.readyspielStatus == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BilderOrdnenAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	//alert("Spiel in Datenbank gespeichert");
}