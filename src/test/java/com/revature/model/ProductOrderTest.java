package com.revature.model;

import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

public class ProductOrderTest {

    @Test
    public void testProductOrderConstructorAndGettersSetters() {
        // Create a new OrderAddress instance
        OrderAddress orderAddress = new OrderAddress();
        orderAddress.setId(1);
        orderAddress.setFirstName("shubham");
        orderAddress.setLastName("T");
        orderAddress.setEmail("shubham.t@example.com");
        orderAddress.setMobileNo("1234567890");
        orderAddress.setAddress("123 Elm St");
        orderAddress.setCity("Springfield");
        orderAddress.setState("IL");
        orderAddress.setPincode("62701");

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
        user.setName("shubham T");
        user.setEmail("shubham.t@example.com");
        user.setPassword("password");
        user.setRole("ROLE_USER");

        // Create a new ProductOrder instance
        ProductOrder order = new ProductOrder();
        order.setId(1);
        order.setOrderId("ORD123");
        order.setOrderDate(LocalDate.now());
        order.setProduct(product);
        order.setPrice(269.99);
        order.setQuantity(2);
        order.setUser(user);
        order.setStatus("Processing");
        order.setPaymentType("Credit Card");
        order.setOrderAddress(orderAddress);

        // Validate that all fields are set correctly
        assertEquals(1, order.getId());
        assertEquals("ORD123", order.getOrderId());
        assertNotNull(order.getOrderDate());
        assertEquals(product, order.getProduct());
        assertEquals(269.99, order.getPrice());
        assertEquals(2, order.getQuantity());
        assertEquals(user, order.getUser());
        assertEquals("Processing", order.getStatus());
        assertEquals("Credit Card", order.getPaymentType());
        assertEquals(orderAddress, order.getOrderAddress());

        // Modify the ProductOrder's fields using setters
        order.setOrderId("ORD456");
        order.setStatus("Shipped");
        order.setQuantity(3);

        // Validate that the fields have been updated correctly
        assertEquals("ORD456", order.getOrderId());
        assertEquals("Shipped", order.getStatus());
        assertEquals(3, order.getQuantity());
    }

    @Test
    public void testDefaultConstructor() {
        // Create a new ProductOrder instance using the default constructor
        ProductOrder order = new ProductOrder();

        // Validate that all fields are initialized to default values
        assertNull(order.getId());
        assertNull(order.getOrderId());
        assertNull(order.getOrderDate());
        assertNull(order.getProduct());
        assertNull(order.getPrice());
        assertNull(order.getQuantity());
        assertNull(order.getUser());
        assertNull(order.getStatus());
        assertNull(order.getPaymentType());
        assertNull(order.getOrderAddress());
    }
}
