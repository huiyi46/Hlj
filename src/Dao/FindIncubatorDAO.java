package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.Incubator;

public class FindIncubatorDAO {

	private DB db = new DB();

	public Vector<Incubator> findAllIncubator() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<Incubator> incubators = new Vector<Incubator>();
		try {
			String sql = " select id,district,orgname,name,x,y,link from incubator ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				Incubator incubator = new Incubator(rs.getInt(1),
						rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getDouble(5), rs.getDouble(6), rs.getString(7));
				incubators.addElement(incubator);
			}
			return incubators;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
