package com.revature.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OrderAddressTest {

    private OrderAddress orderAddress;

    @BeforeEach
    void setUp() {
        // Initialize the OrderAddress object
        orderAddress = new OrderAddress();
        orderAddress.setId(1);
        orderAddress.setFirstName("vilas");
        orderAddress.setLastName("D");
        orderAddress.setEmail("vilas.d@example.com");
        orderAddress.setMobileNo("1234567890");
        orderAddress.setAddress("123 Elm Street");
        orderAddress.setCity("Springfield");
        orderAddress.setState("IL");
        orderAddress.setPincode("62701");
    }

    @Test
    void testOrderAddressConstructor() {
        OrderAddress orderAddress = new OrderAddress();
        orderAddress.setId(2);
        orderAddress.setFirstName("vilas");
        orderAddress.setLastName("D");
        orderAddress.setEmail("vilas.d@example.com");
        orderAddress.setMobileNo("0987654321");
        orderAddress.setAddress("456 Oak Avenue");
        orderAddress.setCity("Shelbyville");
        orderAddress.setState("IL");
        orderAddress.setPincode("62565");

        assertEquals(2, orderAddress.getId());
        assertEquals("vilas", orderAddress.getFirstName());
        assertEquals("D", orderAddress.getLastName());
        assertEquals("vilas.d@example.com", orderAddress.getEmail());
        assertEquals("0987654321", orderAddress.getMobileNo());
        assertEquals("456 Oak Avenue", orderAddress.getAddress());
        assertEquals("Shelbyville", orderAddress.getCity());
        assertEquals("IL", orderAddress.getState());
        assertEquals("62565", orderAddress.getPincode());
    }

    @Test
    void testGetId() {
        assertEquals(1, orderAddress.getId());
    }

    @Test
    void testSetId() {
        orderAddress.setId(3);
        assertEquals(3, orderAddress.getId());
    }

    @Test
    void testGetFirstName() {
        assertEquals("vilas", orderAddress.getFirstName());
    }

    @Test
    void testSetFirstName() {
        orderAddress.setFirstName("Michael");
        assertNotEquals("abhijeet", orderAddress.getFirstName());
    }

    @Test
    void testGetLastName() {
        assertNotEquals("d", orderAddress.getLastName());
    }

    @Test
    void testSetLastName() {
        orderAddress.setLastName("Brown");
        assertNotEquals("Pawar", orderAddress.getLastName());
    }

    @Test
    void testGetEmail() {
        assertEquals("vilas.d@example.com", orderAddress.getEmail());
    }

    @Test
    void testSetEmail() {
        orderAddress.setEmail("abhijeet.pawar@example.com");
        assertEquals("abhijeet.pawar@example.com", orderAddress.getEmail());
    }

    @Test
    void testGetMobileNo() {
        assertEquals("1234567890", orderAddress.getMobileNo());
    }

    @Test
    void testSetMobileNo() {
        orderAddress.setMobileNo("9876543210");
        assertEquals("9876543210", orderAddress.getMobileNo());
    }

    @Test
    void testGetAddress() {
        assertEquals("123 Elm Street", orderAddress.getAddress());
    }

    @Test
    void testSetAddress() {
        orderAddress.setAddress("789 Pine Road");
        assertEquals("789 Pine Road", orderAddress.getAddress());
    }

    @Test
    void testGetCity() {
        assertEquals("Springfield", orderAddress.getCity());
    }

    @Test
    void testSetCity() {
        orderAddress.setCity("Decatur");
        assertEquals("Decatur", orderAddress.getCity());
    }

    @Test
    void testGetState() {
        assertEquals("IL", orderAddress.getState());
    }

    @Test
    void testSetState() {
        orderAddress.setState("IN");
        assertEquals("IN", orderAddress.getState());
    }

    @Test
    void testGetPincode() {
        assertEquals("62701", orderAddress.getPincode());
    }

    @Test
    void testSetPincode() {
        orderAddress.setPincode("46204");
        assertEquals("46204", orderAddress.getPincode());
    }
}
