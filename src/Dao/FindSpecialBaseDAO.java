package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.SpecialBase;

public class FindSpecialBaseDAO {

	private DB db = new DB();

	public Vector<SpecialBase> findAllSpecialBases() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<SpecialBase> specialBases = new Vector<SpecialBase>();
		try {
			String sql = " select id,name,level,x,y,link from specialbase ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				specialBases.addElement(new SpecialBase(rs.getInt(1), rs
						.getString(2), rs.getString(3), rs.getDouble(4), rs
						.getDouble(5), rs.getString(6)));
			}
			return specialBases;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
