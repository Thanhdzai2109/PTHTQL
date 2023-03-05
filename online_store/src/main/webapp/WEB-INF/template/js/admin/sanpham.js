
function load(){
    laySanPhams(xuatHTML);
}

load()

function laySanPhams(callback) {
    const sanPhamsApi = "http://localhost:8080/api/sanpham/get/all";
    fetch(sanPhamsApi)
        .then(function (response){
            return response.json();
        })
        .then(callback);
}

function xuatHTML(sanPhams) {
    const tbody = document.querySelector("tbody");
    const htmls = sanPhams.map(function (sanPham) {
        return `
            <tr>
                <td><img src="${sanPham.pathAnh}" alt="" class="img-fluid" style="height: 50px; width: auto;"></td>
                <td>${sanPham.ten}</td>
                <td>${sanPham.danhMuc.ten}</td>
                <td>${sanPham.nhanHieu.ten}</td>
                <td>${sanPham.gia}VND</td>
                <td>${sanPham.soLuong}</td>
                <td><button class="btn btn-danger" onclick="xoaSanPham(${sanPham.id})">Xóa</button></td>
            </tr>
        `;
    })
    tbody.innerHTML = htmls.join('');
}
// xóa sản phẩm
function xoaSanPham(id) {
    const xoaSanPhamApi = "http://localhost:8080/api/sanpham/xoa/"+id;
    fetch(xoaSanPhamApi,{
        method:"DELETE"
    })
        .then(function (response) {
            return response.json();
        })
        .then(function (doiTuongTraVe){
            alert(doiTuongTraVe.thongBao);
            laySanPhams(xuatHTML);
        })

}

document.getElementById("form_them_san_pham").addEventListener("submit",function (e){
    e.preventDefault();
    const data = new FormData();
    data.append("ten",document.getElementById("tenSanPham").value);
    data.append("gia",document.getElementById("gia").value);
    data.append("gioiTinh",document.getElementById("gioiTinh").value);
    data.append("mauSac",document.getElementById("mauSac").value);
    data.append("soLuong",document.getElementById("soLuong").value);
    data.append("moTa",document.getElementById("moTa").value);
    data.append("danhMuc",document.getElementById("danhMuc").value);
    data.append("nhanHieu",document.getElementById("nhanHieu").value);
    data.append("anh",document.getElementById("hinhAnh").files[0]);
    var url = "http://localhost:8080/api/sanpham/luu";
    fetch(url,{
        method:"POST",
        body: data
        // headers: {
        //     "Content-Type": "multipart/form-data"
        // },
        // mode : "no-cors"
    })
        .then(function (response){
            return response.json()
        })
        .then(function (doiTuongTraVe){
            alert(doiTuongTraVe.thongBao)
            laySanPhams(xuatHTML);
        })
})

