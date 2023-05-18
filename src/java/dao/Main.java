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
        List<Product> products = productDAO.searchList("Áo", 6);
        System.out.println(products.size());
        for (Product product : products) {
            System.out.println(product.getTen_san_pham());
        }
    }
}
