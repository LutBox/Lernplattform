//Erstellt von Lukas Theinert

//Figur: Lauf-Animation
var images = [];

images[0] = ['bilder/jumpnrun/figur1.png'];
images[1] = ['bilder/jumpnrun/figur2.png'];
var index = 0;

function change() {
  document.getElementById("character").src = images[index];
  if (index == 1) {
    index = 0;
  } else {
    index++;
  }
  //alert("Test")
  setTimeout(change, 100);
}

window.onload = change();


//Figur: Hüpfen
var character = document.getElementById("character");
var block = document.getElementById("block");
var counter=0;

//document.addEventListener('keyup', jump)
function jump(){
    if(character.classList == "animate"){return}
    character.classList.add("animate");
    setTimeout(function(){
        character.classList.remove("animate");
    },300);
}

//Figur: Ducken
//document.addEventListener('click', ducken)
function ducken(){
    if(character.classList == "ducken"){return}
    character.classList.add("ducken");
    setTimeout(function(){
        character.classList.remove("ducken");
    },300);
}

var checkDead = setInterval(function() {
    let characterTop = parseInt(window.getComputedStyle(character).getPropertyValue("top"));
    let blockLeft = parseInt(window.getComputedStyle(block).getPropertyValue("left"));

    if(blockLeft<40 && blockLeft>-40 && characterTop>=280){
        block.style.animation = "none";
        alert("Game Over. score: "+Math.floor(counter/100));
        counter=0;
        block.style.animation = "block 1s infinite linear";

    }else{
        counter++;
        document.getElementById("scoreSpan").innerHTML = Math.floor(counter/100);
    }
}, 10);

document.addEventListener('keydown', (event) => {
    var name = event.key;
    var code = event.code;
    if (name === 'ArrowUp' || name === 'w' || code === 'Space') {
        jump()
    }
    if (name === 'ArrowDown' || name === 's') {
        ducken()
    }
  
  }, false);