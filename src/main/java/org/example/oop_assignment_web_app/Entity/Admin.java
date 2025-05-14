package org.example.oop_assignment_web_app.Entity;

public class Admin extends User {
    String type = "Admin";

    public Admin(){

        this.type = "Admin";
    }
    public Admin(String name, String email, String password) {
        super(name,email,password);

    }

    public String displayType() { //Polymorphism

        return type;
    }
    public String getEmail() {

        return super.getEmail();
    }
    public String getName(){

        return super.getName();
    }
}

