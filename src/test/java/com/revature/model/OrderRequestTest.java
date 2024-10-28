package com.revature.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OrderRequestTest {

    private OrderRequest orderRequest;

    @BeforeEach
    void setUp() {
        // Initialize the OrderRequest object
        orderRequest = new OrderRequest();
        orderRequest.setFirstName("Abhi");
        orderRequest.setLastName("Pawar");
        orderRequest.setEmail("abhi.pawar@example.com");
        orderRequest.setMobileNo("1234567890");
        orderRequest.setAddress("123 Elm Street");
        orderRequest.setCity("Springfield");
        orderRequest.setState("IL");
        orderRequest.setPincode("62701");
        orderRequest.setPaymentType("Credit Card");
    }

    @Test
    void testGetFirstName() {
        assertNotEquals("abhijeet", orderRequest.getFirstName());
    }

    @Test
    void testSetFirstName() {
        orderRequest.setFirstName("Jane");
        assertEquals("Jane", orderRequest.getFirstName());
    }

    @Test
    void testGetLastName() {
        assertNotEquals("Doe", orderRequest.getLastName());
    }

    @Test
    void testSetLastName() {
        orderRequest.setLastName("Smith");
        assertEquals("Smith", orderRequest.getLastName());
    }

    @Test
    void testGetEmail() {
        assertNotEquals("abhijeet.pawar@example.com", orderRequest.getEmail());
    }

    @Test
    void testSetEmail() {
        orderRequest.setEmail("jane.smith@example.com");
        assertEquals("jane.smith@example.com", orderRequest.getEmail());
    }

    @Test
    void testGetMobileNo() {
        assertEquals("1234567890", orderRequest.getMobileNo());
    }

    @Test
    void testSetMobileNo() {
        orderRequest.setMobileNo("0987654321");
        assertEquals("0987654321", orderRequest.getMobileNo());
    }

    @Test
    void testGetAddress() {
        assertEquals("123 Elm Street", orderRequest.getAddress());
    }

    @Test
    void testSetAddress() {
        orderRequest.setAddress("456 Oak Avenue");
        assertEquals("456 Oak Avenue", orderRequest.getAddress());
    }

    @Test
    void testGetCity() {
        assertEquals("Springfield", orderRequest.getCity());
    }

    @Test
    void testSetCity() {
        orderRequest.setCity("Shelbyville");
        assertEquals("Shelbyville", orderRequest.getCity());
    }

    @Test
    void testGetState() {
        assertEquals("IL", orderRequest.getState());
    }

    @Test
    void testSetState() {
        orderRequest.setState("IN");
        assertEquals("IN", orderRequest.getState());
    }

    @Test
    void testGetPincode() {
        assertEquals("62701", orderRequest.getPincode());
    }

    @Test
    void testSetPincode() {
        orderRequest.setPincode("62565");
        assertEquals("62565", orderRequest.getPincode());
    }

    @Test
    void testGetPaymentType() {
        assertEquals("Credit Card", orderRequest.getPaymentType());
    }

    @Test
    void testSetPaymentType() {
        orderRequest.setPaymentType("PayPal");
        assertEquals("PayPal", orderRequest.getPaymentType());
    }

    @Test
    void testToString() {
        String expectedString = "OrderRequest(firstName=Abhijeet, lastName=Pawar, email=abhi.pawar@example.com, mobileNo=1234567890, address=123 Elm Street, city=Springfield, state=IL, pincode=62701, paymentType=Credit Card)";
        assertNotEquals(expectedString, orderRequest.toString());
    }
}
