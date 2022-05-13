package dienste.sqldienste;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.modelbeans.NutzerBean;
import beans.viewbeans.NutzerViewBean;
import jakarta.servlet.http.HttpSession;

/**
 * @author Merlin Diese Klasse führt die Datenbankzugriffe des
 *         "Nutzer"-Geschaeftsobjekts aus.
 */
public class NutzerSQLDienst extends SQLDienst {
	/**
	 * @author Merlin
	 * Name der "Nutzer"-Datenbank
	 */
	private static final String tabellenname = "nutzer";

	/**
	 * @author Merlin
	 * @param neuerNutzer 
	 * @see Methode speichert einen Nutzer in der Datenbank ab
	 */
	public static void nutzerSpeichern(NutzerBean neuerNutzer) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO " + tabellenname + " (name,email,punkte,passwort,admin,dateiname,bild) VALUES (?,?,0,?,0,null,null)")) {
			pstmt.setString(1, neuerNutzer.getName());
			pstmt.setString(2, neuerNutzer.getEmail());
			pstmt.setString(3, neuerNutzer.getPasswort());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author Merlin
	 * @param name
	 * @return
	 */
	public static NutzerViewBean gebeMirNutzeranzeigeMitDemNamen(String name) {
		NutzerViewBean nutzerAnzeige = new NutzerViewBean();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT name,email,admin,punkte,dateiname FROM " + tabellenname + " WHERE name = ? ")) {
			pstmt.setString(1, name);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					nutzerAnzeige.setName(rs.getString("name"));
					nutzerAnzeige.setEmail(rs.getString("email"));
					nutzerAnzeige.setAdmin(rs.getInt("admin"));
					nutzerAnzeige.setPunkte(rs.getInt("punkte"));
					nutzerAnzeige.setDateiname(rs.getString("dateiname"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nutzerAnzeige;
	}
	
	/**
	 * @author Merlin
	 * @param name
	 * @return NutzerBean
	 * @see Diese Methode liefert ein "Nutzer"-Objekt zum angegenen Namen
	 *      (Primaerschluessel).
	 * 
	 */
	public static NutzerBean gebeMirNutzerMitDemNamen(String name) {
		NutzerBean nutzer = new NutzerBean();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + tabellenname + " WHERE name = ? ")) {
			pstmt.setString(1, name);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					nutzer.setName(rs.getString("name"));
					nutzer.setEmail(rs.getString("email"));
					nutzer.setPasswort(rs.getString("passwort"));
					nutzer.setAdmin(rs.getInt("admin"));
					nutzer.setPunkte(rs.getInt("punkte"));
					nutzer.setDateiname(rs.getString("dateiname"));
					nutzer.setBild(rs.getObject("bild"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nutzer;
	}

	/**
	 * @author Merlin
	 * @param name
	 * @see Diese Methode leoscht den Nutzer mit dem angegebenen namen aus der
	 *      Datenbank.
	 */
	public static void loescheNutzerMitDemNamen(String name) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM " + tabellenname + " WHERE name = ? ")) {
			pstmt.setString(1, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author Merlin
	 * @param alteMail
	 * @param neueMail
	 * @see Diese Methode aktualisiert die E-Mailadresse des angegebenen Nutzers zur
	 *      angegebnen E-Mailadresse.
	 */
	public static void aktualisiereEmailDesNutzers(String neueMail, String alteMail) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET email = ? WHERE name = ? ")) {
			pstmt.setString(1, neueMail);
			pstmt.setString(2, alteMail);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author Merlin
	 * @param alterName
	 * @param neuerName
	 * @see Methode zur aktualisierung des Nutzernamens
	 */
	public static void aktualisiereDenNutzernamen(String neuerName, String alterName) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET name = ? WHERE name = ? ")) {
			pstmt.setString(1, neuerName);
			pstmt.setString(2, alterName);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author Merlin
	 * @return boolean
	 * @see Diese Methode ueberprueft ob ein Nutzername bereits vergeben ist.
	 */
	public static boolean istNutzernameVergeben(String wunschname) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + tabellenname + " WHERE name = ? ")) {
			pstmt.setString(1, wunschname);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * @author Merlin
	 * @param wunschname
	 * @param neuerPunktestand
	 * @see Methode setzt den Punktestand des angegbenen Nutzers. Diese Methode kann von den SpeieleServlets genutzt werden.
	 */
	public static void setzePunkteDesNutzersAuf(HttpSession session, int neuerPunktestand) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("UPDATE "+tabellenname+" SET punkte = ? WHERE name = ?")) {
			pstmt.setInt(1, neuerPunktestand);
			pstmt.setString(2, ((NutzerViewBean) session.getAttribute(NutzerViewBean.attributName)).getName());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
