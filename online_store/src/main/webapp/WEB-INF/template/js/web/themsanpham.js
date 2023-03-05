


function themSanPham(id) {

    const url = "http://localhost:8080/api/sanpham/get/"+id;
    console.log("id: "+id);
    fetch(url)
        .then(function (response) {
            return response.json();
        })
        .then(function (sp) {
            if(sp.soLuong === 0){
                alert("Sản phẩm này đã hết hàng vui lòng quay lại sau");
            }else{
                themVaoGio(id);
            }
        })

}

function themVaoGio(id) {
    const url = "http://localhost:8080/api/giohang/themvaogio/"+id;
    fetch(url)
        .then(function (response) {
            return response.json();
        })
        .then(function (dt) {
            if(dt.trangThai === "chuadangnhap"){
                let cf = confirm("vui lòng đăng nhập");
                if(cf){
                    window.location = "http://localhost:8080/dang-nhap";
                }
            }else{
                alert(dt.thongBao);
                soLuongChiMucGioHang();
            }
        })
}