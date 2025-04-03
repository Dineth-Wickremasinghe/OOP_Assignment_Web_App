package org.example.oop_assignment_web_app;

public class Customer extends User {
    String type = "Customer";

    public Customer(){
        this.type = "Customer";
    }
    public Customer(String name, String email, String password) {
        super(name,email,password);

    }

    public String getType() {
        return type;
    }
    public String getEmail() {
        return super.getEmail();
    }
    public String getName(){
        return super.getName();
    }
}

