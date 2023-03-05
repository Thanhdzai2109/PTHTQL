
const url = "http://localhost:8080/api/danh-muc/get/cac-danh-muc";

function start() {
    layCacDanhMuc(xuatHTML);
}

start();

function layCacDanhMuc(goilai) {
    fetch(url)
        .then(function (response){
            return response.json();
        })
        .then(goilai)
}

function xuatHTML(cacDanhMuc) {
    console.log(cacDanhMuc);
    const tbody = document.querySelector("tbody");
    const htmls = cacDanhMuc.map(function (danhMuc) {
        return `
                <tr>
                    <td>${danhMuc.id}</td>
                    <td>${danhMuc.ten}</td>
                    <td><a data-toggle="modal" onclick="onDeleteBrand(${danhMuc.id})"><i class="fa-solid fa-trash-can" style="color: #620e0e"></i></a></td>

                </tr>
        `;
    });
    tbody.innerHTML = htmls.join('');
}

function onDeleteBrand(id) {
    const deleteApi = "C"+id;
    fetch(deleteApi,{
        method:"DELETE"
    })
        .then(function (response) {
            if(response.ok){
                alert("Xóa thành công!")
            }
            layCacDanhMuc(xuatHTML);
        })
}

document.getElementById("form_them_danh_muc").addEventListener("submit",function (e) {
    e.preventDefault();
    const ten = document.getElementById("danhMuc");
    const nhanHieuJson = {
        "ten": ten.value
    };
    if(ten.value === ""){
        alert("Tên danh mục không được để trống!");
    }else{
        const themNhanHieuApi = "http://localhost:8080/api/danh-muc/them";
        fetch(themNhanHieuApi,{
            method:"POST",
            body: JSON.stringify(nhanHieuJson),
            headers: {
                "Content-Type": "application/json; charset=UTF-8"
            }
        })
            .then(function (response){
                return response.json();
            })
            .then(function (doiTuongTraVe){
                alert(doiTuongTraVe.thongBao);
                layCacDanhMuc(xuatHTML);
            })
    }
})

