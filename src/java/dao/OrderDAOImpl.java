package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Category;
import model.Order;

public class OrderDAOImpl implements OrderDAO {

	@Override
	public void addOrder(Order h) {
		Connection con = null;
            try {
                con = new DBConnect().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
		String sql = "insert into `order` value(?,?,?,?,?,?, ?)";
		PreparedStatement ps;

		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, h.getOrder_id());
			ps.setInt(2, h.getUser_id());
			ps.setInt(3, h.getMa_san_pham());
			ps.setTimestamp(4, h.getNgay_mua());
			ps.setInt(5, h.getSo_luong());
			ps.setInt(6, h.getThanh_tien());
                        ps.setString(7, h.getTrang_thai());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Order> getList(int id) {
		Connection con = null;
            try {
                con = new DBConnect().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
		String sql = "select * from `order` where user_id="+ id +"";
		List<Order> list = new ArrayList<Order>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int order_id = rs.getInt("order_id");
				int user_id = rs.getInt("user_id");
				int ma_san_pham = rs.getInt("ma_san_pham");
				Timestamp ngay_mua = rs.getTimestamp("ngay_mua");
				int so_luong = rs.getInt("so_luong");
				int thanh_tien = rs.getInt("thanh_tien");
                                String trang_thai = rs.getString("trang_thai");
				list.add(new Order(order_id, user_id, ma_san_pham, ngay_mua, so_luong, thanh_tien, trang_thai));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
