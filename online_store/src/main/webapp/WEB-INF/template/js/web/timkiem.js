
var listSanPham = [];
function load() {
    laySanPhams();
}
load();
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};
function laySanPhams() {
    var txt = getUrlParameter("txt");
    const sanPhamsApi = "http://localhost:8080/api/sanpham/timkiem?txt="+txt;
    fetch(sanPhamsApi)
        .then(function (response){
            return response.json();
        })
        .then(function (sanPhams){
            listSanPham = sanPhams;
            xuatHTML(listSanPham);
        });
}

let trangHienTai = 1;
let soSanPhamTrang = 6;
let batDau = 0;
let ketThuc = soSanPhamTrang;
let soSanPham = 0;
let soTrang;

function xuatHTML(sanPhams) {
    soSanPham = sanPhams.length;
    soTrang = Math.ceil(soSanPham/soSanPhamTrang);
    xuatDanhSachTrang();
    const sanPhamView = document.getElementById("listSanPham");
    const htmls = sanPhams.map((sanPham , index) => {
        if(index >= batDau && index <ketThuc) {
            return `
                <div class="col-12 col-md-6 col-lg-4 product">
                    <div class="card">
                        <img class="card-img-top" src="${sanPham.pathAnh}" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title show_txt"><a href="/chi-tiet-san-pham?id=${sanPham.id}" title="View Product">${sanPham.ten}</a></h4>
                            <p class="card-text show_txt">${sanPham.danhMuc.ten} / ${sanPham.nhanHieu.ten}</p>
                            <div class="row price-add-to-card">
                                <div class="col price">
                                    <p class="btn btn-danger btn-block">${sanPham.gia.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            })}</p>
                                </div>
                                <div class="col add-to-card" style=" text-align: center">
                                    <button class="btn btn-success" onclick="themSanPham(${sanPham.id})">Thêm vào giỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        `;
        }
    })
    if(sanPhamView !== null){
        sanPhamView.innerHTML = htmls.join('');
    }

}

function rsTrang(trang){
    trangHienTai = trang;
    batDau = (trangHienTai - 1) * soSanPhamTrang;
    ketThuc = trangHienTai * soSanPhamTrang;
}

function onClickTrangSau() {
    trangHienTai ++;
    if(trangHienTai > soTrang) trangHienTai = soTrang;
    rsTrang(trangHienTai);
    xuatHTML(listSanPham);
    activeTrang();
}

function onClickTrangTruoc() {
    trangHienTai --;
    if(trangHienTai < 1) trangHienTai = 1;
    rsTrang(trangHienTai);
    xuatHTML(listSanPham);
    activeTrang();
}



function xuatDanhSachTrang() {
    let html = '';
    html += `<li class="page-item" onclick="onClickTrangTruoc()"><a class="page-link">Trước</a></li>`;
    html += `<li class="page-item active"><a class="page-link">1</a></li>`;
    for (let i = 2; i<= soTrang; i++){
        console.log("i:" + i);
        html += `<li class="page-item"><a class="page-link">${i}</a></li>`;
    }
    html += `<li class="page-item" onclick="onClickTrangSau()"><a class="page-link">Sau</a></li>`;
    if(document.getElementById("so-trang") != null){
        document.getElementById("so-trang").innerHTML = html;
    }

    chuyenTrang()
}

function activeTrang() {
    $('#so-trang li').removeClass('active');

    $(`#so-trang li:nth-child(${trangHienTai+1})`).addClass('active');

}




function chuyenTrang() {
    const danhSachTrang = document.querySelectorAll("#so-trang li");
    console.log(danhSachTrang);
    for (let i = 1; i< danhSachTrang.length - 1; i++){
        danhSachTrang[i].addEventListener('click',function (){
            rsTrang(i);
            xuatHTML(listSanPham);
            activeTrang();
        })
    }

}


