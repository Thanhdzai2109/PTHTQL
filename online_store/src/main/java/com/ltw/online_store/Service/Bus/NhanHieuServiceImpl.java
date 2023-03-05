package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.NhanHieu;
import com.ltw.online_store.Repository.NhanHieuRepository;
import com.ltw.online_store.Service.NhanHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhanHieuServiceImpl implements NhanHieuService {
    @Autowired
    private NhanHieuRepository nhanHieuRepository;


    @Override
    public void save(String name) {
        nhanHieuRepository.save(new NhanHieu(name));
    }

    @Override
    public void save(NhanHieu nhanHieu) {
        nhanHieuRepository.save(nhanHieu);
    }

    @Override
    public List<NhanHieu> getAll() {
        return nhanHieuRepository.findAll();
    }

    @Override
    public boolean nhanHieuTonTai(NhanHieu nhanHieu) {
        if(nhanHieuRepository.findByTen(nhanHieu.getTen()) != null){
            return true;
        }
        return false;
    }

    @Override
    public void deleteById(Long id) {
        nhanHieuRepository.deleteById(id);
    }

    @Override
    public NhanHieu timTheoTen(String ten) {
        return nhanHieuRepository.findByTen(ten);
    }

    @Override
    public NhanHieu timTheoId(Long id) {
        return nhanHieuRepository.findById(id).get();
    }


}
