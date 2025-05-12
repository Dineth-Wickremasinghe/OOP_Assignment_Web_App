package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Transaction;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

public class TransactionManager {
    private static final String FILE_PATH = "C:/Files/transactions.txt";
    private LinkedList<Transaction> transactions;

    public TransactionManager() {
        this.transactions = new LinkedList<Transaction>();
        FileHandler.createFile(FILE_PATH);
    }

    public LinkedList<Transaction> loadTransactions() {
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return transactions;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String transId = parts[0];
                    String carId = parts[1];
                    String price = parts[2];
                    String date = parts[3];

                    double priceDouble = Double.parseDouble(price);
                    Transaction tr = new Transaction(transId, carId, priceDouble, date);
                    transactions.add(tr);
                }
            }
        } catch (IOException e) {
            System.out.println("Error loading transactions: " + e.getMessage());
        }
        return transactions;
    }

    public void addTransaction(Transaction transaction) {
        transactions.add(transaction);
    }

    public void removeTransaction(Transaction transaction){
        transactions.remove(transaction);
    }


    public LinkedList<Transaction> getTransactions(){

        return transactions;
    }

    public boolean createTransaction(String carId, double price) {
        try{FileHandler.createFile(FILE_PATH);}
        catch (Exception e){
            System.out.println("Unable to create file");
            return false;
        }
        Transaction newTr = new Transaction(carId, price);
        boolean result = transactions.add(newTr);
        if (result) {
            FileHandler.fileWritetrans(transactions, FILE_PATH);
        }
        return result;
    }



    public Transaction getTransactionById(String id,LinkedList<Transaction> t2) {
        for (Transaction tr : t2) {
            if (tr.getTransactionId().equals(id)) {
                return tr;
            }
        }
        return null;
    }

    public double calculate_total_sales(LinkedList<Transaction> t2) {
        double total_sales = 0;
        for(Transaction tr : t2){
            double line = tr.getPrice();
            total_sales += line;

        }
        return total_sales;
    }






}

