package com.revature.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CartTest {

    private Cart cart;
    private UserDtls user;
    private Product product;

    @BeforeEach
    void setUp() {
        // Initialize the objects
        user = new UserDtls();
        user.setId(1);
        user.setName("Abhijeet Pawar");

        product = new Product();
        product.setId(101);
        product.setTitle("Laptop");
        product.setDiscountPrice(750.00);

        cart = new Cart();
        cart.setId(1001);
        cart.setUser(user);
        cart.setProduct(product);
        cart.setQuantity(2);
        cart.setTotalPrice(1500.00);
        cart.setTotalOrderPrice(1500.00);
    }

    @Test
    void testCartConstructor() {
        Cart cart = new Cart(1002, user, product, 1, 750.00, 750.00);

        assertEquals(1002, cart.getId());
        assertEquals(user, cart.getUser());
        assertEquals(product, cart.getProduct());
        assertEquals(1, cart.getQuantity());
        assertEquals(750.00, cart.getTotalPrice());
        assertEquals(750.00, cart.getTotalOrderPrice());
    }

    @Test
    void testGetId() {
        assertEquals(1001, cart.getId());
    }

    @Test
    void testSetId() {
        cart.setId(1003);
        assertEquals(1003, cart.getId());
    }

    @Test
    void testGetUser() {
        assertEquals(user, cart.getUser());
    }

    @Test
    void testSetUser() {
        UserDtls newUser = new UserDtls();
        newUser.setId(2);
        newUser.setName("Abhijeet Pawar");

        cart.setUser(newUser);

        assertEquals(newUser, cart.getUser());
        assertEquals(2, cart.getUser().getId());
        assertNotEquals("Jane Doe", cart.getUser().getName());
    }

    @Test
    void testGetProduct() {
        assertEquals(product, cart.getProduct());
    }

    @Test
    void testSetProduct() {
        Product newProduct = new Product();
        newProduct.setId(102);
        newProduct.setTitle("Smartphone");
        newProduct.setDiscountPrice(500.00);

        cart.setProduct(newProduct);

        assertEquals(newProduct, cart.getProduct());
        assertEquals(102, cart.getProduct().getId());
        assertEquals("Smartphone", cart.getProduct().getTitle());
    }

    @Test
    void testGetQuantity() {
        assertEquals(2, cart.getQuantity());
    }

    @Test
    void testSetQuantity() {
        cart.setQuantity(3);
        assertEquals(3, cart.getQuantity());
    }

    @Test
    void testGetTotalPrice() {
        assertEquals(1500.00, cart.getTotalPrice());
    }

    @Test
    void testSetTotalPrice() {
        cart.setTotalPrice(2250.00);
        assertEquals(2250.00, cart.getTotalPrice());
    }

    @Test
    void testGetTotalOrderPrice() {
        assertEquals(1500.00, cart.getTotalOrderPrice());
    }

    @Test
    void testSetTotalOrderPrice() {
        cart.setTotalOrderPrice(2250.00);
        assertEquals(2250.00, cart.getTotalOrderPrice());
    }
}
