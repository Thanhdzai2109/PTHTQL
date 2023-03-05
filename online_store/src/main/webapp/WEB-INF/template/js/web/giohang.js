
function load() {
    layGioHang(xuatGioHang)
}
load();

function layGioHang(goilai) {
    var url = "http://localhost:8080/api/giohang/lay/giohangnguoidunghientai";
    fetch(url)
        .then(function (response) {
            return response.json();
        })
        .then(goilai);
}


function xuatGioHang(chiMucs) {
    console.log("list chi muc : "+chiMucs);
    const tbody = document.querySelector("tbody");
    var tongThanhToan = 0;
    const htmls = chiMucs.map(function (chiMuc) {
        var gia = chiMuc.soLuong * chiMuc.sanPham.gia;
        tongThanhToan += gia;
        console.log("id: "+chiMuc.id);
        return `
             <tr>
                 <td class="align-middle">
                         <img src="${chiMuc.sanPham.pathAnh}" alt="" style="width: 70px;" class="img-fluid rounded shadow-sm">
                 </td>
                 <td class="align-middle"> 
                     <div class="d-inline-block align-middle">
                         <h5 class="mb-0"><a href="#" class="text-dark d-inline-block">${chiMuc.sanPham.ten}</a></h5>
                         <span class="text-muted font-weight-normal font-italic">${chiMuc.sanPham.danhMuc.ten}/</span>
                         <span class="text-muted font-weight-normal font-italic">${chiMuc.sanPham.nhanHieu.ten}</span>
                     </div>
                 </td>
                 <td class="align-middle"><strong>${gia.toLocaleString('vi-VN', {
            style: 'currency',
            currency: 'VND'
        })}</strong></td>
                 <td class="align-middle">
                     <button class="btn btnSub" onclick="thayDoiSoLuong(${chiMuc.id},${chiMuc.soLuong -1})">-</button>
                     <strong>${chiMuc.soLuong}</strong>
                     <button class="btn btnAdd" onclick="thayDoiSoLuong(${chiMuc.id},${chiMuc.soLuong +1})">+</button>
                 </td>
                 <td class="align-middle"><a href="#" class="text-dark">
                         <button type="button" class="btn btn-danger" onclick="xoaChiMuc(${chiMuc.id})">Xóa</button>
                     </a>
                 </td>
                 
             </tr> 
        `;
    })
    tbody.innerHTML = htmls.join('');
    document.getElementById("soChiMucCuaGioHang").innerHTML = chiMucs.length;
    document.getElementById("tongThanhToan").innerHTML = `<h5 class="font-weight-bold" id="tongThanhToan">${tongThanhToan.toLocaleString('vi-VN', {
        style: 'currency',
        currency: 'VND'
    })}</h5>`;
}

function thayDoiSoLuong(id , sl) {
    if (sl > 0){
        console.log("id"+id,"sl: "+sl);
        url = `http://localhost:8080/api/giohang/thaydoi/chimuc?id=${id}&soLuong=${sl}`;
        fetch(url,{
            method:"POST"
        })
            .then(function (response) {
                return response.json();
            })
            .then(function (dt) {
                if(dt.trangThai === "ok"){
                    layGioHang(xuatGioHang);
                }
            })
    }

}

function xoaChiMuc(id) {
    url = `http://localhost:8080/api/giohang/xoa/chimuc/`+id;
    fetch(url,{
        method:"POST"
    })
        .then(function (response) {
            if(response.ok){
                layGioHang(xuatGioHang);
            }
        })
}

