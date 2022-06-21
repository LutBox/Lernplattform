package beans;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Merlin
 */
public class Neuigkeit implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer nnr;
	private String nachricht;
	private Date zeitstempel;
	
	public Neuigkeit(Integer nnr, String nachricht, Date zeitstempel) {
		this.nnr = nnr;
		this.nachricht = nachricht;
		this.zeitstempel = zeitstempel;
	}
	
	public Neuigkeit() {
		this.zeitstempel = new Date();
	}
	
	public Integer getNnr() {
		return nnr;
	}
	public void setNnr(Integer nnr) {
		this.nnr = nnr;
	}
	public String getNachricht() {
		return nachricht;
	}
	public void setNachricht(String nachricht) {
		this.nachricht = nachricht;
	}
	public Date getZeitstempel() {
		return zeitstempel;
	}
	public void setZeitstempel(Date zeitstempel) {
		this.zeitstempel = zeitstempel;
	}
	
	
}
