package com.cornucopib;

public class Main {

    public static void main(String[] args) {
//        test();
        test1();
    }

    private static void test() {
        int num = 2;
        for (int i = 31; i >= 0; i--) {
            System.out.print((num & (1 << i)) == 0 ? "0" : "1");
        }
    }

    private static void test1() {
        int[] arr = {0, 1, 10, 9, 8, 3};
        printArr(arr);
        selectSort(arr);
    }

    private static void printArr(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i]+" ");
        }
    }

    private static void selectSort(int[] arr) {

    }

    private static void bubbleSort() {

    }

    private static void insertSort(){

    }

}