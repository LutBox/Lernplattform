/**
 * @author Merlin
 */

function pwKontrolle(){
 if(document.getElementById('passwort').value == document.getElementById('passwort2')){
  document.getElementById('absenden').disabled = false;
 } else {
  document.getElementById('absenden').disabled = true;
 }
}