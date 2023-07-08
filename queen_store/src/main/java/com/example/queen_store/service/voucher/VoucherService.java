package com.example.queen_store.service.voucher;

import com.example.queen_store.model.voucher.Voucher;
import com.example.queen_store.repository.voucher.IVoucherRepository;
import com.example.queen_store.repository.voucher.VoucherRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VoucherService implements IVoucherService{
    private static IVoucherRepository voucherRepository = new VoucherRepository();

    @Override
    public List<Voucher> selectAllVoucher() {
        return voucherRepository.selectAllVoucher();
    }

//    @Override
//    public void insertVoucher(Voucher voucher) {
//        voucherRepository.insertVoucher(voucher);
//    }

    @Override
    public Voucher selectVoucher(int id) {
        return voucherRepository.selectVoucher(id);
    }

    @Override
    public void deleteVoucher(int id) {
        voucherRepository.deleteVoucher(id);
    }

    @Override
    public void updateVoucher(Voucher voucher) {
        voucherRepository.updateVoucher(voucher);
    }

    @Override
    public List<Voucher> searchByName(String searchName) {
        List<Voucher> voucherList = voucherRepository.searchByName(searchName);
        if (voucherList.isEmpty()){
            return null;
        }
        return voucherList;
    }

    @Override
    public List<Voucher> orderByIncreaseRate() {
        return voucherRepository.orderByIncreaseRate();
    }

    @Override
    public List<Voucher> orderByDecreaseRate() {
        return voucherRepository.orderByDecreaseRate();
    }

    @Override
    public Map<String, String> save(Voucher voucher) {
        Map<String, String> errMap = new HashMap<>();
        if (voucher.getName().equals("") ||voucher.getName()==null){
            errMap.put("errName","Ten khong duoc de trong");
        }
        if (errMap.isEmpty()){
            voucherRepository.insertVoucher(voucher);
        }
        return errMap;
    }
}
