package beans.modelbeans;

import java.io.Serializable;

public class NutzerBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private String email;
	private Integer punkte;
	private String passwort;
	private Integer admin;
	private Integer bildnr;

	public NutzerBean(String name, String email, Integer punkte, String passwort, Integer admin, Integer bildnr) {
		super();
		this.name = name;
		this.email = email;
		this.punkte = punkte;
		this.passwort = passwort;
		this.admin = admin;
		this.bildnr = bildnr;
	}

	public NutzerBean() {
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

	public Integer getPunkte() {
		return punkte;
	}

	public void setPunkte(Integer punkte) {
		this.punkte = punkte;
	}

	public Integer getAdmin() {
		return admin;
	}

	public void setAdmin(Integer admin) {
		this.admin = admin;
	}

	public Integer getBildnr() {
		return bildnr;
	}

	public void setBildnr(Integer bildnr) {
		this.bildnr = bildnr;
	}

	public String getPasswort() {
		return passwort;
	}

	public void setPasswort(String passwort) {
		this.passwort = passwort;
	}
}
