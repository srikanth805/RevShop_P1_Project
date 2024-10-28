package com.revature.model;

import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;

public class ReviewModelTest {

    @Test
    public void testReviewModelConstructorAndGettersSetters() {
        // Create a new Product instance
        Product product = new Product();
        product.setId(1);
        product.setTitle("Sample Product");
        product.setDescription("This is a sample product description.");
        product.setCategory("Electronics");
        product.setPrice(299.99);
        product.setStock(50);
        product.setImage("sample.jpg");
        product.setDiscount(10);
        product.setDiscountPrice(269.99);
        product.setIsActive(true);

        // Create a new UserDtls instance
        UserDtls user = new UserDtls();
        user.setId(1);
        user.setName("Pratik P");
        user.setEmail("pratik.p@example.com");
        user.setPassword("password");
        user.setRole("ROLE_USER");

        // Create a new ReviewModel instance
        ReviewModel review = new ReviewModel();
        review.setId(1);
        review.setProduct(product);
        review.setUser(user);
        review.setRating(5);
        review.setComment("Excellent product!");
        review.setDate(LocalDateTime.now());

        // Validate that all fields are set correctly
        assertEquals(1, review.getId());
        assertEquals(product, review.getProduct());
        assertEquals(user, review.getUser());
        assertEquals(5, review.getRating());
        assertEquals("Excellent product!", review.getComment());
        assertNotNull(review.getDate());

        // Modify the ReviewModel's fields using setters
        review.setRating(4);
        review.setComment("Good product, but could be improved.");

        // Validate that the fields have been updated correctly
        assertEquals(4, review.getRating());
        assertEquals("Good product, but could be improved.", review.getComment());
    }

    @Test
    public void testDefaultConstructor() {
        // Create a new ReviewModel instance using the default constructor
        ReviewModel review = new ReviewModel();

        // Validate that all fields are initialized to default values
        assertEquals(0, review.getId());
        assertNull(review.getProduct());
        assertNull(review.getUser());
        assertEquals(0, review.getRating());
        assertNull(review.getComment());
        assertNull(review.getDate());
    }
}
