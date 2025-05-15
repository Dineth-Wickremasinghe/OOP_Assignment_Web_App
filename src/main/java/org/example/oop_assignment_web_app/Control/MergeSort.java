package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Car;



public class MergeSort {
    public static Car[] mergeSort(Car[] cars) {

       //make linked list into array:
        DArray array = new DArray(cars.length);
        // Insert all cars into the DArray
        for (Car car : cars) {
            array.insert(car);
        }

        // Perform merge sort
        array.mergeSort();

        // Return the sorted array
        return array.getArray();

    }
}

class DArray {
    private final Car[] theArray;
    private int nElements;

    public DArray(int max) {
        theArray = new Car[max];
        nElements = 0;
    }

    public void insert(Car car) {
        theArray[nElements++] = car;
    }

    public void print() {
        for (int i = 0; i < nElements; i++) {
            System.out.print(theArray[i] + " ");
        }
        System.out.println();
    }

    public void mergeSort() {
        Car[] workSpace = new Car[nElements];
        recMergeSort(workSpace, 0, nElements - 1);
    }

    private void recMergeSort(Car[] workSpace, int lowerBound, int upperBound) {
        if (lowerBound == upperBound) {
            return;
        } else {
            int mid = (lowerBound + upperBound) / 2;
            recMergeSort(workSpace, lowerBound, mid);
            recMergeSort(workSpace, mid + 1, upperBound);
            merge(workSpace, lowerBound, mid + 1, upperBound);
        }
    }

    private void merge(Car[] workSpace, int lowPtr, int highPtr, int upperBound) {
        int j = 0;
        int lowerBound = lowPtr;
        int mid = highPtr - 1;
        int n = upperBound - lowerBound + 1;

        while (lowPtr <= mid && highPtr <= upperBound) {
            if (theArray[lowPtr].getPrice() < theArray[highPtr].getPrice()) {
                workSpace[j++] = theArray[lowPtr++];
            } else {
                workSpace[j++] = theArray[highPtr++];
            }
        }

        while (lowPtr <= mid) {
            workSpace[j++] = theArray[lowPtr++];
        }

        while (highPtr <= upperBound) {
            workSpace[j++] = theArray[highPtr++];
        }

        for (j = 0; j < n; j++) {
            theArray[lowerBound + j] = workSpace[j];
        }
    }

    // Getter for sorted array
    public Car[] getArray() {
        Car[] result = new Car[nElements];
        System.arraycopy(theArray, 0, result, 0, nElements);
        return result;
    }
}
