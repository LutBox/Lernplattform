//Erstellt von Zohal

package beans;

import java.io.Serializable;

import java.time.LocalDateTime;
import java.util.Date;

public class VierBilderEinWortScoreBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int versuche; 
	int richtigeErgebnis; 
	//schwiriegkeit einf�gen!
	// Stiehl stellt dazu fragen!
   String zeit;
   String schwierigkeit;
   String gewertet;
   
	public String getGewertet() {
	return gewertet;
}
public void setGewertet(String gewertet) {
	this.gewertet = gewertet;
}
	public String getSchwierigkeit() {
	return schwierigkeit;
}
public void setSchwierigkeit(String schwierigkeit) {
	this.schwierigkeit = schwierigkeit;
}
	public String getZeit() {
		return zeit;
	}
	public void setZeit(String zeit) {
		this.zeit =zeit;
	}
	public int getVersuche() {
		return versuche;
	}
	public void setVersuche(int versuche) {
		this.versuche = versuche;
	}
	public int getRichtigeErgebnis() {
		return richtigeErgebnis;
	}
	public void setRichtigeErgebnis(int richtigeErgebnis) {
		this.richtigeErgebnis = richtigeErgebnis;
	}
	

}
