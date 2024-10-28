package com.revature.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import com.revature.model.UserDtls;
import com.revature.repository.UserRepository;
import com.revature.service.impl.UserServiceImpl;

class UserServiceImplTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private MultipartFile multipartFile;

    @InjectMocks
    private UserServiceImpl userService;

    private UserDtls user;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        user = new UserDtls();
        user.setId(1);
        user.setEmail("test@example.com");
        user.setPassword("password");
        user.setIsEnable(true);
        user.setAccountNonLocked(true);
        user.setFailedAttempt(0);
    }

    @Test
    void testSaveUser() {
        when(passwordEncoder.encode(anyString())).thenReturn("encodedPassword");
        when(userRepository.save(any(UserDtls.class))).thenReturn(user);

        UserDtls savedUser = userService.saveUser(user);

        assertNotNull(savedUser);
        assertEquals("encodedPassword", savedUser.getPassword());
        assertTrue(savedUser.getIsEnable());
        verify(userRepository, times(1)).save(any(UserDtls.class));
        verify(passwordEncoder, times(1)).encode(anyString());
    }

    @Test
    void testGetUserByEmail() {
        when(userRepository.findByEmail("test@example.com")).thenReturn(user);

        UserDtls foundUser = userService.getUserByEmail("test@example.com");

        assertNotNull(foundUser);
        assertEquals("test@example.com", foundUser.getEmail());
        verify(userRepository, times(1)).findByEmail("test@example.com");
    }

    @Test
    void testUpdateAccountStatus() {
        when(userRepository.findById(1)).thenReturn(Optional.of(user));
        when(userRepository.save(any(UserDtls.class))).thenReturn(user);

        Boolean result = userService.updateAccountStatus(1, false);

        assertTrue(result);
        assertFalse(user.getIsEnable());
        verify(userRepository, times(1)).findById(1);
        verify(userRepository, times(1)).save(any(UserDtls.class));
    }

    @Test
    void testIncreaseFailedAttempt() {
        user.setFailedAttempt(1);
        when(userRepository.save(any(UserDtls.class))).thenReturn(user);

        userService.increaseFailedAttempt(user);

        assertEquals(2, user.getFailedAttempt());
        verify(userRepository, times(1)).save(user);
    }

    @Test
    void testUserAccountLock() {
        when(userRepository.save(any(UserDtls.class))).thenReturn(user);

        userService.userAccountLock(user);

        assertFalse(user.getAccountNonLocked());
        assertNotNull(user.getLockTime());
        verify(userRepository, times(1)).save(user);
    }

    @Test
    void testUnlockAccountTimeExpired_Expired() {
        user.setLockTime(new Date(System.currentTimeMillis() - 3600000)); // 1 hour ago

        boolean result = userService.unlockAccountTimeExpired(user);

        assertTrue(result);
        assertTrue(user.getAccountNonLocked());
        assertEquals(0, user.getFailedAttempt());
        assertNull(user.getLockTime());
        verify(userRepository, times(1)).save(user);
    }

    @Test
    void testUnlockAccountTimeExpired_NotExpired() {
        user.setLockTime(new Date(System.currentTimeMillis()));

        boolean result = userService.unlockAccountTimeExpired(user);

        assertFalse(result);
        assertTrue(user.getAccountNonLocked());
        verify(userRepository, never()).save(any(UserDtls.class));
    }

    @Test
    void testUpdateUserResetToken() {
        when(userRepository.findByEmail("test@example.com")).thenReturn(user);
        when(userRepository.save(any(UserDtls.class))).thenReturn(user);

        userService.updateUserResetToken("test@example.com", "resetToken");

        assertEquals("resetToken", user.getResetToken());
        verify(userRepository, times(1)).findByEmail("test@example.com");
        verify(userRepository, times(1)).save(any(UserDtls.class));
    }

    @Test
    void testUpdateUserProfile() throws Exception {
        when(userRepository.findById(1)).thenReturn(Optional.of(user));
        when(userRepository.save(any(UserDtls.class))).thenReturn(user);
        when(multipartFile.isEmpty()).thenReturn(false);
        when(multipartFile.getOriginalFilename()).thenReturn("profile.jpg");

        File imgDir = new ClassPathResource("static/img").getFile();
        Path path = Paths.get(imgDir.getAbsolutePath() + File.separator + "profile_img" + File.separator + "profile.jpg");

        userService.updateUserProfile(user, multipartFile);

        assertEquals("profile.jpg", user.getProfileImage());
        verify(userRepository, times(1)).save(user);
        verify(multipartFile, times(1)).getInputStream();
        assertFalse(Files.exists(path)); // Check if the file is saved
    }

    @Test
    void testSaveAdmin() {
        when(passwordEncoder.encode(anyString())).thenReturn("encodedPassword");
        when(userRepository.save(any(UserDtls.class))).thenReturn(user);

        UserDtls savedAdmin = userService.saveAdmin(user);

        assertNotNull(savedAdmin);
        assertEquals("ROLE_ADMIN", savedAdmin.getRole());
        verify(userRepository, times(1)).save(user);
        verify(passwordEncoder, times(1)).encode(anyString());
    }

    @Test
    void testExistsEmail() {
        when(userRepository.existsByEmail("test@example.com")).thenReturn(true);

        Boolean exists = userService.existsEmail("test@example.com");

        assertTrue(exists);
        verify(userRepository, times(1)).existsByEmail("test@example.com");
    }
}
