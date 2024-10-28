package com.revature.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.revature.model.Product;


public interface ProductRepository extends JpaRepository<Product, Integer> {

	List<Product> findByIsActiveTrue();

	Page<Product> findByIsActiveTrue(Pageable pageable);

	List<Product> findByCategory(String category);

	List<Product> findByTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(String ch, String ch2);

	Page<Product> findByCategory(Pageable pageable, String category);

	Page<Product> findByTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(String ch, String ch2,
																				Pageable pageable);

	Page<Product> findByisActiveTrueAndTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(String ch, String ch2,
																							   Pageable pageable);

	@Query("SELECT p FROM Product p WHERE p.isActive = true AND "
			+ "(?1 IS NULL OR p.category = ?1) AND "
			+ "(?2 IS NULL OR p.type = ?2) AND "
			+ "(?3 IS NULL OR p.subCategory = ?3) AND "
			+ "(?4 IS NULL OR p.size = ?4)")
	Page<Product> findByFilters(String category, String type, String subCategory, String size, Pageable pageable);



}