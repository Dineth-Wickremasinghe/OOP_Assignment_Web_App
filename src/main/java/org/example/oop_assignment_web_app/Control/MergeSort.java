package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Car;

public class MergeSort {
    public static Car[] mergeSort(Car[] cars) {
        MergeSortArray array = new MergeSortArray(cars.length);
        for (Car car : cars) {
            array.insert(car);
        }

        array.mergeSort();
        return array.getArray();
    }
}
class MergeSortArray {
    private final Car[] theArray;
    private int nElements;

    public MergeSortArray(int max) {
        theArray = new Car[max];
        nElements = 0;
    }

    public void insert(Car car) {
        theArray[nElements++] = car;
    }

    public void mergeSort() {
        recMergeSort(theArray, 0, nElements - 1);
    }

    private void recMergeSort(Car[] A, int p, int r) {  //stands for recursive Merge Sort
        if (p < r) {
            int q = (p + r) / 2;
            recMergeSort(A, p, q);
            recMergeSort(A, q + 1, r);
            merge(A, p, q, r);
        }
    }

    private void merge(Car[] A, int p, int q, int r) {
        int n1 = q - p + 1;
        int n2 = r - q;

        Car[] L = new Car[n1 + 1];
        Car[] R = new Car[n2 + 1];

        // Copy left half into L[0..n1-1]
        for (int i = 0; i < n1; i++) {
            L[i] = A[p + i];
        }

        // Copy right half into R[0..n2-1]
        for (int j = 0; j < n2; j++) {
            R[j] = A[q + 1 + j];
        }


        L[n1] = new Car();
        L[n1].setPrice(Double.MAX_VALUE);

        R[n2] = new Car();
        R[n2].setPrice(Double.MAX_VALUE);

        int i = 0, j = 0;

        for (int k = p; k <= r; k++) {
            if (L[i].getPrice() <= R[j].getPrice()) {
                A[k] = L[i];
                i++;
            } else {
                A[k] = R[j];
                j++;
            }
        }
    }

    public Car[] getArray() {
        Car[] result = new Car[nElements];
        System.arraycopy(theArray, 0, result, 0, nElements);
        return result;
    }
}
