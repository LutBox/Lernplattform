package beans.viewbeans;

import java.io.Serializable;

/**
 * 
 * @author Merlin
 *
 */
public class NutzerViewBean implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final String attributName = "nutzer";
	private String name;
	private String email;
	private int punkte;
	private int admin;
	private String dateiname;
	
	public NutzerViewBean() {
		this.name = null;
		this.email = null;
		this.punkte = 0;
		this.admin = 0;
		this.dateiname = null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPunkte() {
		return punkte;
	}

	public void setPunkte(int punkte) {
		this.punkte = punkte;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getDateiname() {
		return dateiname;
	}

	public void setDateiname(String dateiname) {
		this.dateiname = dateiname;
	}
}
