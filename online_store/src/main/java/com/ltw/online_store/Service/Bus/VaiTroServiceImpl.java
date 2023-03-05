package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.VaiTro;
import com.ltw.online_store.Repository.VaiTroRepository;
import com.ltw.online_store.Service.VaiTroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class VaiTroServiceImpl implements VaiTroService {
    @Autowired
    private VaiTroRepository vaiTroRepository;


    @Override
    public Set<VaiTro> getRoleAdmins() {
        Set<VaiTro> vaiTros = new HashSet<VaiTro>();
        vaiTros.add(vaiTroRepository.findByTen("ROLE_ADMIN"));
        return vaiTros;
    }

    @Override
    public Set<VaiTro> getRoleUsers() {
        Set<VaiTro> vaiTros = new HashSet<VaiTro>();
        vaiTros.add(vaiTroRepository.findByTen("ROLE_USER"));
        return vaiTros;
    }

    @Override
    public List<VaiTro> getAll() {
        return vaiTroRepository.findAll();
    }

}
