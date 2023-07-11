package com.example.queen_store.service.voucher;

import com.example.queen_store.model.voucher.Voucher;

import java.util.List;
import java.util.Map;

public interface IVoucherService {
    List<Voucher> selectAllVoucher();
    void insertVoucher(Voucher voucher);
//    Map<String, String> save(Voucher voucher);
    Voucher selectVoucher(int id);
    void deleteVoucher(int id);
    void updateVoucher(Voucher voucher);
    List<Voucher> searchByName(String searchName);
    List<Voucher> orderByIncreaseRate();
    List<Voucher> orderByDecreaseRate();

    boolean checkVoucherByName(String name);
    boolean checkVoucherByRate(float rate);

    Voucher getByNane(String voucherName);

//    Map<String, String> save(Voucher voucher);
}
