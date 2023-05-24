/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.Order;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class Main {
    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAOImpl();
        Product p = new Product();
        p.setMa_san_pham(0);
        p.setMa_the_loai(2);
        p.setTen_san_pham("test");
        p.setHinh_anh("new.jpg");
        p.setGia_ban(100000);
        p.setHang_san_xuat("hãng");
        p.setThong_tin("thông tin");
        p.setSo_luong_kho(30);
        p.setSo_luong_ban(1);
        p.setHien_thi(1);
        productDAO.addProduct(p);
        List<Product> products = productDAO.getList();
        System.out.println(products.size());
        for (Product product : products) {
            System.out.println(product.getTen_san_pham());
        }
    }
}
