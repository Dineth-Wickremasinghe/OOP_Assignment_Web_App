package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Car;

public class CarLinkedList {
    public Link first;
    public int links;

    public CarLinkedList() {
        first = null;
        links = 0;
    }

    public Link getFirst() {
        return first;
    }

    public boolean isEmpty() {
        return (first == null);
    }

    public int size() {
        return links;
    }

    public Link find(String key) {
        Link current = first;
        while (current != null) {
            if (current.id.equals(key)) {
                return current;
            }
            current = current.next;
        }
        return null;
    }

    public void displayList() {
        Link current = first;
        while (current != null) {
            current.displayLink();
            current = current.next;
        }
        System.out.println();
    }

    public void insertFirst(Car car) {
        Link newLink = new Link(car);
        newLink.next = first;
        first = newLink;
        links++;
    }
    public void insertLast(Car car) {
        Link newLink = new Link(car);

        if (isEmpty()) {
            first = newLink;
        } else {
            Link current = first;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newLink;
        }
        links++;
    }


    public void insertAfter(String key, Car car) {
        Link current = find(key);
        if (current == null) {
            System.out.println("Key not available");
        } else {
            Link newLink = new Link(car);
            newLink.next = current.next;
            current.next = newLink;
            links++;
            System.out.println("New key added after " + key);
        }
    }

    public Link delete(String key) {
        Link current = first;
        Link prev = null;

        while (current != null && !current.id.equals(key)) {
            prev = current;
            current = current.next;
        }

        if (current == null) {
            return null;
        }

        if (prev == null) {
            first = first.next;
        } else {
            prev.next = current.next;
        }

        links--;
        return current;
    }

    public Link deleteFirst() {
        if (isEmpty()) return null;

        Link temp = first;
        first = first.next;
        links--;
        return temp;
    }

    public void deleteAll() {
        while (!isEmpty()) {
            deleteFirst();
        }
    }
}
