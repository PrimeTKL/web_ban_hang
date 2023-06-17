<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/admin.css">
        <title>Trang quản trị</title>
         <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Dữ liệu mẫu cho biểu đồ
            var data = google.visualization.arrayToDataTable([
                ['Trạng thái', 'Số lượng'],
                ['Đã giao hàng', ${tongSoDonHangDaGiaoHang}],
                ['Đang chờ duyệt', ${tongSoDonHangDangChoDuyet}],
            ]);

            var options = {
                title: 'Biểu đồ thống kê số lượng đơn hàng'
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

            chart.draw(data, options);
        }
    </script>
   <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
            data.addColumn('string', 'Danh mục');
            data.addColumn('number', 'Doanh thu - VNÐ');

            <c:forEach items="${requestScope.doanhThuTheoDanhMuc}" varStatus="loop" var="entry">
              data.addRow(['${entry.key.ten_the_loai}', ${entry.value}]);
            </c:forEach>

        var options = {
          chart: {
            title: 'Biểu đồ thống kê danh mục ',
          },
           hAxis: {
          titleTextStyle: {
            fontSize: 25, // Kích thước chữ
            bold: true, // Đậm chữ
          },
  },

        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    </head>
    <body>
         
        <section id="sidebar">
		<a href="/shop/admin" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">Trang quản trị</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="/shop/admin" id="thongke">
					<i class='bx bxs-dashboard'></i>
					<span class="text">Trang chủ</span>
				</a>
			</li>
                        <li>
				<a href="/shop/listdanhmuc" >
					<i class='bx bx-category'></i>
					<span class="text">Quản lý danh mục</span>
				</a>
			</li>
			<li >
				<a href="/shop/admin-product" id="mystore">
					<i class='bx bxs-shopping-bag-alt'></i>
					<span class="text">Quản lý sản phẩm</span>
				</a>

			</li>
		
                        <li>
                            <a href="/shop/admin/order" id="addcategory">
                                <i class='bx bxs-doughnut-chart'></i>
                                <span class="text">Quản lý đơn hàng</span>
                            </a>
                        </li>
			
			<li >
				<a href="/shop/admin-user" id="tk">
					<i class='bx bxs-group'></i>
					<span class="text">Quản lý người dùng</span>
				</a>
			</li>
                        <c:if test="${sessionScope.admin.role == 1}">
                            <li >
				<a href="/shop/phanquyen" id="tk">
					<i class='bx bx-lock-alt'></i>
					<span class="text">Phân quyền</span>
				</a>
                            </li>
                            
                        </c:if>
		</ul>
        
		<ul class="side-menu">
			<li>
				<a href="/shop/admin/logout" class="logout">
					<i class='bx bxs-log-out-circle'></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
        <!-- CONTENT -->
	<section id="content">
        <nav>
                <i class='bx bx-menu'></i>
                <a href="/shop/admin" class="nav-link">Trang chủ</a>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search'></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                
                <a href="/shop/admin/update_profile" class="btn-download">
                    <i class='bx bxs-user-account'></i>
                    <span class="text">Xin chào: ${sessionScope.admin.username}</span>
                </a>

            </nav>

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a class="Dashboard" href="#">Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right'></i></li>
						<li>
							<a class="active" href="home">Home</a>
						</li>
					</ul>
				</div>

			</div>

			<ul class="box-info thongketrang">
				<li>
					<i class='bx bxs-calendar-check'></i>
					<span class="text">
						<h3>${tongSoDonHangDangChoDuyet}</h3>
                                          
						<p>Đơn hàng mới</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group'></i>
					<span class="text">
						<h3>${tongSoNguoiDung}</h3>
						<p>Người dùng</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle'></i>
					<span class="text">
                                              <h3>${requestScope.tongDoanhThu} VNÐ</h3>
						<p>Tổng doanh thu</p>
					</span>
				</li>
			</ul>
                        <table>
                       
                            <thead>
                                <h1>Thống kê theo tháng</h1>
                                <tr>
                                    <th style="text-align">Tháng</th>
                                    <th style="text-align">Doanh thu (VNÐ)</th>
                                    <th style="text-align">Tỉ lệ (%)</th>
                                </tr>
                            </thead>

                                   <tbody>
                                            <c:forEach items="${requestScope.tkTheoThang}" varStatus="loop" var="thang">
                                                <tr class="table-row">
                                                    <td class="table-cell">${thang.key}</td>
                                                    <td class="table-cell">${thang.value}</td>
                                                   <td><fmt:formatNumber pattern="0.00" value="${(thang.value / requestScope.tongDoanhThu * 100)}"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                        </table>

                                             <div id="chart_div" style="width: 100%; height: 100vh; "></div>
                                               <div id="columnchart_material" style="width: 100%; height: 100vh;"></div>
                                               <script src="js/script.js"></script>
            </main>
        </section>
    </body>
</html>

