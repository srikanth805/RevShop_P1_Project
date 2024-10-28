package com.revature.service.impl;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;

import org.springframework.data.domain.PageRequest;

import org.springframework.data.domain.Pageable;

import org.springframework.stereotype.Service;

import org.springframework.util.ObjectUtils;



import com.revature.dao.CategoryDAO;

import com.revature.model.Category;

import com.revature.service.CategoryService;





@Service

public class CategoryServiceImpl implements CategoryService {



	@Autowired

	private CategoryDAO categoryRepository;



	@Override

	public Category saveCategory(Category category) {

		return categoryRepository.save(category);

	}



	@Override

	public List<Category> getAllCategory() {

		return categoryRepository.findAll();

	}



	@Override

	public Boolean existCategory(String name) {

		return categoryRepository.existsByName(name);

	}



	@Override

	public Boolean deleteCategory(int id) {

		Category category = categoryRepository.findById(id).orElse(null);



		if (!ObjectUtils.isEmpty(category)) {

			categoryRepository.delete(category);

			return true;

		}

		return false;

	}



	@Override

	public Category getCategoryById(int id) {

		Category category = categoryRepository.findById(id).orElse(null);

		return category;

	}



	@Override

	public List<Category> getAllActiveCategory() {

		List<Category> categories = categoryRepository.findByIsActiveTrue();

		return categories;

	}



	@Override

	public Page<Category> getAllCategorPagination(Integer pageNo, Integer pageSize) {

		Pageable pageable = PageRequest.of(pageNo, pageSize);

		return categoryRepository.findAll(pageable);

	}



	@Override

	public List<String> getAllTypes() {

		// Assuming there is a method in the DAO to retrieve all types

		return categoryRepository.findAllTypes(); // You'll need to implement this method in CategoryDAO

	}



	@Override

	public List<String> getSubCategoriesByTypeOrCategory(String type, String category) {

		// Assuming there is a method in the DAO to retrieve subcategories based on type or category

		return categoryRepository.findSubCategoriesByTypeOrCategory(type, category); // Implement in DAO

	}



	@Override

	public List<String> getAllSizes() {

		// Assuming there is a method in the DAO to retrieve all sizes

		return categoryRepository.findAllSizes(); // You'll need to implement this method in CategoryDAO

	}





}