package beans;

import java.io.Serializable;

public class NutzerBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private String email;
	private String passwort;
	private Integer admin;
	private Integer punkteBilderMemorie;
	private Integer punkteBilderOrdnen;
	private Integer punkteBilderBilderWort;
	private Integer punkteMathe;
	private Integer punkteJumpnrun;

	public NutzerBean(String name, String email, String passwort, Integer admin, Integer punkteBilderMemorie,
			Integer punkteBilderOrdnen, Integer punkteBilderBilderWort, Integer punkteMathe, Integer punkteJumpnrun) {
		super();
		this.name = name;
		this.email = email;
		this.passwort = passwort;
		this.admin = admin;
		this.punkteBilderMemorie = punkteBilderMemorie;
		this.punkteBilderOrdnen = punkteBilderOrdnen;
		this.punkteBilderBilderWort = punkteBilderBilderWort;
		this.punkteMathe = punkteMathe;
		this.punkteJumpnrun = punkteJumpnrun;
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

	public Integer getAdmin() {
		return admin;
	}

	public void setAdmin(Integer admin) {
		this.admin = admin;
	}

	public String getPasswort() {
		return passwort;
	}

	public void setPasswort(String passwort) {
		this.passwort = passwort;
	}

	public Integer getPunkteBilderMemorie() {
		return punkteBilderMemorie;
	}

	public void setPunkteBilderMemorie(Integer punkteBilderMemorie) {
		this.punkteBilderMemorie = punkteBilderMemorie;
	}

	public Integer getPunkteBilderOrdnen() {
		return punkteBilderOrdnen;
	}

	public void setPunkteBilderOrdnen(Integer punkteBilderOrdnen) {
		this.punkteBilderOrdnen = punkteBilderOrdnen;
	}

	public Integer getPunkteBilderBilderWort() {
		return punkteBilderBilderWort;
	}

	public void setPunkteBilderBilderWort(Integer punkteBilderBilderWort) {
		this.punkteBilderBilderWort = punkteBilderBilderWort;
	}

	public Integer getPunkteMathe() {
		return punkteMathe;
	}

	public void setPunkteMathe(Integer punkteMathe) {
		this.punkteMathe = punkteMathe;
	}

	public Integer getPunkteJumpnrun() {
		return punkteJumpnrun;
	}

	public void setPunkteJumpnrun(Integer punkteJumpnrun) {
		this.punkteJumpnrun = punkteJumpnrun;
	}
}
