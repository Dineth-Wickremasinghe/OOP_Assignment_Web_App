package org.example.oop_assignment_web_app.Entity;

public class Customer extends User { //Inheritance
    String type = "Customer";
    private String fullName;
    private int phone;


    public Customer(){
        this.type = "Customer";
    }
    public Customer(String name, String email, String password, String fullName, int phone) {
        super(name,email,password);
        this.fullName = fullName;
        this.phone = phone;

    }


    //Polymorphism
    public String displayType() {
        return type;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return super.getEmail();
    }
    public String getName(){
        return super.getName();
    }
}

