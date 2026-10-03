package com.store.model;

public class Product {
    private int id;
    private String name;
    private String category;
    private double price;
    private String tag;

    public Product(int id, String name, String category, double price, String tag) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.tag = tag;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public double getPrice() { return price; }
    public String getTag() { return tag; }
}
