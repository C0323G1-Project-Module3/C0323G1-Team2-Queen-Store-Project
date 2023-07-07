package com.example.queen_store.common.product;

public class ProductCommon {
//    public static boolean checkName(String name) {
//        return name.matches("";
//    }
    public static boolean checkInput(String input) {
        for (int i = 0; i < input.length(); i++) {
            if ((int) input.charAt(i) > 32 && (int) input.charAt(i) <= 64 ||
                    (int) input.charAt(i) >= 91 && (int) input.charAt(i) <= 96 ||
                    (int) input.charAt(i) >= 123 && (int) input.charAt(i) <= 126) {
                return false;
            }
        }
        return true;
    }
}
