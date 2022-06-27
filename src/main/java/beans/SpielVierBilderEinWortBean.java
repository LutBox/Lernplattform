//Erstellt von Zohal

package beans;

import java.io.Serializable;

public class SpielVierBilderEinWortBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int bild1, bild2, bild3, bild4;
	private String wort; 
// Zeit hier 
	

	
	public String getWort() {
		return wort;
	}

	public void setWort(String wort) {
		this.wort = wort;
	}

	// 3) Ids in die Bean schreiben (z.B. als Attribute, Array, etc)
	public int getBild1() {
		return bild1;
	}

	public void setBild1(int bild1) {
		this.bild1 = bild1;
	}

	public int getBild2() {
		return bild2;
	}

	public void setBild2(int bild2) {
		this.bild2 = bild2;
	}

	public int getBild3() {
		return bild3;
	}

	public void setBild3(int bild3) {
		this.bild3 = bild3;
	}

	public int getBild4() {
		return bild4;
	}

	public void setBild4(int bild4) {
		this.bild4 = bild4;
	}
	
	
	

}