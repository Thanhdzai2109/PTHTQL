function soLuongChiMucGioHang() {
    var url = "http://localhost:8080/api/giohang/lay/giohangnguoidunghientai";
    fetch(url)
        .then(function (response) {
            return response.json();
        })
        .then(function (chiMucs) {
            if(document.getElementById("soChiMucCuaGioHang") != null){
                document.getElementById("soChiMucCuaGioHang").innerHTML = chiMucs.length;
            }

        });
}

soLuongChiMucGioHang();