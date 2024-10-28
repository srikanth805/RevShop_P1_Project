package com.revature.dao;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.revature.model.Category;
import com.revature.model.Product;

public interface CategoryDAO {
    Boolean existsByName(String name);

    List<Category> findByIsActiveTrue();

    Category save(Category category);

    void delete(Category category);

    Optional<Category> findById(Integer id);

    List<Category> findAll();

    Page<Category> findAll(Pageable pageable);  // For pagination support

    List<Product> findByType(String type);
    Page<Product> findByType(Pageable pageable, String type);

    List<Product> findBySubCategory(String subCategory);
    Page<Product> findBySubCategory(Pageable pageable, String subCategory);

    List<Product> findBySize(String size);

    Page<Product> findBySize(Pageable pageable, String size);

    // New service methods for filtering products by type and category
    List<Product> findByTypeAndCategory(String type, String category);

    // New methods for types, subcategories, and sizes
    List<String> findAllTypes(); // Method to retrieve all types
    List<String> findSubCategoriesByTypeOrCategory(String type, String category); // Method for subcategories
    List<String> findAllSizes(); // Method to retrieve all sizes

}
