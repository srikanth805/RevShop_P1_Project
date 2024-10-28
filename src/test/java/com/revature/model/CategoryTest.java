package com.revature.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CategoryTest {

    private Category category;

    @BeforeEach
    void setUp() {
        // Initialize the Category object
        category = new Category();
        category.setId(1);
        category.setName("Electronics");
        category.setImageName("electronics.jpg");
        category.setIsActive(true);
    }

    @Test
    void testCategoryConstructor() {
        Category category = new Category(2, "Books", "books.jpg", false);

        assertEquals(2, category.getId());
        assertEquals("Books", category.getName());
        assertEquals("books.jpg", category.getImageName());
        assertFalse(category.getIsActive());
    }

    @Test
    void testGetId() {
        assertEquals(1, category.getId());
    }

    @Test
    void testSetId() {
        category.setId(3);
        assertEquals(3, category.getId());
    }

    @Test
    void testGetName() {
        assertEquals("Electronics", category.getName());
    }

    @Test
    void testSetName() {
        category.setName("Home Appliances");
        assertEquals("Home Appliances", category.getName());
    }

    @Test
    void testGetImageName() {
        assertEquals("electronics.jpg", category.getImageName());
    }

    @Test
    void testSetImageName() {
        category.setImageName("home_appliances.jpg");
        assertEquals("home_appliances.jpg", category.getImageName());
    }

    @Test
    void testGetIsActive() {
        assertTrue(category.getIsActive());
    }

    @Test
    void testSetIsActive() {
        category.setIsActive(false);
        assertFalse(category.getIsActive());
    }
}
