package com.revature.model;

import org.junit.jupiter.api.Test;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

public class UserDtlsTest {

    @Test
    public void testUserDtlsConstructorAndGettersSetters() {
        // Create a new UserDtls instance
        UserDtls user = new UserDtls();
        user.setId(1);
        user.setName("Abhijeet Pawar");
        user.setMobileNumber("1234567890");
        user.setEmail("abhijeet.pawar@example.com");
        user.setAddress("123 Main St");
        user.setCity("Cityville");
        user.setState("Stateville");
        user.setPincode("12345");
        user.setPassword("password123");
        user.setProfileImage("profile.jpg");
        user.setRole("ROLE_USER");
        user.setIsEnable(true);
        user.setAccountNonLocked(true);
        user.setFailedAttempt(0);
        user.setLockTime(new Date());
        user.setResetToken("reset-token");

        // Validate that all fields are set correctly
        assertEquals(1, user.getId());
        assertEquals("Abhijeet Pawar", user.getName());
        assertEquals("1234567890", user.getMobileNumber());
        assertEquals("abhijeet.pawar@example.com", user.getEmail());
        assertEquals("123 Main St", user.getAddress());
        assertEquals("Cityville", user.getCity());
        assertEquals("Stateville", user.getState());
        assertEquals("12345", user.getPincode());
        assertEquals("password123", user.getPassword());
        assertEquals("profile.jpg", user.getProfileImage());
        assertEquals("ROLE_USER", user.getRole());
        assertTrue(user.getIsEnable());
        assertTrue(user.getAccountNonLocked());
        assertEquals(0, user.getFailedAttempt());
        assertNotNull(user.getLockTime());
        assertEquals("reset-token", user.getResetToken());

        // Modify the UserDtls's fields using setters
        user.setName("New Name");
        user.setEmail("new.email@example.com");
        user.setFailedAttempt(1);

        // Validate that the fields have been updated correctly
        assertEquals("New Name", user.getName());
        assertEquals("new.email@example.com", user.getEmail());
        assertEquals(1, user.getFailedAttempt());
    }

    @Test
    public void testDefaultConstructor() {
        // Create a new UserDtls instance using the default constructor
        UserDtls user = new UserDtls();

        // Validate that all fields are initialized to default values
        assertEquals(null, user.getId());
        assertNull(user.getName());
        assertNull(user.getMobileNumber());
        assertNull(user.getEmail());
        assertNull(user.getAddress());
        assertNull(user.getCity());
        assertNull(user.getState());
        assertNull(user.getPincode());
        assertNull(user.getPassword());
        assertNull(user.getProfileImage());
        assertNull(user.getRole());
        assertNull(user.getIsEnable());
        assertNull(user.getAccountNonLocked());
        assertNull(user.getFailedAttempt());
        assertNull(user.getLockTime());
        assertNull(user.getResetToken());
    }
}
