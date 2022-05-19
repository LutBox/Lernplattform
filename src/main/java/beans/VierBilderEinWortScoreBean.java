package beans;

import java.io.Serializable;

public class VierBilderEinWortScoreBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int versuche; 
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
	int richtigeErgebnis; 
	

}
