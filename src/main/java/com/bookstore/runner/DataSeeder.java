package com.bookstore.runner;

import com.bookstore.entity.VaiTroEntity;
import com.bookstore.repository.VaiTroRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataSeeder implements CommandLineRunner {

    private final VaiTroRepository vaiTroRepository;

    public DataSeeder(VaiTroRepository vaiTroRepository) {
        this.vaiTroRepository = vaiTroRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        seedRole("ADMIN", "Quản trị");
        seedRole("NV_KHO", "Nhân viên kho");
        seedRole("NV_BANHANG", "Nhân viên bán hàng");
        seedRole("KHACH_HANG", "Khách hàng");
    }

    private void seedRole(String ma, String ten) {
        boolean exist = vaiTroRepository.findAll().stream().anyMatch(r -> ma.equalsIgnoreCase(r.getMaVT()));
        if (!exist) {
            VaiTroEntity v = new VaiTroEntity();
            v.setMaVT(ma);
            v.setTenVaiTro(ten);
            vaiTroRepository.save(v);
        }
    }
}
