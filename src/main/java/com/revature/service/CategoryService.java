package com.revature.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.revature.model.Category;


public interface CategoryService {

	public Category saveCategory(Category category);

	public Boolean existCategory(String name);

	public List<Category> getAllCategory();

	public Boolean deleteCategory(int id);

	public Category getCategoryById(int id);

	public List<Category> getAllActiveCategory();

	public Page<Category> getAllCategorPagination(Integer pageNo,Integer pageSize);

	// Method to get all types (e.g., Male, Female, Kids)
	public List<String> getAllTypes();

	// Method to get all subCategories based on type or category
	public List<String> getSubCategoriesByTypeOrCategory(String type, String category);

	// Method to get all available sizes (S, M, L, XL, etc.)
	public List<String> getAllSizes();

}
