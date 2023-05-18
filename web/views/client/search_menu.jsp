<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu dọc</title>
<link rel="stylesheet" href="css/category.css" />
</head>
<body>
	
	<div class="container">
		<nav>
		<ul class="mcd-menu">
		<li>
		<form accept-charset="utf-8" method="post" action="search" name="">
                        <p>
                        <label for="tensp">Tên sản phẩm</label>
                        <br>
                        <input accept-charset="utf-8" type="text"  name="ten_san_pham" style="width:97%">
                        </p>
                        <p>
                        <label for="theloai">Thể loại</label>
                        <br>
                        <select accept-charset="utf-8" name="ma_the_loai" style="width:100%">
                        	<option value="" selected="selected">--Chọn thể loại--</option>
                        	<c:forEach items="${requestScope.categories}" var="c">
                        		<option accept-charset="utf-8"  value="${c.ma_the_loai}">${c.ten_the_loai}</option>
                        	</c:forEach>
                        		
                        </select>
                        </p>
                        <input type="submit" value="Tìm kiếm" name="timKiem">
                	</form>
                	</li>
                	<li style="color: red">${requestScope.err}</li>
                	</ul>
		</nav>
	</div>
</body>
</html>