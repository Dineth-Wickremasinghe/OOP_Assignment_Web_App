package org.example.oop_assignment_web_app.Entity;

public class Customer extends User { //Inheritance
    String type = "Customer";

    public Customer(){
        this.type = "Customer";
    }
    public Customer(String name, String email, String password) {
        super(name,email,password);

    }

    //Polymorphism
    public String displayType() {
        return type;
    }


    public String getEmail() {
        return super.getEmail();
    }
    public String getName(){
        return super.getName();
    }
}

