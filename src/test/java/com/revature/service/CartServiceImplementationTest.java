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

import com.revature.model.Cart;
import com.revature.model.Product;
import com.revature.model.UserDtls;
import com.revature.repository.CartRepository;
import com.revature.repository.ProductRepository;
import com.revature.repository.UserRepository;
import com.revature.service.impl.CartServiceImpl;

class CartServiceImplementationTest {

    @Mock
    private CartRepository cartRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private ProductRepository productRepository;

    @InjectMocks
    private CartServiceImpl cartService;

    private UserDtls user;
    private Product product;
    private Cart cart;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
        
        // Mock data setup
        user = new UserDtls();
        user.setId(1);
        
        product = new Product();
        product.setId(1);
        product.setDiscountPrice(100.0);
        
        cart = new Cart();
        cart.setUser(user);
        cart.setProduct(product);
        cart.setQuantity(1);
        cart.setTotalPrice(100.0);
    }

    @Test
    void testSaveCart_NewCart() {
        when(userRepository.findById(1)).thenReturn(Optional.of(user));
        when(productRepository.findById(1)).thenReturn(Optional.of(product));
        when(cartRepository.findByProductIdAndUserId(1, 1)).thenReturn(null);
        when(cartRepository.save(any(Cart.class))).thenReturn(cart);

        Cart result = cartService.saveCart(1, 1);

        assertNotNull(result);
        assertEquals(1, result.getQuantity());
        assertEquals(100.0, result.getTotalPrice());
    }

    @Test
    void testSaveCart_ExistingCart() {
        Cart existingCart = new Cart();
        existingCart.setUser(user);
        existingCart.setProduct(product);
        existingCart.setQuantity(1);
        existingCart.setTotalPrice(100.0);

        when(userRepository.findById(1)).thenReturn(Optional.of(user));
        when(productRepository.findById(1)).thenReturn(Optional.of(product));
        when(cartRepository.findByProductIdAndUserId(1, 1)).thenReturn(existingCart);
        when(cartRepository.save(any(Cart.class))).thenReturn(existingCart);

        Cart result = cartService.saveCart(1, 1);

        assertNotNull(result);
        assertEquals(2, result.getQuantity());
        assertEquals(200.0, result.getTotalPrice());
    }

    @Test
    void testGetCartsByUser() {
        List<Cart> carts = new ArrayList<>();
        carts.add(cart);

        when(cartRepository.findByUserId(1)).thenReturn(carts);

        List<Cart> result = cartService.getCartsByUser(1);

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals(100.0, result.get(0).getTotalPrice());
    }

    @Test
    void testGetCountCart() {
        when(cartRepository.countByUserId(1)).thenReturn(3);

        Integer count = cartService.getCountCart(1);

        assertEquals(3, count);
    }

    @Test
    void testUpdateQuantity_Increment() {
        when(cartRepository.findById(1)).thenReturn(Optional.of(cart));

        cartService.updateQuantity("in", 1);

        verify(cartRepository, times(1)).save(cart);
        assertEquals(2, cart.getQuantity());
    }

//    @Test
//    void testUpdateQuantity_Decrement() {
//        when(cartRepository.findById(1)).thenReturn(Optional.of(cart));
//
//        cartService.updateQuantity("de", 1);
//
//        verify(cartRepository, times(1)).save(cart);
//        assertEquals(0, cart.getQuantity());
//    }

    @Test
    void testClearCartByUser() {
        List<Cart> carts = new ArrayList<>();
        carts.add(cart);

        when(cartRepository.findByUserId(1)).thenReturn(carts);

        cartService.clearCartByUser(1);

        verify(cartRepository, times(1)).deleteAll(carts);
    }
}
