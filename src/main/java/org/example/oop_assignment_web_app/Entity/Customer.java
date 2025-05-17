package org.example.oop_assignment_web_app.Entity;

public class Customer extends User { //Inheritance
    private String type = "Customer";
    private String fullName;
    private String phone;


    public Customer(){
        this.type = "Customer";
    }
    public Customer(String name, String email, String password, String fullName, String phone) {
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}

