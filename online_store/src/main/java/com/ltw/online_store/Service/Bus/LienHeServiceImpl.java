package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.LienHe;
import com.ltw.online_store.Repository.LienHeRepository;
import com.ltw.online_store.Service.LienHeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LienHeServiceImpl implements LienHeService {
    @Autowired
    private LienHeRepository lienHeRepository;


    @Override
    public LienHe luuLienHe(LienHe lienHe) {
        return lienHeRepository.save(lienHe);
    }



    @Override
    public List<LienHe> tatCaLienHe() {
        return lienHeRepository.findAll();
    }

    @Override
    public void xoaLienHe(Long id) {
        lienHeRepository.deleteById(id);
    }

    @Override
    public LienHe timTheoId(Long id) {
        return lienHeRepository.findById(id).get();
    }
}
