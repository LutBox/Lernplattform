//Erstellt von Lukas Theinert

package beans;

import java.io.Serializable;

public class BilderAnzeigen implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String bildKategorie;
	private long bildID;

	public BilderAnzeigen() {
		super();
	}

	public String getBildKategorie() {
		return bildKategorie;
	}

	public void setBildKategorie(String bildKategorie) {
		this.bildKategorie = bildKategorie;
	}

	public long getBildID() {
		return bildID;
	}

	public void setBildID(long bildID) {
		this.bildID = bildID;
	}

}
