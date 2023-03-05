
const url = "http://localhost:8080/api/account/get/all";

function load() {
    layTaiKhoan(xuatHTML);
}

load();

function layTaiKhoan(goiLai) {
    fetch(url)
        .then(function (response) {
            return response.json()
        })
        .then(goiLai);
}

function xuatHTML(taiKhoans) {
    console.log(taiKhoans);
    const tbody = document.querySelector('tbody');
    const htmls = taiKhoans.map(function (taiKhoan) {
        console.log(taiKhoan.vaiTro);
        const role = taiKhoan.vaiTro.map(function (rl){
            console.log(rl);
            return `
                <p>${rl.ten}</p>
            `;
        })
        return `
                 <tr>
                    <td>${taiKhoan.id}</td>
                    <td>${taiKhoan.tenDangNhap}</td>
                    <td>${taiKhoan.email}</td>
                    <td>${taiKhoan.hoTen}</td>
                    <td>${taiKhoan.diaChi}</td>
                    <td>${role}</td>
                    <td><a data-toggle="modal" onclick="onDeleteAccount(${taiKhoan.id})"><i class="fa-solid fa-trash-can" style="color: #620e0e"></i></a></td>
                    
                </tr>
        `;
    });
    tbody.innerHTML = htmls.join('');
}

function onDeleteAccount(id){
    const xoaTaiKhoanApi = "http://localhost:8080/api/account/delete/" + id;
    fetch(xoaTaiKhoanApi,{
        method:"DELETE"
    })
        .then(function (response) {
            if(response.ok){
                alert("Xóa thành công!");
            }
            layTaiKhoan(xuatHTML);
        });

}

// ------------------ add account ------------------------------------
document.getElementById("form_them_tai_khoan").addEventListener("submit",function (e){
    e.preventDefault();
    const tenDangNhap = document.getElementById("tenDangNhap");
    const matKhau = document.getElementById("matKhau");
    const email = document.getElementById("email");
    const diaChi = document.getElementById("diaChi");
    const tenVaiTro = document.getElementById("vaiTro");

    const data = {
        'tenDangNhap': tenDangNhap.value,
        'email': email.value,
        'diaChi': diaChi.value,
        'matKhau': matKhau.value,
        'tenVaiTro': 'ROLE_'+tenVaiTro.value
    };
    console.log(data);
    if (matKhau.value === ''){
        alert("Mật khẩu không được để trống!");
    }else {
        const url = "http://localhost:8080/api/account/save";
        fetch(url, {
            method: "POST",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=UTF-8"
            }
        })
            .then(function (response) {
                return response.json();
            })
            .then(function (doiTuongTraVe){
                alert(doiTuongTraVe.thongBao);
                layTaiKhoan(xuatHTML);
            })
    }
})