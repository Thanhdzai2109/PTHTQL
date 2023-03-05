
const url = "http://localhost:8080/api/brand/get/all";

function start() {
    layNhanHieu(xuatHTML);
}

start();

function layNhanHieu(goilai) {
    fetch(url)
        .then(function (response){
            return response.json();
        })
        .then(goilai)
}

function xuatHTML(cacNhanHieu) {
    console.log(cacNhanHieu);
    const tbody = document.querySelector("tbody");
    const htmls = cacNhanHieu.map(function (nhanHieu) {
        return `
                <tr>
                    <td>${nhanHieu.id}</td>
                    <td>${nhanHieu.ten}</td>
                    <td><a data-toggle="modal" onclick="onDeleteBrand(${nhanHieu.id})"><i class="fa-solid fa-trash-can" style="color: #620e0e"></i></a></td>
                    
                </tr>
        `;
    });
    tbody.innerHTML = htmls.join('');
}

function onDeleteBrand(id) {
    const deleteApi = "http://localhost:8080/api/brand/delete/"+id;
    fetch(deleteApi,{
        method:"DELETE"
    })
        .then(function (response) {
            if(response.ok){
                alert("Xóa thành công!")
            }
            layNhanHieu(xuatHTML);
        })
}

document.getElementById("form_them_nhan_hieu").addEventListener("submit",function (e) {
    e.preventDefault();
    const ten = document.getElementById("nhanHieu");
    const nhanHieuJson = {
        "ten": ten.value
    };
    if(ten.value === ""){
        alert("Tên nhãn hiệu không được để trống!");
    }else{
        const themNhanHieuApi = "http://localhost:8080/api/brand/save";
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
                layNhanHieu(xuatHTML);
            })
    }
})

