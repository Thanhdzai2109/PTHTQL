package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.DanhMuc;
import com.ltw.online_store.Repository.DanhMucRepository;
import com.ltw.online_store.Service.DanhMucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DanhMucServiceImpl implements DanhMucService {
    @Autowired
    private DanhMucRepository danhMucRepository;

    @Override
    public List<DanhMuc> tatCaDanhMuc() {
        return danhMucRepository.findAll();
    }

    @Override
    public void xoaBoiID(Long id) {
        danhMucRepository.deleteById(id);
    }

    @Override
    public boolean danhMucTonTai(DanhMuc danhMuc) {
        if(danhMucRepository.findByTen(danhMuc.getTen()) != null) return true;
        return false;
    }

    @Override
    public void luuDanhMuc(DanhMuc danhMuc) {
        danhMucRepository.save(danhMuc);
    }

    @Override
    public DanhMuc timTheoTen(String ten) {
        return danhMucRepository.findByTen(ten);
    }

    @Override
    public DanhMuc timTheoId(Long id) {
        return danhMucRepository.getById(id);
    }
}
