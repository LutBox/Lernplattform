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

	public static KontaktanfrageBean gibMirKontaktanfrageMitDerNummer(Integer nanr) throws ServletException {
		KontaktanfrageBean anfrage = new KontaktanfrageBean();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + tabellenname + " WHERE kanr = ?")) {
			pstmt.setInt(1, nanr);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs != null && rs.next()) {
					anfrage.setKanr(rs.getInt("kanr"));
					anfrage.setEmail(rs.getString("email"));
					anfrage.setGelesen(rs.getInt("gelesen"));
					anfrage.setNachricht(rs.getString("nachricht"));
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return anfrage;
	}

	public static ArrayList<KontaktanfrageBean> gibMirAnfragenDerEmail(String email) throws ServletException {
		ArrayList<KontaktanfrageBean> anfragen = new ArrayList<KontaktanfrageBean>();
		KontaktanfrageBean anfrage = new KontaktanfrageBean();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + tabellenname + " WHERE email = ?")) {
			pstmt.setString(1, email);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs != null && rs.next()) {
					anfrage.setKanr(rs.getInt("kanr"));
					anfrage.setEmail(rs.getString("email"));
					anfrage.setGelesen(rs.getInt("gelesen"));
					anfrage.setNachricht(rs.getString("nachricht"));
					anfragen.add(anfrage);
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return anfragen;
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
}
