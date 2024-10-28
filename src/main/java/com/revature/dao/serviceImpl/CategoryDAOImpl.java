package com.revature.dao.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.revature.dao.CategoryDAO;
import com.revature.model.Category;
import com.revature.model.Product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;


import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

@Repository
@Transactional
public class CategoryDAOImpl implements CategoryDAO {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Boolean existsByName(String name) {
        String jpql = "SELECT COUNT(c) FROM Category c WHERE c.name = :name";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("name", name);
        Long count = query.getSingleResult();
        return count > 0;
    }

    @Override
    public List<Category> findByIsActiveTrue() {
        String jpql = "SELECT c FROM Category c WHERE c.isActive = true";
        TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);
        return query.getResultList();
    }

    @Override
    public Category save(Category category) {
        if (category.getId() == null) {
            entityManager.persist(category);
        } else {
            entityManager.merge(category);
        }
        return category;
    }

    @Override
    public void delete(Category category) {
        if (entityManager.contains(category)) {
            entityManager.remove(category);
        } else {
            entityManager.remove(entityManager.merge(category));
        }
    }

    @Override
    public Optional<Category> findById(Integer id) {
        Category category = entityManager.find(Category.class, id);
        return Optional.ofNullable(category);
    }

    @Override
    public List<Category> findAll() {
        String jpql = "SELECT c FROM Category c";
        TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);
        return query.getResultList();
    }

    // Pagination support
    @Override
    public Page<Category> findAll(Pageable pageable) {
        String jpql = "SELECT c FROM Category c";
        TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());
        List<Category> results = query.getResultList();

        // Count the total number of records for pagination
        TypedQuery<Long> countQuery = entityManager.createQuery("SELECT COUNT(c) FROM Category c", Long.class);
        Long count = countQuery.getSingleResult();

        return new PageImpl<>(results, pageable, count);
    }

    // 11. Find Products by Type
    @Override
    public List<Product> findByType(String type) {
        String jpql = "SELECT p FROM Product p WHERE p.type = :type";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setParameter("type", type);
        return query.getResultList();
    }

    @Override
    public Page<Product> findByType(Pageable pageable, String type) {
        String jpql = "SELECT p FROM Product p WHERE p.type = :type";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setParameter("type", type);
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());
        List<Product> results = query.getResultList();

        TypedQuery<Long> countQuery = entityManager.createQuery("SELECT COUNT(p) FROM Product p WHERE p.type = :type", Long.class);
        countQuery.setParameter("type", type);
        Long count = countQuery.getSingleResult();
        return new PageImpl<>(results, pageable, count);
    }

    // 12. Find Products by Type and Category
    @Override
    public List<Product> findByTypeAndCategory(String type, String category) {
        String jpql = "SELECT p FROM Product p WHERE p.type = :type AND p.category = :category";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setParameter("type", type);
        query.setParameter("category", category);
        return query.getResultList();
    }

    // 13. Find Products by SubCategory
    @Override
    public List<Product> findBySubCategory(String subCategory) {
        String jpql = "SELECT p FROM Product p WHERE p.subCategory = :subCategory";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setParameter("subCategory", subCategory);
        return query.getResultList();
    }

    @Override
    public Page<Product> findBySubCategory(Pageable pageable, String subCategory) {
        String jpql = "SELECT p FROM Product p WHERE p.subCategory = :subCategory";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setParameter("subCategory", subCategory);
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());
        List<Product> results = query.getResultList();

        TypedQuery<Long> countQuery = entityManager.createQuery("SELECT COUNT(p) FROM Product p WHERE p.subCategory = :subCategory", Long.class);
        countQuery.setParameter("subCategory", subCategory);
        Long count = countQuery.getSingleResult();
        return new PageImpl<>(results, pageable, count);
    }

    // 14. Find Products by Size
    @Override
    public List<Product> findBySize(String size) {
        String jpql = "SELECT p FROM Product p WHERE p.size = :size";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setParameter("size", size);
        return query.getResultList();
    }

    @Override
    public Page<Product> findBySize(Pageable pageable, String size) {
        String jpql = "SELECT p FROM Product p WHERE p.size = :size";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setParameter("size", size);
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());
        List<Product> results = query.getResultList();

        TypedQuery<Long> countQuery = entityManager.createQuery("SELECT COUNT(p) FROM Product p WHERE p.size = :size", Long.class);
        countQuery.setParameter("size", size);
        Long count = countQuery.getSingleResult();
        return new PageImpl<>(results, pageable, count);
    }

    // New methods to retrieve all types, subcategories, and sizes
    @Override
    public List<String> findAllTypes() {
        String jpql = "SELECT DISTINCT p.type FROM Product p"; // Adjust based on your model
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        return query.getResultList();
    }

    @Override
    public List<String> findSubCategoriesByTypeOrCategory(String type, String category) {
        String jpql = "SELECT DISTINCT p.subCategory FROM Product p WHERE p.type = :type OR p.category = :category"; // Adjust based on your model
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        query.setParameter("type", type);
        query.setParameter("category", category);
        return query.getResultList();
    }

    @Override
    public List<String> findAllSizes() {
        String jpql = "SELECT DISTINCT p.size FROM Product p"; // Adjust based on your model
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        return query.getResultList();
    }

}