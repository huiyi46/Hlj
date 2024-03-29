package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.Agricultural;

public class FindAgriculturalDAO {

	private DB db = new DB();

	public Vector<Agricultural> findAllAgriculture() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<Agricultural> agriculturals = new Vector<Agricultural>();
		try {
			String sql = " select id,name,address,district,x,y,link from agricultural ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				agriculturals.addElement(new Agricultural(rs.getInt(1), rs
						.getString(2), rs.getString(3), rs.getString(4), rs
						.getDouble(5), rs.getDouble(6), rs.getString(7)));
			}
			return agriculturals;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
