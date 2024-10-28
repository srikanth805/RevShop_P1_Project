package com.revature.service;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.*;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.revature.model.Product;
import com.revature.repository.ProductRepository;
import com.revature.service.impl.ProductServiceImpl;

class ProductServiceImplementationTest {

    @Mock
    private ProductRepository productRepository;

    @InjectMocks
    private ProductServiceImpl productService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testSaveProduct() {
        Product product = new Product();
        when(productRepository.save(any(Product.class))).thenReturn(product);

        Product savedProduct = productService.saveProduct(product);

        assertNotNull(savedProduct);
        verify(productRepository, times(1)).save(any(Product.class));
    }

    @Test
    void testGetAllProducts() {
        List<Product> productList = new ArrayList<>();
        when(productRepository.findAll()).thenReturn(productList);

        List<Product> result = productService.getAllProducts();

        assertNotNull(result);
        assertEquals(0, result.size());
        verify(productRepository, times(1)).findAll();
    }

    @Test
    void testGetAllProductsPagination() {
        List<Product> productList = new ArrayList<>();
        Page<Product> productPage = new PageImpl<>(productList);
        Pageable pageable = PageRequest.of(0, 10);

        when(productRepository.findAll(any(Pageable.class))).thenReturn(productPage);

        Page<Product> result = productService.getAllProductsPagination(0, 10);

        assertNotNull(result);
        assertEquals(0, result.getTotalElements());
        verify(productRepository, times(1)).findAll(any(Pageable.class));
    }

    @Test
    void testDeleteProduct() {
        Product product = new Product();
        when(productRepository.findById(anyInt())).thenReturn(Optional.of(product));

        Boolean result = productService.deleteProduct(1);

        assertTrue(result);
        verify(productRepository, times(1)).findById(anyInt());
        verify(productRepository, times(1)).delete(any(Product.class));
    }

    @Test
    void testDeleteProduct_NotFound() {
        when(productRepository.findById(anyInt())).thenReturn(Optional.empty());

        Boolean result = productService.deleteProduct(1);

        assertFalse(result);
        verify(productRepository, times(1)).findById(anyInt());
        verify(productRepository, times(0)).delete(any(Product.class));
    }

    @Test
    void testUpdateProduct() throws Exception {
        Product product = new Product();
        product.setId(1);
        product.setPrice(100.0);
        product.setDiscountPrice(10.0);
        MultipartFile image = mock(MultipartFile.class);
        when(image.isEmpty()).thenReturn(false);
        when(image.getOriginalFilename()).thenReturn("image.jpg");

        Product dbProduct = new Product();
        dbProduct.setId(1);
        when(productRepository.findById(anyInt())).thenReturn(Optional.of(dbProduct));
        when(productRepository.save(any(Product.class))).thenReturn(dbProduct);

        ClassPathResource saveFile = mock(ClassPathResource.class);
        Path path = mock(Path.class);
        
        Product updatedProduct = productService.updateProduct(product, image);

        assertNotNull(updatedProduct);
        assertEquals("image.jpg", dbProduct.getImage());
        verify(productRepository, times(1)).findById(anyInt());
        verify(productRepository, times(1)).save(any(Product.class));
        }

    @Test
    void testGetProductById() {
        Product product = new Product();
        when(productRepository.findById(anyInt())).thenReturn(Optional.of(product));

        Product result = productService.getProductById(1);

        assertNotNull(result);
        verify(productRepository, times(1)).findById(anyInt());
    }

    @Test
    void testSearchProduct() {
        List<Product> productList = new ArrayList<>();
        when(productRepository.findByTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(anyString(), anyString()))
                .thenReturn(productList);

        List<Product> result = productService.searchProduct("sample");

        assertNotNull(result);
        assertEquals(0, result.size());
        verify(productRepository, times(1))
                .findByTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(anyString(), anyString());
    }
}
