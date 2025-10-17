package com.bookstore.bootstrap;

import com.bookstore.entity.VaiTroEntity;
import com.bookstore.repository.VaiTroRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleSeeder implements ApplicationRunner {
    private final VaiTroRepository vaiTroRepository;

    @Override
    public void run(ApplicationArguments args) {
        seed("ADMIN", "Quản trị");
        seed("NV_BAN_HANG", "Nhân viên bán hàng");
        seed("NV_KHO", "Nhân viên kho");
        seed("KHACH_HANG", "Khách hàng");
    }

    private void seed(String maVT, String ten) {
        if (!vaiTroRepository.existsByMaVT(maVT)) {
            VaiTroEntity r = new VaiTroEntity();
            r.setMaVT(maVT);
            r.setTenVaiTro(ten);
            vaiTroRepository.save(r);
        }
    }
}
