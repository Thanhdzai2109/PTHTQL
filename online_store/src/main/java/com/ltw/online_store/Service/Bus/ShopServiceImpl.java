package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Dto.SanPhamDto;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.SanPham;
import com.ltw.online_store.Entity.Shop;
import com.ltw.online_store.Repository.SanPhamRepository;
import com.ltw.online_store.Repository.ShopRepository;
import com.ltw.online_store.Service.DanhMucService;
import com.ltw.online_store.Service.NhanHieuService;
import com.ltw.online_store.Service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.List;

public class ShopServiceImpl implements ShopService {
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private ShopRepository shopRepository;
    @Autowired
    private NhanHieuService nhanHieuService;

    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private ServletContext app;
    @Override
    public List<Shop> tatCaShop() {
        return shopRepository.findAll();
    }

    @Override
    public void luuSanPham(SanPham sanPham) {
        sanPhamRepository.save(sanPham);
    }

    @Override
    public Long luuSanPham(SanPhamDto sanPhamDto) {
        SanPham sanPham = new SanPham();
        sanPham.setAnh(sanPhamDto.getAnh());
        sanPham.setTen(sanPhamDto.getTen());
        sanPham.setGia(sanPhamDto.getGia());
        System.out.println("nhan hieu: "+nhanHieuService.timTheoId(sanPhamDto.getNhanHieu()));
        sanPham.setNhanHieu(nhanHieuService.timTheoId(sanPhamDto.getNhanHieu()));
        sanPham.setDanhMuc(danhMucService.timTheoId(sanPhamDto.getDanhMuc()));

        sanPham.setMauSac(sanPhamDto.getMauSac());
        sanPham.setGioiTinh(sanPhamDto.getGioiTinh());
        sanPham.setMoTa(sanPhamDto.getMoTa());
        sanPham.setSoLuong(sanPhamDto.getSoLuong());
        sanPhamRepository.save(sanPham);
        sanPham.setPathAnh("/img/" +sanPham.getId()+ sanPhamDto.getAnh().getOriginalFilename());
        sanPhamRepository.save(sanPham);
        return sanPham.getId();
    }

    @Override
    public void xoaSanPham(Long id) {
        SanPham sanPham = sanPhamRepository.findById(id).get();
        String path = app.getRealPath("/");
        String filePath = path + "/WEB-INF/template"+sanPham.getPathAnh();
        File file = new File(filePath);
        file.delete();
        sanPhamRepository.deleteById(id);
    }

    @Override
    public SanPham timTheoId(Long id) {
        return sanPhamRepository.findById(id).get();
    }
}
