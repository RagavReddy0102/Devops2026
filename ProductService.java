package com.store.service;

import com.store.model.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {

    private final List<Product> catalog = new ArrayList<>();

    public ProductService() {
        catalog.add(new Product(101, "Oversized Organic Linen Shirt", "Men", 2499.00, "Bestseller"));
        catalog.add(new Product(102, "Relaxed Fit Chino Trousers", "Men", 2999.00, "New"));
        catalog.add(new Product(103, "Floral Hand-Block Print Kurti", "Women", 1899.00, "Trending"));
        catalog.add(new Product(104, "Wide-Leg High-Rise Denim", "Women", 3499.00, "Sale"));
        catalog.add(new Product(105, "Classic Merino Wool Pullover", "Unisex", 4299.00, "Premium"));
        catalog.add(new Product(106, "Vintage Leather Bomber Jacket", "Unisex", 7999.00, "Limited"));
    }

    public List<Product> getAllProducts() {
        return new ArrayList<>(catalog);
    }

    public List<Product> getProductsByCategory(String category) {
        if (category == null || category.trim().isEmpty()) {
            return getAllProducts();
        }
        return catalog.stream()
                .filter(p -> p.getCategory().equalsIgnoreCase(category))
                .collect(Collectors.toList());
    }

    public int getTotalProductCount() {
        return catalog.size();
    }
}
