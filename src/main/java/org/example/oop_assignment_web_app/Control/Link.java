package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Car;

public class Link {
    public String id;
    public Link next;
    public Car car;


    public Link(Car car){

        this.next = null;
        this.car = car;
        this.id = car.getId();

    }


    public void displayLink(){
        System.out.println("ID: "+id);
        System.out.println("Brand: "+car.getBrand());
        System.out.println("Model: "+car.getModel());
        System.out.println("Price: "+car.getPrice());
        System.out.println();

    }
}