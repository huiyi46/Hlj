package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.UnionCategory;

public class FindUnionDAO {

	private DB db = new DB();

	public Vector<UnionCategory> FindUnionCategories() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<UnionCategory> unionCategories = new Vector<UnionCategory>();
		try {
			String sql = "select a.category, count(a.category) b from `union` a GROUP BY a.category ORDER BY b";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				unionCategories.addElement(new UnionCategory(rs.getString(1),
						rs.getString(2)));
			}
			return unionCategories;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}

	public Vector<String> FindUnions() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<String> unions = new Vector<String>();
		try {
			String sql = "select name from `union` ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				String name = rs.getString(1);
				unions.addElement(name.substring(0, name.length() - 10));
			}
			return unions;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
