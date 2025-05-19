package com.packagemanagement;

import java.util.List;

public class PackageSorter {

    // method to sort a list of Core.TravelPackage by price using quick sort.
    public static void quickSort(List<TravelPackage> list) {
        quickSortByPrice(list, 0, list.size() - 1);
    }

    // Recursive quick sort implementation.
    private static void quickSortByPrice(List<TravelPackage> list, int low, int high) {
        if (low < high) {
            int pivotIndex = partition(list, low, high);
            quickSortByPrice(list, low, pivotIndex - 1);
            quickSortByPrice(list, pivotIndex + 1, high);
        }
    }

    // Partition method for quick sort.
    private static int partition(List<TravelPackage> list, int low, int high) {
        double pivot = list.get(high).getPrice(); // use last element as pivot
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (list.get(j).getPrice() <= pivot) {
                i++;
                swap(list, i, j);
            }
        }

        swap(list, i + 1, high);
        return i + 1;
    }

    // Swap helper method.
    private static void swap(List<TravelPackage> list, int i, int j) {
        TravelPackage temp = list.get(i);
        list.set(i, list.get(j));
        list.set(j, temp);
    }
}
