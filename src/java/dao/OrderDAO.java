package dao;

import java.util.List;

import model.Order;

public interface OrderDAO {
	
	//thêm mới một lịch sử mua hàng.
	public void addOrder(Order h);
	
	//lọc lịch sử của khách hàng.
	public List<Order> getList(int user_id);

}
