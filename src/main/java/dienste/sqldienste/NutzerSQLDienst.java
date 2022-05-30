package dienste.sqldienste;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import beans.NutzerBean;
import beans.NutzerViewBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;

/**
 * @author Merlin Diese Klasse führt die Datenbankzugriffe des
 *         "Nutzer"-Geschaeftsobjekts aus.
 */
public class NutzerSQLDienst extends SQLDienst {
	/**
	 * @author Merlin Name der "Nutzer"-Datenbank
	 */
	private static final String tabellenname = "`nutzer`";

	/**
	 * @author Merlin
	 * @param neuerNutzer
	 * @throws ServletException
	 * @see Methode speichert einen Nutzer in der Datenbank ab
	 */
	public static void nutzerSpeichern(NutzerBean neuerNutzer, Part bild) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO " + tabellenname + " (name,email,passwort,bild) VALUES (?,?,?,?)")) {
			pstmt.setString(1, neuerNutzer.getName());
			pstmt.setString(2, neuerNutzer.getEmail());
			pstmt.setString(3, neuerNutzer.getPasswort());
			pstmt.setBinaryStream(4, bild.getInputStream());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	/**
	 * @author Merlin
	 * @param name
	 * @return NutzerViewBean
	 * @throws ServletException
	 */
	public static NutzerViewBean gebeMirNutzeranzeigeMitDemNamen(String name) throws ServletException {
		NutzerViewBean nutzerAnzeige = new NutzerViewBean();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name,email,admin,punkteBilderMemorie,punkteBilderOrdnen,punkteBilderBilderWort,punkteMathe,punkteJumpnrun"
								+ " FROM " + tabellenname + " WHERE name = ? ")) {
			pstmt.setString(1, name);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					nutzerAnzeige.setName(rs.getString("name"));
					nutzerAnzeige.setEmail(rs.getString("email"));
					nutzerAnzeige.setAdmin(rs.getInt("admin"));
					nutzerAnzeige.setPunkteBilderMemorie(rs.getInt("punkteBilderMemorie"));
					nutzerAnzeige.setPunkteBilderOrdnen(rs.getInt("punkteBilderOrdnen"));
					nutzerAnzeige.setPunkteBilderBilderWort(rs.getInt("punkteBilderBilderWort"));
					nutzerAnzeige.setPunkteMathe(rs.getInt("punkteMathe"));
					nutzerAnzeige.setPunkteJumpnrun(rs.getInt("punkteJumpnrun"));
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return nutzerAnzeige;
	}

	/**
	 * @author Merlin
	 * @param name
	 * @return NutzerBean
	 * @throws ServletException
	 * @see Diese Methode liefert ein "Nutzer"-Objekt zum angegenen Namen
	 *      (Primaerschluessel).
	 * 
	 */
	public static NutzerBean gebeMirNutzerMitDemNamen(String name) throws ServletException {
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
					nutzer.setPunkteBilderMemorie(rs.getInt("punkteBilderMemorie"));
					nutzer.setPunkteBilderOrdnen(rs.getInt("punkteBilderOrdnen"));
					nutzer.setPunkteBilderBilderWort(rs.getInt("punkteBilderBilderWort"));
					nutzer.setPunkteMathe(rs.getInt("punkteMathe"));
					nutzer.setPunkteJumpnrun(rs.getInt("punkteJumpnrun"));
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return nutzer;
	}

	/**
	 * @author Merlin
	 * @param name
	 * @throws ServletException
	 * @see Diese Methode leoscht den Nutzer mit dem angegebenen namen aus der
	 *      Datenbank.
	 */
	public static void loescheNutzerMitDemNamen(String name) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM " + tabellenname + " WHERE name = ? ")) {
			pstmt.setString(1, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	/**
	 * @author Merlin
	 * @param alteMail
	 * @param neueMail
	 * @throws ServletException
	 * @see Diese Methode aktualisiert die E-Mailadresse des angegebenen Nutzers zur
	 *      angegebnen E-Mailadresse.
	 */
	public static void aktualisiereEmailDesNutzers(String neueMail, String name) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET email = ? WHERE name = ? ")) {
			pstmt.setString(1, neueMail);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	/**
	 * @author Merlin
	 * @param alterName
	 * @param neuerName
	 * @throws ServletException
	 * @see Methode zur aktualisierung des Nutzernamens
	 */
	public static void aktualisiereDenNutzernamen(String neuerName, String alterName) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET name = ? WHERE name = ? ")) {
			pstmt.setString(1, neuerName);
			pstmt.setString(2, alterName);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	/**
	 * @param neuesPasswort
	 * @param name
	 * @throws ServletException
	 */
	public static void aktualisiereDasPasswortDesNutzers(String neuesPasswort, String name) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET passwort = ? WHERE name = ? ")) {
			pstmt.setString(1, neuesPasswort);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	/**
	 * @author Merlin
	 * @param anzahlErgebnisse
	 * @param fragment
	 * @return Liste mit Nutzer die frament im Namen enthalten
	 * @throws ServletException
	 */
	public static ArrayList<NutzerBean> gibMirXNutzerMitNamenWie(int anzahlErgebnisse, String fragment)
			throws ServletException {
		ArrayList<NutzerBean> ergebnis = new ArrayList<NutzerBean>();
		fragment = "%" + fragment + "%";
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("SELECT * FROM " + tabellenname + " WHERE name LIKE ? LIMIT ?")) {
			pstmt.setString(1, fragment);
			pstmt.setInt(2, anzahlErgebnisse);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					NutzerBean tmp = new NutzerBean();
					tmp.setName(rs.getString("name"));
					tmp.setEmail(rs.getString("email"));
					tmp.setPasswort(rs.getString("passwort"));
					tmp.setAdmin(rs.getInt("admin"));
					tmp.setPunkteBilderMemorie(rs.getInt("punkteBilderMemorie"));
					tmp.setPunkteBilderOrdnen(rs.getInt("punkteBilderOrdnen"));
					tmp.setPunkteBilderBilderWort(rs.getInt("punkteBilderBilderWort"));
					tmp.setPunkteMathe(rs.getInt("punkteMathe"));
					tmp.setPunkteJumpnrun(rs.getInt("punkteJumpnrun"));

					ergebnis.add(tmp);
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return ergebnis;
	}

	/**
	 * @author Merlin
	 * @return boolean
	 * @throws ServletException
	 * @see Diese Methode ueberprueft ob ein Nutzername bereits vergeben ist.
	 */
	public static boolean istNutzernameVergeben(String wunschname) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + tabellenname + " WHERE name = ? ")) {
			pstmt.setString(1, wunschname);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					return true;
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return false;
	}

	public static void aktualisiereProfilbildDesNutzers(Part bild, String name) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET bild = ? WHERE name = ? ")) {
			pstmt.setBinaryStream(1, bild.getInputStream());
			pstmt.setString(2, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	public static void aktualisiereStatusDesNutzers(Integer status, String name) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("update " + tabellenname + " set admin = ? where name = ?")) {
			pstmt.setInt(1, status);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}
}
