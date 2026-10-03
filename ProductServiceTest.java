package com.store.service;

import com.store.model.Product;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ProductServiceTest {

    private ProductService productService;

    @BeforeEach
    void setUp() {
        productService = new ProductService();
    }

    @Test
    @DisplayName("Should return exactly 6 catalog products initially")
    void testTotalProductCount() {
        int count = productService.getTotalProductCount();
        assertEquals(6, count, "Initial product catalog count must be 6");
    }

    @Test
    @DisplayName("Should filter products correctly by Women category")
    void testFilterByCategoryWomen() {
        List<Product> womenClothing = productService.getProductsByCategory("Women");
        assertNotNull(womenClothing);
        assertEquals(2, womenClothing.size(), "Should have exactly 2 products under Women category");
    }

    @Test
    @DisplayName("Should return all products when category filter is null")
    void testNullCategoryFallback() {
        List<Product> products = productService.getProductsByCategory(null);
        assertEquals(6, products.size(), "Null category filter should return full catalog");
    }
}
