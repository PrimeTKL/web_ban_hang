/*  xử lý sự kiện khi người dùng nhấp vào một mục trong menu bên.*/
const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

allSideMenu.forEach(item => {
	const li = item.parentElement;

	item.addEventListener('click', function () {
		allSideMenu.forEach(i => {
			i.parentElement.classList.remove('active');
		})
		li.classList.add('active');
	})
});




// TOGGLE SIDEBAR xử lý sự kiện khi người dùng nhấp vào biểu tượng menu trong thanh điều hướng
const menuBar = document.querySelector('#content nav .bx.bx-menu');
const sidebar = document.getElementById('sidebar');

menuBar.addEventListener('click', function () {
	sidebar.classList.toggle('hide');
})






//xử lý sự kiện và thay đổi trạng thái của các phần tử trong giao diện người dùng dựa trên kích thước cửa sổ trình duyệt

const searchButton = document.querySelector('#content nav form .form-input button');
const searchButtonIcon = document.querySelector('#content nav form .form-input button .bx');
const searchForm = document.querySelector('#content nav form');

searchButton.addEventListener('click', function (e) {
	if (window.innerWidth < 576) {
		e.preventDefault();
		searchForm.classList.toggle('show');
		if (searchForm.classList.contains('show')) {
			searchButtonIcon.classList.replace('bx-search', 'bx-x');
		} else {
			searchButtonIcon.classList.replace('bx-x', 'bx-search');
		}
	}
})





if (window.innerWidth < 768) {
	sidebar.classList.add('hide');
} else if (window.innerWidth > 576) {
	searchButtonIcon.classList.replace('bx-x', 'bx-search');
	searchForm.classList.remove('show');
}


window.addEventListener('resize', function () {
	if (this.innerWidth > 576) {
		searchButtonIcon.classList.replace('bx-x', 'bx-search');
		searchForm.classList.remove('show');
	}
})


// chuyển đổi màu sắc body
const switchMode = document.getElementById('switch-mode');

switchMode.addEventListener('change', function () {
	if (this.checked) {
		document.body.classList.add('dark');
	} else {
		document.body.classList.remove('dark');
	}
})
// Lấy thẻ <a> bằng id
var myLink = document.getElementById('mystore');

// Xử lý sự kiện click
myLink.addEventListener('click', function (event) {
	event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

	var orderElement = document.querySelector('.list_product');
	if (orderElement) {
		orderElement.scrollIntoView(); // Chuyển hướng đến phần tử có class .order
	}
});
var myLink = document.getElementById('addcategory');

// Xử lý sự kiện click
myLink.addEventListener('click', function (event) {
	event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

	var orderElement = document.querySelector('.addproduct');
	if (orderElement) {
		orderElement.scrollIntoView(); // Chuyển hướng đến phần tử có class .order
	}
});

var myLink=document.getElementById('tk')
// Xử lý sự kiện click
myLink.addEventListener('click', function (event) {
	event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

	var orderElement = document.querySelector('.list-tk');
	if (orderElement) {
		orderElement.scrollIntoView(); // Chuyển hướng đến phần tử có class .order
	}
});
var myLink=document.getElementById('thongke')
// Xử lý sự kiện click
myLink.addEventListener('click', function (event) {
	event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

	var orderElement = document.querySelector('.thongketrang');
	if (orderElement) {
		orderElement.scrollIntoView(); // Chuyển hướng đến phần tử có class .order
	}
});

//xử lý hiển thị sửa sản phẩm
const updates=document.querySelectorAll('.js-updatesp')
            const modal=document.querySelector('.modal')
			const modalClose=document.querySelector('.js-modalclose')
			function showUpdates(){
				modal.classList.add('open')			}
			function closeUpdate(){
				modal.classList.remove('open')
			}
			for(const update of updates){
				//lắng nghe click của người dùng
				update.addEventListener('click',showUpdates)
			}

			modalClose.addEventListener('click',closeUpdate)
// xử lý sửa thông tin tài khoản
const updatesuser=document.querySelectorAll('.js-updateuser') 
      const modalus=document.querySelector('.modaluser')
	  const modalCloseus=document.querySelector('.js-modalcloseus')
	  function showUpdatesus(){
		modalus.classList.add('open')
	  }
	  function closeUpdateus(){
		modalus.classList.remove('open')
	  }
	  for(const updateus of updatesuser){
		updateus.addEventListener('click',showUpdatesus)
	  }
	  modalCloseus.addEventListener('click',closeUpdateus)
//sử lý thêm tk
	  const updatesacc=document.querySelector('.js-addaccount') 
      const modalacc=document.querySelector('.modalacc')
	  const modalCloseacc=document.querySelector('.js-modalcloseacc')
	  function showUpdatesacc(){
		modalacc.classList.add('open')
	  }
	  function closeUpdateacc(){
		modalacc.classList.remove('open')
	  }
	updatesacc.addEventListener('click',showUpdatesacc)
	  modalCloseacc.addEventListener('click',closeUpdateacc)