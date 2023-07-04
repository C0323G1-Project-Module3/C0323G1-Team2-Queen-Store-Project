package com.example.queen_store.model.voucher;

import java.util.Objects;

public class Voucher {
    private int voucher_id;
    private String voucher_name;
    private float voucher_rate;

    public Voucher() {
    }

    public Voucher(int voucher_id, String voucher_name, float voucher_rate) {
        this.voucher_id = voucher_id;
        this.voucher_name = voucher_name;
        this.voucher_rate = voucher_rate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Voucher voucher = (Voucher) o;
        return voucher_id == voucher.voucher_id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(voucher_id);
    }

    public int getVoucher_id() {
        return voucher_id;
    }

    public void setVoucher_id(int voucher_id) {
        this.voucher_id = voucher_id;
    }

    public String getVoucher_name() {
        return voucher_name;
    }

    public void setVoucher_name(String voucher_name) {
        this.voucher_name = voucher_name;
    }

    public float getVoucher_rate() {
        return voucher_rate;
    }

    public void setVoucher_rate(float voucher_rate) {
        this.voucher_rate = voucher_rate;
    }
}
