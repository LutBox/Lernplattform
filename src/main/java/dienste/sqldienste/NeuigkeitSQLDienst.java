package dienste.sqldienste;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import beans.Neuigkeit;
import jakarta.servlet.ServletException;

/**
 * @author Merlin
 *
 */

public class NeuigkeitSQLDienst extends SQLDienst {

	/**
	 * @author Merlin Name der "Neuigkeiten"-Tabelle
	 */
	public static final String tabellenname = "`neuigkeiten`";
	public static final String ListBeanName = "neuigkeiten";

	public static void neuigkeitSpeichern(String nachricht) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("INSERT INTO " + tabellenname + " (nachricht,zeitstempel) VALUES (?,?)")) {
			pstmt.setString(1, nachricht);
			pstmt.setTimestamp(2, new Timestamp(new Date().getTime()));
			System.out.println(new Timestamp(new Date().getTime()));
			pstmt.executeUpdate();
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
	}

	public static void neuigkeitMitNrXAendern(Integer nnr, String neueNachricht) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"UPDATE " + tabellenname + " SET nachricht = ?, zeitstempel = zeitstempel where nnr = ?")) {
			pstmt.setString(1, neueNachricht);
			pstmt.setInt(2, nnr);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	public static Neuigkeit neuigkeitMitNrXLaden(Integer nnr) throws ServletException {
		Neuigkeit neuigkeit = new Neuigkeit();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + tabellenname + " WHERE nnr = ?")) {
			pstmt.setInt(1, nnr);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					neuigkeit.setNnr(nnr);
					neuigkeit.setNachricht(rs.getString("nachricht"));
					neuigkeit.setZeitstempel(new Date(rs.getTimestamp("zeitstempel").getTime()));
				}
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		return neuigkeit;
	}

	public static void neugigkeitMitNrXLoeschen(Integer nnr) throws ServletException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM " + tabellenname + " WHERE nnr = ? ")) {
			pstmt.setInt(1, nnr);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	public static ArrayList<Neuigkeit> neuigkeitenLaden() throws ServletException {
		ArrayList<Neuigkeit> ergebnis = null;
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + tabellenname);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs != null) {
					ergebnis = new ArrayList<Neuigkeit>();
					while (rs.next()) {
						Neuigkeit neuigkeit = new Neuigkeit();
						neuigkeit.setNnr(rs.getInt("nnr"));
						neuigkeit.setNachricht(rs.getString("nachricht"));
						neuigkeit.setZeitstempel(rs.getTimestamp("zeitstempel"));
						ergebnis.add(neuigkeit);
					}
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return ergebnis;
	}
}
