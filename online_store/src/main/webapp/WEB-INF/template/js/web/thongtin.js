
const profile_form = document.getElementById("profile-form");
profile_form.addEventListener("submit",function (e){
    e.preventDefault();

    const hoTen = document.getElementById("hoTen");
    const tenDangNhap = document.getElementById("tenDangNhap");
    const email = document.getElementById("email");
    const diaChi = document.getElementById("diaChi");
    const matKhauMoi = document.getElementById("matKhauMoi");
    const matKhauXacThuc = document.getElementById("matKhauXacNhan");

    const data = {
        'hoTen': hoTen.value,
        'tenDangNhap': tenDangNhap.value,
        'email': email.value,
        'diaChi': diaChi.value,
        'matKhau': matKhauXacThuc.value
    };
    if (matKhauMoi.value !== matKhauXacThuc.value){
        document.getElementById('warn-cf-pass').innerHTML = "Mật khẩu không khớp!";
    }else {
        const url = "http://localhost:8080/api/account/update";
        fetch(url, {
            method: "POST",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=UTF-8"
            }
        })
            .then(function (response) {
                if (response.ok) {
                    alert("Thay đổi thành công!");
                }
            })
            .catch(function (e) {
                alert("lỗi: " + e);
            })
    }

})