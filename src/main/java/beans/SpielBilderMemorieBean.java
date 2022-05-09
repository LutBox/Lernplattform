package beans;

import java.sql.Blob;

public class SpielBilderMemorieBean {
	private static final long serialVersionUID = 1L;
	private String bild1Stream;
	private String bild1Kategorie;
	private long bild1ID;
	private byte[] bild1;


	public byte[] getBild1() {
		return bild1;
	}


	public void setBild1(byte[] bild1) {
		this.bild1 = bild1;
	}


	public SpielBilderMemorieBean() {
		super();
	}


	public String getBild1Stream() {
		return bild1Stream;
	}


	public void setBild1Stream(String bild1Stream) {
		this.bild1Stream = bild1Stream;
	}


	public String getBild1Kategorie() {
		return bild1Kategorie;
	}


	public void setBild1Kategorie(String bild1Kategorie) {
		this.bild1Kategorie = bild1Kategorie;
	}


	public long getBild1ID() {
		return bild1ID;
	}


	public void setBild1ID(long bild1id) {
		bild1ID = bild1id;
	}
	

}
