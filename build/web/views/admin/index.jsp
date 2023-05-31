<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
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
		<a href="#" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">Trang quản trị</span>
		</a>
		<ul class="side-menu top">
			<li>
				<a href="/shop/admin" id="thongke">
					<i class='bx bxs-dashboard'></i>
					<span class="text">Trang chủ</span>
				</a>
			</li>
                        <li>
				<a href="/shop/admin" >
					<i class='bx bxs-dashboard'></i>
					<span class="text">Quản lý danh mục</span>
				</a>
			</li>
			<li class="active">
				<a href="/shop/admin-product" id="mystore">
					<i class='bx bxs-shopping-bag-alt'></i>
					<span class="text">Quản lý sản phẩm</span>
				</a>

			</li>
		
                        <li>
                            <a href="/shop/admin" id="addcategory">
                                <i class='bx bxs-doughnut-chart'></i>
                                <span class="text">Quản lý đơn hàng</span>
                            </a>
                        </li>
			
			<li>
				<a href="/shop/admin" id="tk">
					<i class='bx bxs-group'></i>
					<span class="text">Quản lý người dùng</span>
				</a>
			</li>
<!--                        <li>
				<a href="#" id="mystore">
					<i class='bx bxs-shopping-bag-alt'></i>
					<span class="text">Quay lại trang Home</span>
				</a>

			</li>-->
		</ul>
        
		<ul class="side-menu">
			<li>
				<a href="#" class="logout">
					<i class='bx bxs-log-out-circle'></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
        <!-- CONTENT -->
	<section id="content">
        <nav>
                <i class='bx bx-menu'><img src="images/menu.svg"/></i>
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
						<p>Visitors</p>
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

