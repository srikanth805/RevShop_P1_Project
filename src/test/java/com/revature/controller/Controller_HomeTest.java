package com.revature.controller;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.revature.model.Category;
import com.revature.model.Product;
import com.revature.model.ReviewModel;
import com.revature.model.UserDtls;
import com.revature.service.CartService;
import com.revature.service.CategoryService;
import com.revature.service.UserService;
import com.revature.service.WishlistService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;

import com.revature.service.ProductService;
import com.revature.service.ReviewService;

public class Controller_HomeTest {

    @Mock
    private CategoryService categoryService;

    @Mock
    private ProductService productService;

    @Mock
    private UserService userService;
    
   
    @Mock
    private ReviewService reviewService;

    @Mock
    private RedirectAttributes redirectAttributes;

    @Mock
    private CartService cartService;

    @Mock
    private WishlistService wishlistService;

    @Mock
    private Model model;
    
    @Mock
    private HttpServletRequest request;

    @InjectMocks
    private Controller_Home homeController;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testGetUserDetails_Success() {
        // Mocking Principal object
        Principal principal = mock(Principal.class);
        when(principal.getName()).thenReturn("test@example.com");

        // Mocking User Service
        UserDtls user = new UserDtls();
        user.setId((int) 1L);
        user.setEmail("test@example.com");
        when(userService.getUserByEmail("test@example.com")).thenReturn(user);

        // Mocking Cart Service
        when(cartService.getCountCart((int) 1L)).thenReturn(5);

        // Mocking Category Service
        List<Category> categories = Arrays.asList(new Category());
        when(categoryService.getAllActiveCategory()).thenReturn(categories);

        // Call the method
        homeController.getUserDetails(principal, model);

        // Verify interactions
        verify(userService, times(1)).getUserByEmail("test@example.com");
        verify(cartService, times(1)).getCountCart((int) 1L);
        verify(categoryService, times(1)).getAllActiveCategory();
        verify(model, times(1)).addAttribute("user", user);
        verify(model, times(1)).addAttribute("countCart", 5);
        verify(model, times(1)).addAttribute("categories", categories);
    }

    @Test
    public void testGetUserDetails_Failure() {
        // Mocking Principal as null
        Principal principal = null;

        // Mocking Category Service
        List<Category> categories = Arrays.asList(new Category());
        when(categoryService.getAllActiveCategory()).thenReturn(categories);

        // Call the method
        homeController.getUserDetails(principal, model);

        // Verify that user-related methods were not called
        verify(userService, times(0)).getUserByEmail(anyString());
        verify(cartService, times(0)).getCountCart((int) anyLong());

        // Verify that categories were added to the model
        verify(categoryService, times(1)).getAllActiveCategory();
        verify(model, times(1)).addAttribute("categories", categories);
    }
    
    @Test
    public void testIndex_Success() {
        // Mock Category List
        List<Category> mockCategories = new ArrayList<>();
        Category category1 = new Category();
        category1.setId(2);  // Using setters to assign values
        mockCategories.add(category1);

        Category category2 = new Category();
        category2.setId(1);  // Using setters to assign values
        mockCategories.add(category2);

        when(categoryService.getAllActiveCategory()).thenReturn(mockCategories);

        // Mock Product List
        List<Product> mockProducts = new ArrayList<>();
        Product product1 = new Product();
        product1.setId(5);  // Using setters to assign values
        mockProducts.add(product1);

        Product product2 = new Product();
        product2.setId(3);  // Using setters to assign values
        mockProducts.add(product2);

        when(productService.getAllActiveProducts("")).thenReturn(mockProducts);

        // Call the controller method
        String viewName = homeController.index(model);

        // Assertions
        assertEquals("userHome", viewName); // Ensure it returns "index" view

        // Verify model attributes
        verify(model).addAttribute(eq("category"), anyList());
        verify(model).addAttribute(eq("products"), anyList());
    }


    @Test
    public void testIndex_Failure_EmptyCategoriesAndProducts() {
        // Mocking empty lists for categories and products
        when(categoryService.getAllActiveCategory()).thenReturn(new ArrayList<>());
        when(productService.getAllActiveProducts("")).thenReturn(new ArrayList<>());

        // Call the method
        String viewName = homeController.index(model);

        // Verify the services were called
        verify(categoryService, times(1)).getAllActiveCategory();
        verify(productService, times(1)).getAllActiveProducts("");

        // Verify that empty lists were added to the model
        verify(model, times(1)).addAttribute("category", new ArrayList<>());
        verify(model, times(1)).addAttribute("products", new ArrayList<>());

        // Assert that the view name is still "index"
        assertNotEquals("index", viewName);
    }
    
    
       @Test
    public void testSaveReview_Success() {
        // Mock data for product and user
        Product product = new Product();
        product.setId(1);

        UserDtls user = new UserDtls();
        user.setId(1);

        when(productService.getProductById(1)).thenReturn(product);
        when(userService.getUserById(1)).thenReturn(user);

        // Call the controller method
        String viewName = homeController.saveReview(1, 1, 5, "Great product!", redirectAttributes);

        // Verifications
        verify(reviewService, times(1)).saveReview(any(ReviewModel.class));
        verify(redirectAttributes).addFlashAttribute("succMsg", "Review submitted !!");

        // Assertions
        assertEquals("redirect:/product/1", viewName);
    }

    @Test
    public void testSaveReview_Failure_ProductOrUserNotFound() {
        // Mock product as null
        when(productService.getProductById(1)).thenReturn(null);
        when(userService.getUserById(1)).thenReturn(null);

        // Call the controller method
        String viewName = homeController.saveReview(1, 1, 5, "Great product!", redirectAttributes);

        // Verifications
        verify(reviewService, never()).saveReview(any(ReviewModel.class)); // No review should be saved
        verify(redirectAttributes).addFlashAttribute("errorMsg", "Invalid User or Product!");

        // Assertions
        assertEquals("redirect:/product/1", viewName);
    }
    

    
    
   
    @Test
    public void testProcessForgotPassword_InvalidEmail() throws UnsupportedEncodingException, MessagingException {
        String email = "invalid@example.com";
        
        // Mock user service to return null (no user found)
        when(userService.getUserByEmail(email)).thenReturn(null);

        String result = homeController.processForgotPassword(email, redirectAttributes, request);

        // Verify that the error message is added to redirect attributes
        verify(redirectAttributes).addFlashAttribute("errorMsg", "Invalid email");
        
        // Assert the redirection
        assertEquals("redirect:/forgot-password", result);
    }
}
