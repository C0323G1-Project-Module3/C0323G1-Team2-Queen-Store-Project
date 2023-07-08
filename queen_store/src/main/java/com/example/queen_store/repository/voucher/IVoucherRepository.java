package com.example.queen_store.repository.voucher;

import com.example.queen_store.model.voucher.Voucher;

import java.util.List;

public interface IVoucherRepository {
    List<Voucher> selectAllVoucher();
    void insertVoucher(Voucher voucher);
    Voucher selectVoucher(int id);
    void deleteVoucher(int id);
    void updateVoucher(Voucher voucher);
    List<Voucher> searchByName(String searchName);
    List<Voucher> orderByIncreaseRate();
    List<Voucher> orderByDecreaseRate();

}
