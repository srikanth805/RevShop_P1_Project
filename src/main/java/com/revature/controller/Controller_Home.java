package com.revature.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.revature.model.Category;
import com.revature.model.Product;
import com.revature.model.ReviewModel;
import com.revature.model.UserDtls;
import com.revature.service.CartService;
import com.revature.service.CategoryService;
import com.revature.service.ProductService;
import com.revature.service.ReviewService;
import com.revature.service.UserService;
import com.revature.util.MailHelper;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_Home {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private MailHelper commonUtil;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private CartService cartService;

    @ModelAttribute
    public void getUserDetails(Principal p, Model m) {
        if (p != null) {
            String email = p.getName();
            UserDtls userDtls = userService.getUserByEmail(email);
            m.addAttribute("user", userDtls);
            Integer countCart = cartService.getCountCart(userDtls.getId());
            m.addAttribute("countCart", countCart);
        }

        List<Category> allActiveCategory = categoryService.getAllActiveCategory();
        m.addAttribute("categories", allActiveCategory);
    }

    @GetMapping("/")
    public String index(Model m) {
        List<Category> allActiveCategory = categoryService.getAllActiveCategory().stream()
                .sorted((c1, c2) -> c2.getId().compareTo(c1.getId()))
                .limit(6).toList();
        List<Product> allActiveProducts = productService.getAllActiveProducts("").stream()
                .sorted((p1, p2) -> p2.getId().compareTo(p1.getId()))
                .limit(8).toList();
        m.addAttribute("category", allActiveCategory);
        m.addAttribute("products", allActiveProducts);
        return "userHome";
    }

    @GetMapping("/shop")
    public String showShop(Model m) {
        // Add products to the model
        List<Product> allActiveProducts = productService.getAllActiveProducts("").stream()
                .sorted((p1, p2) -> p2.getId().compareTo(p1.getId()))
                .limit(8).toList();
        m.addAttribute("products", allActiveProducts);
        return "shop"; // This will resolve to /WEB-INF/views/shop.jsp
    }

    @GetMapping("/featured-products")
    public String showFeatured(Model m) {
        // Add products to the model
        List<Product> allActiveProducts = productService.getAllActiveProducts("").stream()
                .sorted((p1, p2) -> p2.getId().compareTo(p1.getId()))
                .limit(8).toList();
        m.addAttribute("products", allActiveProducts);
        return "featured_products"; // This will resolve to /WEB-INF/views/shop.jsp
    }

    @GetMapping("/signin")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/products")
    public String products(Model m,
                           @RequestParam(value = "category", defaultValue = "") String category,
                           @RequestParam(name = "pageNo", defaultValue = "0") Integer pageNo,
                           @RequestParam(name = "pageSize", defaultValue = "12") Integer pageSize,
                           @RequestParam(value = "ch", defaultValue = "") String ch,
                           @RequestParam(value = "type", defaultValue = "") String type, // New param for type
                           @RequestParam(value = "subCategory", defaultValue = "") String subCategory, // New param for subcategory
                           @RequestParam(value = "size", defaultValue = "") String size, // New param for size
                           Principal principal) {

        // Log the parameters received
        System.out.println("Received parameters:");
        System.out.println("Category: " + category);
        System.out.println("Page No: " + pageNo);
        System.out.println("Page Size: " + pageSize);
        System.out.println("Search Term: " + ch);
        System.out.println("Type: " + type);
        System.out.println("SubCategory: " + subCategory);
        System.out.println("Size: " + size);

        List<Category> categories = categoryService.getAllActiveCategory();
        System.out.println("Categories: " + categories); // Log categories list
        m.addAttribute("paramValue", category);
        m.addAttribute("categories", categories);

        // Fetch all types initially
        // Example: Filter out null values
        List<String> types = categoryService.getAllTypes().stream()
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        System.out.println("Types: " + types); // Log types list

        // Fetch subcategories based on type
        List<String> subCategories = StringUtils.isEmpty(type)
                ? Collections.emptyList()
                : categoryService.getSubCategoriesByTypeOrCategory(type, category);
        System.out.println("SubCategories: " + subCategories); // Log subcategories list
        m.addAttribute("subCategories", subCategories);

        // Fetch sizes only if a type is selected
        List<String> sizes = StringUtils.isEmpty(type)
                ? Collections.emptyList()
                : categoryService.getAllSizes().stream()
                .filter(Objects::nonNull) // Filter out null values
                .collect(Collectors.toList());
        System.out.println("Sizes: " + sizes); // Log sizes list
        m.addAttribute("sizes", sizes);


        Page<Product> page;

        // Check if any filters are applied (ch, type, subCategory, size)
        if (StringUtils.isEmpty(ch) && StringUtils.isEmpty(type) && StringUtils.isEmpty(subCategory) && StringUtils.isEmpty(size)) {
            // No filters, fetch all active products
            page = productService.getAllActiveProductPagination(pageNo, pageSize, category);
        } else {
            // Apply filters and fetch products based on the provided filters
            page = productService.getFilteredActiveProductPagination(pageNo, pageSize, category, type, subCategory, size);
        }


        List<Product> products = page.getContent();
        System.out.println("Products fetched: " + products); // Log products list

        m.addAttribute("products", products);
        m.addAttribute("productsSize", products.size());

        m.addAttribute("pageNo", page.getNumber());
        m.addAttribute("pageSize", pageSize);
        m.addAttribute("totalElements", page.getTotalElements());
        m.addAttribute("totalPages", page.getTotalPages());
        m.addAttribute("isFirst", page.isFirst());
        m.addAttribute("isLast", page.isLast());

        if (principal != null) {
            UserDtls user = userService.getUserByEmail(principal.getName());
            m.addAttribute("userRole", user.getRole()); // Add user role to model
        } else {
            m.addAttribute("userRole", "ROLE_GUEST"); // Default role if not logged in
        }

        return "product";
    }


    @GetMapping("/product/{id}")
    public String product(@PathVariable int id, Model m) {
        Product productById = productService.getProductById(id);
        List<ReviewModel> reviews = reviewService.getReviewsByProductId(id); // Fetch reviews

        m.addAttribute("product", productById);
        m.addAttribute("reviews", reviews); // Add reviews to the model
        return "viewProduct";
    }

    @PostMapping("/saveReview")
    public String saveReview(
            @RequestParam("productId") int productId,
            @RequestParam("userId") int userId,
            @RequestParam("rating") int rating,
            @RequestParam("comment") String comment,
            RedirectAttributes redirectAttributes) {

        // Set current date and time
        LocalDateTime reviewDate = LocalDateTime.now();

        // Assuming you have methods to fetch Product and User by their IDs
        Optional<Product> productOpt = Optional.ofNullable(productService.getProductById(productId));
        Optional<UserDtls> userOpt = Optional.ofNullable(userService.getUserById(userId));

        if (!productOpt.isPresent() || !userOpt.isPresent()) {
            redirectAttributes.addFlashAttribute("errorMsg", "Invalid User or Product!");
            return "redirect:/product/" + productId;
        }

        Product product = productOpt.get();
        UserDtls user = userOpt.get();

        ReviewModel review = new ReviewModel();
        review.setProduct(product);
        review.setUser(user);
        review.setRating(rating);
        review.setComment(comment);
        review.setDate(reviewDate);

        // Save review
        reviewService.saveReview(review);

        redirectAttributes.addFlashAttribute("succMsg", "Review submitted !!");
        return "redirect:/product/" + productId;
    }



    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute UserDtls user, @RequestParam("img") MultipartFile file, HttpSession session)
            throws IOException {

        Boolean existsEmail = userService.existsEmail(user.getEmail());

        if (existsEmail) {
            session.setAttribute("errorMsg", "Email already exists");
        } else {
            // Assign role based on the user's selection
            if ("buyer".equals(user.getRole())) {
                user.setRole("ROLE_USER");
            } else if ("seller".equals(user.getRole())) {
                user.setRole("ROLE_ADMIN");
            }

            // Set default image or uploaded image
            String imageName = file.isEmpty() ? "default.jpg" : file.getOriginalFilename();
            user.setProfileImage(imageName);
            UserDtls saveUser = userService.saveUser(user);

            if (!ObjectUtils.isEmpty(saveUser)) {
                if (!file.isEmpty()) {
                    // Use relative path inside static folder
                    File saveFile = new ClassPathResource("static/img/profile_img").getFile();

                    Path path = Paths.get(saveFile.getAbsolutePath() + File.separator + file.getOriginalFilename());

                    // Copy file to the path
                    Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                }
                session.setAttribute("succMsg", "Registered successfully, Please Login!");
            } else {
                session.setAttribute("errorMsg", "Something went wrong!! Please Try again!");
            }
        }

        return "redirect:/signin";
    }

    @GetMapping("/forgot-password")
    public String showForgotPassword() {
        return "forgotPassword";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam String email, RedirectAttributes redirectAttributes, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
        UserDtls userByEmail = userService.getUserByEmail(email);

        if (ObjectUtils.isEmpty(userByEmail)) {
            redirectAttributes.addFlashAttribute("errorMsg", "Invalid email");
        } else {
            String resetToken = UUID.randomUUID().toString();
            userService.updateUserResetToken(email, resetToken);
            String url = MailHelper.generateUrl(request) + "/reset-password?token=" + resetToken;
            Boolean sendMail = commonUtil.sendMail(url, email);

            if (sendMail) {
                redirectAttributes.addFlashAttribute("succMsg", "Password Reset link sent to your email");
            } else {
                redirectAttributes.addFlashAttribute("errorMsg", "Something went wrong! Email not sent");
            }
        }

        return "redirect:/forgot-password";
    }

    @GetMapping("/reset-password")
    public String showResetPassword(@RequestParam String token, Model m) {
        UserDtls userByToken = userService.getUserByToken(token);

        if (userByToken == null) {
            m.addAttribute("msg", "Your link is invalid or expired!");
            return "message";
        }
        m.addAttribute("token", token);
        return "resetPassword";
    }

    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam String token, @RequestParam String password, Model m) {
        UserDtls userByToken = userService.getUserByToken(token);
        if (userByToken == null) {
            m.addAttribute("errorMsg", "Your link is invalid or expired!");
            return "message";
        } else {
            userByToken.setPassword(passwordEncoder.encode(password));
            userByToken.setResetToken(null);
            userService.updateUser(userByToken);
            m.addAttribute("msg", "Password changed successfully");
            return "message";
        }
    }

    @GetMapping("/search")
    public String searchProduct(@RequestParam String ch, Model m) {
        List<Product> searchProducts = productService.searchProduct(ch);
        m.addAttribute("products", searchProducts);
        List<Category> categories = categoryService.getAllActiveCategory();
        m.addAttribute("categories", categories);
        return "product";
    }
}
