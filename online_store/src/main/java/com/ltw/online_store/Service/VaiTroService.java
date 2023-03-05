package com.ltw.online_store.Service;

import com.ltw.online_store.Entity.VaiTro;

import java.util.List;
import java.util.Set;

public interface VaiTroService {
    Set<VaiTro> getRoleAdmins();
    Set<VaiTro> getRoleUsers();

    List<VaiTro> getAll();
}
