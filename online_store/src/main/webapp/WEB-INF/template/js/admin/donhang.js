const trangThaiEl = document.getElementById('trangThai');
var trangThai = trangThaiEl.value;
trangThaiEl.addEventListener('click',function (){
    trangThai = trangThaiEl.value;
    layDonHangs(xuatHTML)
})

function load() {
    layDonHangs(xuatHTML)
}

load();

function layDonHangs(goilai){
    const donHangsApi = "http://localhost:8080/api/donhang/get/all";
    fetch(donHangsApi)
        .then(function (response) {
            return response.json();
        })
        .then(goilai);
}

function trangThaiFormat(trangThai) {
    if(trangThai === "chuahoanthanh") return "Chưa hoàn thành";

    return "Hoàn thành";
}

function xuatHTML(donHangs){
    console.log(donHangs);
    const tbody = document.querySelector('tbody');
    const htmls = donHangs.map(function (donHang) {
        if (donHang.trangThai === trangThai){
            var html = '';
            html += `
            <tr>
                <td>${donHang.id}</td>
                <td>${donHang.nguoiDung.hoTen}</td>
                <td>${donHang.tongGia.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            })}</td>
                <td>${trangThaiFormat(donHang.trangThai)}</td>
                <td>${donHang.ngayDat}</td>
                <td>${donHang.ngayNhan}</td>
            `;
            if (trangThai === "chuahoanthanh"){
                html += `<td><button class="btn btn-success" onclick="xacNhanHoanThanh(${donHang.id})">Hoàn thành</button></td>`;
            }
            html += `</tr>`;
            return html;
        }
    })
    tbody.innerHTML = htmls.join('');
}

function xacNhanHoanThanh(id){
    const hoanThanhDonApi = "http://localhost:8080/api/donhang/hoanthanh/"+id;
    fetch(hoanThanhDonApi,{
        method:"POST"
    })
        .then(function (re) {
            if (re.ok){
                alert("Đơn đã hoàn thành");
                layDonHangs(xuatHTML);
            }
        })
}