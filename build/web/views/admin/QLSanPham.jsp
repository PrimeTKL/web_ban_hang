<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admin.css">
    <title>danh sách sản phẩm</title>
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
                <!-- <a href="#" class="notification">
                        <i class='bx bxs-bell'></i>
                        <span class="num">8</span>
                    </a>
                    <a href="#" class="profile">
                        <img src="img/people.png">
                    </a> -->
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
                                <c:forEach items="${requestScope.products}" var="product">
                                    
                                    <tr>
                                        <td style="text-align: center">${product.ten_san_pham}</td>
                                        <td style="text-align: center"><img src="sanpham/${product.hinh_anh}"> </td>
                                        <td style="text-align: center">${categories[product.ma_the_loai].ten_the_loai}</td>
                                        <td style="text-align: center">${product.gia_ban}</td>
                                        <td style="text-align: center">${product.hang_san_xuat}</td>
                                        <td style="text-align: center">${product.thong_tin}</td>
                                        <td style="text-align: center">${product.so_luong_kho}</td>
                                        <td style="text-align: center">${product.so_luong_ban}</td>
                                        <c:if>
                                            
                                        </c:if>
                                        <td style="text-align: center">${product.hien_thi}</td>
                                        <td><button class="update js-sua">Sửa</button></td>
                                        <td><a class="delete" href="#">Xóa</a></td>

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
    <form action="">
        <div class="modalthem js_modal">
            <div class="todo change_product change">
                <div class="head">
                    <h3>thêm sản phẩm</h3>
                    <i class='bx bx-filter'></i>
                    <input class="savesp" type="submit" title="Lưu sản phẩm" value="lưu sản phẩm" />
                </div>
                <ul class="todo-list">
                    <li class="completed_list">
                        <p>tên sản phẩm <input class="addsp" type="text" placeholder="tên sản phẩm..."></p>

                    </li>
                    <li class="completed_list">
                        <p>giá sản phẩm <input class="addsp" type="text" placeholder="giá..."></p>

                    </li>
                    <li class="completed_list">
                        <p>ảnh sản phẩm <input class="addsp" type="file" placeholder=""></p>or link<input type="url">

                    </li>
                    <li class="completed_list">
                        <p>nội dung <textarea class="text-sp" name="content" id="product-content"></textarea>
                        </p>

                    </li>
                    <li class="completed_list">
                        <p>số lượng <input class="addsp" type="text" placeholder="note..."></p>
                    </li>

                </ul>
                <div class="footer js-modalclosethem"><a class="close ">close</a></div>
            </div>
        </div>
    </form>
        <!-- sửa sản phẩm -->
        <form action="">
            <div class="modalsua js_modal">
                <div class="todo change_product change">
                    <div class="head">
                        <h3>sửa sản phẩm</h3>
                        <i class='bx bx-filter'></i>
                        <input class="savesp" type="submit" title="Lưu sản phẩm" value="lưu sản phẩm" />
                    </div>
                    <ul class="todo-list">
                        <li class="completed_list">
                            <p>tên sản phẩm <input class="addsp" type="text" placeholder="tên sản phẩm..."></p>
        
                        </li>
                        <li class="completed_list">
                            <p>giá sản phẩm <input class="addsp" type="text" placeholder="giá..."></p>
        
                        </li>
                        <li class="completed_list">
                            <p>ảnh sản phẩm <input class="addsp" type="file" placeholder=""></p>or link<input type="url">
        
                        </li>
                        <li class="completed_list">
                            <p>nội dung <textarea class="text-sp" name="content" id="product-content"></textarea>
                            </p>
        
                        </li>
                        <li class="completed_list">
                            <p>số lượng <input class="addsp" type="text" placeholder="note..."></p>
                        </li>
        
                    </ul>
                    <div class="footer js-modalclosesua"><a class="close ">close</a></div>
                </div>
            </div>
        </form>
        <script src="js/script.js"></script>
</body>

</html>