package com.revature.controller;

import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.revature.model.UserDtls;
import com.revature.model.Wishlist;
import com.revature.service.WishlistService;
import com.revature.service.UserService;

class Controller_UserTest {

    @InjectMocks
    private Controller_User controllerUser;

    @Mock
    private UserService userService;

    @Mock
    private WishlistService wishlistService;

    @Mock
    private Principal principal;

    @Mock
    private Model model;

    @Mock
    private HttpSession session;

    private UserDtls user;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
        user = new UserDtls();
        user.setEmail("sushantkapri@gmail.com");

        // Mock the Principal to return the user's email
        when(principal.getName()).thenReturn("sushantkapri@gmail.com");
        when(userService.getUserByEmail("sushantkapri@gmail.com")).thenReturn(user);
    }

    @Test
    void testAddToWishlist() {
        // Arrange
        Integer productId = 1;
        when(wishlistService.addToWishlist(user, productId)).thenReturn(new Wishlist());

        // Act
        String view = controllerUser.addToWishlist(productId, principal, session);

        // Assert
        verify(wishlistService).addToWishlist(user, productId);
        assert (view.equals("redirect:/product/" + productId));
    }

    @Test
    void testRemoveFromWishlist() {
        // Arrange
        Integer productId = 1;

        // Act
        String view = controllerUser.removeFromWishlist(productId, principal, session);

        // Assert
        verify(wishlistService).removeFromWishlist(user, productId);
        verify(session).setAttribute("succMsg", "Product removed from wishlist");
        assert (view.equals("redirect:/user/wishlist"));
    }

    @Test
    void testViewWishlist() {
        // Arrange
        List<Wishlist> wishlist = new ArrayList<>();
        when(wishlistService.getWishlistByUser(user)).thenReturn(wishlist);

        // Act
        String view = controllerUser.viewWishlist(principal, model);

        // Assert
        verify(wishlistService).getWishlistByUser(user);
        verify(model).addAttribute("wishlist", wishlist);
        assert (view.equals("wishlist"));
    }
}
