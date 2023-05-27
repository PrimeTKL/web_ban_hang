<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admin.css">
    <title>Danh sách sản phẩm</title>
</head>

<body>


        <!-- SIDEBAR -->
        <section id="sidebar">
		<a href="#" class="brand">
			<i class='bx'></i>
			<span class="text">AdminHub</span>
		</a>
		<ul class="side-menu top">
			<li>
				<a href="" id="thongke">
                                    <i class='bx'><img src="images/1.png"></i>
					<span class="text">Trang chủ</span>
				</a>
			</li>
			<li>
				<a href="#" id="mystore">
					<i class='bx'></i>
					<span class="text">Quản lý người dùng</span>
				</a>

			</li>
			<li>
				<a href="#" id="addcategory">
					<i class='bx'></i>
					<span class="text">Quản lý danh mục</span>
				</a>
			</li>
			<li class="active">
				<a href="admin-product">
					<i class='bx'></i>
					<span class="text">Quản lý sản phẩm</span>
				</a>
			</li>
			<li>
				<a href="#" id="tk">
					<i class='bx'></i>
					<span class="text">Quản lý đơn hàng</span>
				</a>
			</li>
                        <li>
				<a href="#" id="tk">
					<i class='bx'></i>
					<span class="text">Phân quyền</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<li>
				<a href="#" class="logout">
					<i class='bx'></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu'></i>
                <a href="#" class="nav-link">Categories</a>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search'></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                
                <a href="#" class="btn-download">
                    <i class='bx bxs-cloud-download'></i>
                    <span class="text">thêm tài khoản</span>
                </a>

            </nav>
            <main>
                <div div class="table-data">
                    <div class="order list_product">
                        <div class="head">
                            <button class="btn-download js-them">
                                <i class='bx bxs-cloud-download'></i>
                                <span class="text">thêm sản phẩm</span>
                            </button>
                            <h3>Danh mục sản phẩm</h3>
                            <i class='bx bx-search'></i>
                            <i class='bx bx-filter'></i>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th style="text-align: center">Tên sản phẩm</th>
                                    <th style="text-align: center">Hình ảnh</th>
                                    <th style="text-align: center">Thể loại</th>
                                    <th style="text-align: center">Giá bán</th>
                                    <th style="text-align: center">Hãng sản xuất</th>
                                    <th style="text-align: center">Thông tin</th>
                                    <th style="text-align: center">Số lượng kho</th>
                                    <th style="text-align: center">Số lượng bán</th>
                                    <th style="text-align: center">Hiển thị</th>
                                    <th style="text-align: center">Sửa</th>
                                    <th style="text-align: center">Xóa</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%--<c:set var="categories" value="${requestScope.categories}"></c:set>--%>
                                <c:forEach items="${requestScope.products}" varStatus="loop" var="product">
                                    
                                    <tr>
                                        <td style="text-align: center">${product.ten_san_pham}</td>
                                        <td style="text-align: center"><img src="sanpham/${product.hinh_anh}"> </td>
                                        <td style="text-align: center">${categories[product.ma_the_loai].ten_the_loai}</td>
                                        <td style="text-align: center">${product.gia_ban}</td>
                                        <td style="text-align: center">${product.hang_san_xuat}</td>
                                        <td style="text-align: center">${product.thong_tin}</td>
                                        <td style="text-align: center">${product.so_luong_kho}</td>
                                        <td style="text-align: center">${product.so_luong_ban}</td>
                                        <c:if test="${product.hien_thi == 1}">
                                            <td><input type="radio" checked="checked" readonly> </td>
                                        </c:if>
                                        <c:if test="${product.hien_thi == 0}">
                                        <td><input type="radio" readonly></td>
                                        </c:if>
                                        <!--<td style="text-align: center">${product.hien_thi}</td>-->
                                        <td><button class="update js-sua">Sửa</button></td>
                                        <td><a class="delete" href="/shop/admin-product?command=delete&ma_san_pham=${product.ma_san_pham}">Xóa</a></td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <ul>
                                <li><a href="#"><i class="fas fa-chevron-left"></i></a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#"><i class="fas fa-chevron-right"></i></a></li>
                                <!-- Thêm các nút phân trang khác vào đây -->
                            </ul>
                        </div>

                    </div>
                </div>
            </main>
        </section>
    <!--thêm-->
    <form action="admin-product" method="post" enctype="multipart/form-data">
        <div class="modalthem js_modal">
            <div class="todo change_product change">
                <div class="head">
                    <h3>Thêm sản phẩm</h3>
                    
                    
                </div>
                <ul class="todo-list">
                    <li class="completed_list">
                        <p>Tên sản phẩm <input class="addsp" name="ten_san_pham" type="text" placeholder="Tên sản phẩm..." required></p>

                    </li>
                    <li class="completed_list">
                        <p>Giá <input class="addsp" name="gia_ban" type="number" min="0" placeholder="Giá..." required></p>

                    </li>
                    <li class="completed_list">
                        Thể loại <select accept-charset="utf-8" name="ma_the_loai" required>
                            <c:forEach items="${categories}" var="category">
                                <option accept-charset="utf-8"  value="${category.key}">${category.value.ten_the_loai}</option>
                            </c:forEach>
                        </select>
                        
                    </li>
                    <li class="completed_list">
                        Ảnh sản phẩm <input class="addsp" type="file" name="hinh_anh" required/>

                    </li>
                    <li class="completed_list">
                        Hãng sản xuất <input type="text" class="text-sp" name="hang_san_xuat" required/>
                    </li>
                    <li class="completed_list">
                        Thông tin <input type="text" class="text-sp" name="thong_tin" id="product-content" required/>
                    </li>
                    <li class="completed_list">
                        Số lượng kho <input class="addsp" type="number" name="so_luong_kho" value="0" min="0" placeholder="Số lượng kho..." required/>
                    </li>
                    <li class="completed_list">
                        Số lượng bán <input class="addsp" type="number" name="so_luong_ban" value="0" min="0" placeholder="Số lượng bán..." required/>
                    </li>
                    <li class="completed_list">
                        Hiển thị <input class="addsp" type="checkbox" value="1" name="hien_thi" checked />
                        <input type="hidden" value="0" name="ma_san_pham">
                    </li>
                    <li>
                        <input class="savesp" type="submit" title="Lưu sản phẩm" value="Lưu sản phẩm" />
                    </li>
                </ul>
                
                <div class="footer js-modalclosethem"><a class="close ">close</a></div>
            </div>
        </div>
    </form>
    <script src="js/script.js"></script>
</body>

</html>