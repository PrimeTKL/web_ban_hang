package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Category;

public class CategoryDAOImpl{

	 Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Category> getAll(){
        String query = "SELECT * FROM `category`";
        List<Category> list = new ArrayList<>();
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

	public void addCategory(Category c) throws Exception {
		 conn = new DBConnect().getConnection();
		String sql = "insert into category value(?,?,?, ?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, c.getMa_the_loai());
			ps.setString(2, c.getTen_the_loai());
			ps.setString(3, c.getMo_ta());
                        ps.setString(3, c.getHinh_anh());
			ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public List<Category> getList() throws Exception {
		 conn = new DBConnect().getConnection();
		String sql = "select * from category";
		List<Category> list = new ArrayList<Category>();
		try {
			PreparedStatement ps = (PreparedStatement) conn
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int ma_the_loai = rs.getInt("ma_the_loai");
				String ten_the_loai = rs.getString("ten_the_loai");
				String mo_ta = rs.getString("mo_ta");
				String hinh_anh = rs.getString("hinh_anh");
				list.add(new Category(ma_the_loai, ten_the_loai, mo_ta, hinh_anh));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) throws Exception {
		CategoryDAOImpl dao = new CategoryDAOImpl();
//		Category c = new Category(8, "Samsung", "DT");
//		// dao.addCategory(c);
//		// System.out.println(dao.getList());
//		// dao.delCategory(10);
//		dao.updateCategory(c);
                List<Category> list = dao.getAll();
                for (Category x : list) {
                System.out.println(x);
        }
                System.out.println("");
	}
	public void delCategory(int ma_the_loai) {
             try {
                 conn = new DBConnect().getConnection();
             } catch (Exception ex) {
                 Logger.getLogger(CategoryDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
             }
		String sql = "delete from category where ma_the_loai='" + ma_the_loai
				+ "'";
		try {
			PreparedStatement ps = (PreparedStatement) conn
					.prepareStatement(sql);
			ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}


	public Category getCategory(int id) throws Exception {
		conn = new DBConnect().getConnection();
		String sql = "select * from category where ma_the_loai='" + id + "'";
		Category c = new Category();
		try {
			PreparedStatement ps = (PreparedStatement) conn
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int ma_the_loai = rs.getInt("ma_the_loai");
				String ten_the_loai = rs.getString("ten_the_loai");
				String mo_ta = rs.getString("mo_ta");
				String hinh_anh = rs.getString("hinh_anh");
				c = new Category(ma_the_loai, ten_the_loai, mo_ta, hinh_anh);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	public void updateCategory(Category c) throws Exception {
		conn = new DBConnect().getConnection();
		String sql = "update category set ten_the_loai=?, mo_ta=? where ma_the_loai=?";
		try {
			PreparedStatement ps = (PreparedStatement) conn
					.prepareStatement(sql);
			ps.setString(1, c.getTen_the_loai());
			ps.setString(2, c.getMo_ta());
			ps.setInt(3, c.getMa_the_loai());
			ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

