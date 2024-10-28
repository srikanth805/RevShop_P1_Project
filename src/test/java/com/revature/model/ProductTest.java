package com.revature.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ProductTest {

    @Test
    public void testProductConstructorAndGettersSetters() {
        // Create a new Product instance using parameterized constructor
        Product product = new Product(1, "Sample Product", "This is a sample product description.", 
                                       "Electronics", 299.99, 50, "sample.jpg", 10, 
                                       269.99,true,null,null,null);
        
        // Validate that all fields are set correctly
        assertEquals(1, product.getId());
        assertEquals("Sample Product", product.getTitle());
        assertEquals("This is a sample product description.", product.getDescription());
        assertEquals("Electronics", product.getCategory());
        assertEquals(299.99, product.getPrice());
        assertEquals(50, product.getStock());
        assertEquals("sample.jpg", product.getImage());
        assertEquals(10, product.getDiscount());
        assertEquals(269.99, product.getDiscountPrice());
        assertTrue(product.getIsActive());
        
        // Modify the product's fields using setters
        product.setTitle("Updated Product");
        product.setPrice(349.99);
        product.setStock(100);

        // Validate that the fields have been updated correctly
        assertEquals("Updated Product", product.getTitle());
        assertEquals(349.99, product.getPrice());
        assertEquals(100, product.getStock());
    }

    @Test
    public void testDefaultConstructor() {
        // Create a new Product instance using the default constructor
        Product product = new Product();

        // Validate that all fields are initialized to default values
        assertNull(product.getId());
        assertNull(product.getTitle());
        assertNull(product.getDescription());
        assertNull(product.getCategory());
        assertNull(product.getPrice());
        assertEquals(0, product.getStock());
        assertNull(product.getImage());
        assertEquals(0, product.getDiscount());
        assertNull(product.getDiscountPrice());
        assertNull(product.getIsActive());
    }
}
