package com.revature.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.PageRequest;

import com.revature.dao.CategoryDAO; // Ensure you import the correct DAO class
import com.revature.model.Category;
import com.revature.service.impl.CategoryServiceImpl;

public class CategoryServiceImplementationTest {

    @Mock
    private CategoryDAO categoryRepository; // Use CategoryDAO instead of CategoryRepository

    @InjectMocks
    private CategoryServiceImpl categoryService;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this); // Initializes mocks
    }

    @Test
    public void testSaveCategory() {
        Category category = new Category();
        when(categoryRepository.save(category)).thenReturn(category);

        Category result = categoryService.saveCategory(category);

        assertNotNull(result);
        verify(categoryRepository).save(category);
    }

    @Test
    public void testGetAllCategory() {
        List<Category> categories = new ArrayList<>();
        when(categoryRepository.findAll()).thenReturn(categories);

        List<Category> result = categoryService.getAllCategory();

        assertEquals(categories, result);
        verify(categoryRepository).findAll();
    }

    @Test
    public void testExistCategory() {
        String name = "Electronics";
        when(categoryRepository.existsByName(name)).thenReturn(true);

        Boolean result = categoryService.existCategory(name);

        assertTrue(result);
        verify(categoryRepository).existsByName(name);
    }

    @Test
    public void testDeleteCategory() {
        int id = 1;
        Category category = new Category();
        when(categoryRepository.findById(id)).thenReturn(Optional.of(category));
        doNothing().when(categoryRepository).delete(category);

        Boolean result = categoryService.deleteCategory(id);

        assertTrue(result);
        verify(categoryRepository).findById(id);
        verify(categoryRepository).delete(category);
    }

    @Test
    public void testDeleteCategoryNotFound() {
        int id = 1;
        when(categoryRepository.findById(id)).thenReturn(Optional.empty());

        Boolean result = categoryService.deleteCategory(id);

        assertFalse(result);
        verify(categoryRepository).findById(id);
        verify(categoryRepository, never()).delete(any(Category.class));
    }

    @Test
    public void testGetCategoryById() {
        int id = 1;
        Category category = new Category();
        when(categoryRepository.findById(id)).thenReturn(Optional.of(category));

        Category result = categoryService.getCategoryById(id);

        assertNotNull(result);
        verify(categoryRepository).findById(id);
    }

    @Test
    public void testGetCategoryByIdNotFound() {
        int id = 1;
        when(categoryRepository.findById(id)).thenReturn(Optional.empty());

        Category result = categoryService.getCategoryById(id);

        assertNull(result);
        verify(categoryRepository).findById(id);
    }

    @Test
    public void testGetAllActiveCategory() {
        List<Category> categories = new ArrayList<>();
        when(categoryRepository.findByIsActiveTrue()).thenReturn(categories);

        List<Category> result = categoryService.getAllActiveCategory();

        assertEquals(categories, result);
        verify(categoryRepository).findByIsActiveTrue();
    }

//    @Test
//    public void testGetAllCategoryPagination() {
//        int pageNo = 0;
//        int pageSize = 10;
//        Pageable pageable = PageRequest.of(pageNo, pageSize);
//        Page<Category> page = new PageImpl<>(new ArrayList<>());
//        when(categoryRepository.findAll(pageable)).thenReturn(page);
//
//        Page<Category> result = categoryService.getAllCategorPagination(pageNo, pageSize);
//
//        assertEquals(page, result);
//        verify(categoryRepository).findAll(pageable);
//    }
}
