package org.example.oop_assignment_web_app.Entity;

public abstract class User {
    //Abstraction
    //Made User an abstract class because it should not be possible to make User objects

    protected String name;
    protected String email;
    protected String password;
    //Encapsulation


    public User(){
        this.name = null;
        this.email = null;
        this.password = null;

    }

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;

    }

    public String getName() {

        return name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public String getEmail() {

        return email;
    }

    public void setEmail(String email) {

        this.email = email;
    }

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {

        this.password = password;
    }

    public abstract String displayType();
    //abstract method for children
}
