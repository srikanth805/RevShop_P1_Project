package com.revature.model;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class WishlistTest {

    @Test
    public void testWishlistConstructorAndGettersSetters() {
        // Create mock instances of UserDtls and Product
        UserDtls user = new UserDtls();
        user.setId(1);
        user.setName("Abhijeet Pawar");

        Product product = new Product();
        product.setId(1);
        product.setTitle("Sample Product");

        // Create a new Wishlist instance
        Wishlist wishlist = new Wishlist(user, product);

        // Validate that the fields are set correctly
        assertEquals(user, wishlist.getUser());
        assertEquals(product, wishlist.getProduct());

        // Set new values using setters
        UserDtls newUser = new UserDtls();
        newUser.setId(2);
        newUser.setName("Another User");

        Product newProduct = new Product();
        newProduct.setId(2);
        newProduct.setTitle("Another Product");

        wishlist.setUser(newUser);
        wishlist.setProduct(newProduct);

        // Validate that the new values are set correctly
        assertEquals(newUser, wishlist.getUser());
        assertEquals(newProduct, wishlist.getProduct());
    }

    @Test
    public void testDefaultConstructor() {
        // Create a new Wishlist instance using the default constructor
        Wishlist wishlist = new Wishlist();

        // Validate that all fields are initialized to default values
        assertNull(wishlist.getId());
        assertNull(wishlist.getUser());
        assertNull(wishlist.getProduct());
    }

    @Test
    public void testParameterizedConstructor() {
        // Create mock instances of UserDtls and Product
        UserDtls user = new UserDtls();
        user.setId(1);
        user.setName("Abhijeet Pawar");

        Product product = new Product();
        product.setId(1);
        product.setTitle("Sample Product");

        // Create a new Wishlist instance using the parameterized constructor
        Wishlist wishlist = new Wishlist(user, product);

        // Validate that the fields are set correctly
        assertEquals(user, wishlist.getUser());
        assertEquals(product, wishlist.getProduct());
    }
}
