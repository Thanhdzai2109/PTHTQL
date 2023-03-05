package com.ltw.online_store.utils.validator;

import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class XacThucNguoiDung implements Validator {
    @Autowired
    private NguoiDungService nguoiDungService;

    @Override
    public boolean supports(Class<?> clazz) {
        return NguoiDung.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        NguoiDung nguoiDung = (NguoiDung) target;
//        ValidationUtils.rejectIfEmpty(errors, "email", "error.email","please fill in Email field!");
//        ValidationUtils.rejectIfEmpty(errors,"userName","error.userName","please fill in UserName field!");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "error.confirmPassword", "please fill in confirmPassword field");
        Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

        if (!(pattern.matcher(nguoiDung.getEmail()).matches())) {
            errors.rejectValue("email", "error.email", "Email Không hợp lệ!");
        }

        if (nguoiDungService.findByTenDangNhap(nguoiDung.getTenDangNhap()) != null){
            errors.rejectValue("tenDangNhap","error.tenDangNhap","Tên đăng nhập đã tồn tại!");
        }

        if (nguoiDung.getMatKhau().length() < 3 || nguoiDung.getMatKhau().length() > 32) {
            errors.rejectValue("matKhau", "error.matKhau", "mật khẩu phải dài hơn 3 ký tự!");
        }

        if (!nguoiDung.getMatKhauXacThuc().equals(nguoiDung.getMatKhau())) {
            errors.rejectValue("matKhauXacThuc", "error.matKhauXacThuc", "Mật khẩu không khớp!");
        }

    }
}
