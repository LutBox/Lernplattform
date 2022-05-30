package dienste.sqldienste;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import beans.KontaktanfrageBean;
import jakarta.servlet.ServletException;

/**
 * @author Merlin
 */
public class KontaktanfragenSQLDienst extends SQLDienst {
	private static final String tabellenname = "`kontaktanfragen`";

	public static void anfrageSpeichern(String email, String nachricht) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("INSERT INTO " + tabellenname + "(email,gelesen,nachricht) VALUES (?,?,?)")) {
			pstmt.setString(1, email);
			pstmt.setInt(2, 0);
			pstmt.setString(3, nachricht);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	public static void loescheKontaktanfrageMitDerNummer(Integer kanr) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM " + tabellenname + " WHERE kanr = ?")) {
			pstmt.setInt(1, kanr);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	public static ArrayList<KontaktanfrageBean> gibAlleAnfragen_gelesen(boolean gelesen) throws ServletException {
		ArrayList<KontaktanfrageBean> ungelesene = new ArrayList<KontaktanfrageBean>();
		Integer nachrichtstatus = 0;
		if (gelesen) {
			nachrichtstatus = 1;
		}
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM `kontaktanfragen` WHERE gelesen = ?")) {
			pstmt.setInt(1, nachrichtstatus);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs != null && rs.next()) {
					KontaktanfrageBean kontaktanfrage = new KontaktanfrageBean();
					kontaktanfrage.setEmail(rs.getString("email"));
					kontaktanfrage.setKanr(rs.getInt("kanr"));
					kontaktanfrage.setNachricht(rs.getString("nachricht"));
					kontaktanfrage.setGelesen(rs.getInt("gelesen"));
					ungelesene.add(kontaktanfrage);
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return ungelesene;
	}

	public static void alsGelesenMarkieren(Integer kanr) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET gelesen = 1 WHERE kanr = ? ")) {
			pstmt.setInt(1, kanr);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	public static void alsUngelesenMarkieren(Integer kanr) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE " + tabellenname + " SET gelesen = 0 WHERE kanr = ? ")) {
			pstmt.setInt(1, kanr);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}
}
