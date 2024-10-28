<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RevShop</title>
    <!-- Linking the CSS file for styling -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
    <div class="wrapper">
        <form action="/saveUser" enctype="multipart/form-data" method="post" onsubmit="return validateForm();">
            <h2>Register</h2>

            <!-- Success and Error Messages -->
            <c:if test="${not empty sessionScope.succMsg}">
                <div id="success-message" class="alert alert-success" role="alert">
                    ${sessionScope.succMsg}
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.errorMsg}">
                <div id="error-message" class="alert alert-danger" role="alert">
                    ${sessionScope.errorMsg}
                </div>
            </c:if>

            <!-- Full Name & Mobile Number Side by Side -->
            <div class="input-group">
                <div class="input-field">
                    <input id="name" placeholder="Enter your Full Name" type="text" name="name" required>
                    <label for="name">Full Name</label>
                </div>
                <div class="input-field">
                    <input id="mobileNumber" placeholder="Enter your Mobile Number" type="number" name="mobileNumber" required>
                    <label for="mobileNumber">Mobile Number</label>
                </div>
            </div>

            <!-- Email & Address Side by Side -->
            <div class="input-group">
                <div class="input-field">
                    <input id="email" placeholder="Enter your Email" type="email" name="email" required>
                    <label for="email">Email</label>
                </div>
                <div class="input-field">
                    <input id="address" placeholder="Enter your Address" type="text" name="address" required>
                    <label for="address">Address</label>
                </div>
            </div>

            <!-- City & State Side by Side -->
            <div class="input-group">
                <div class="input-field">
                    <input id="city" placeholder="Enter your City" type="text" name="city" required>
                    <label for="city">City</label>
                </div>
                <div class="input-field">
                    <input id="state" placeholder="Enter your State" type="text" name="state" required>
                    <label for="state">State</label>
                </div>
            </div>

            <!-- Pincode -->
            <div class="input-field">
                <input id="pincode" placeholder="Enter your Pincode" type="number" name="pincode" required>
                <label for="pincode">Pincode</label>
            </div>

            <!-- Password & Confirm Password Side by Side -->
            <div class="input-group">
                <div class="input-field">
                    <input id="password" placeholder="Enter your Password" type="password" name="password" required>
                    <label for="password">Password</label>
                </div>
                <div class="input-field">
                    <input id="confirmpassword" placeholder="Confirm your Password" type="password" name="confirmpassword" required>
                    <label for="confirmpassword">Confirm Password</label>
                </div>
            </div>

            <!-- Profile Image -->
            <div class="input-field">
                <input id="img" type="file" name="img" class="form-control">
                <label for="img">Profile Image</label>
            </div>

            <!-- User Role -->
            <div class="input-field">
                <select id="userRole" name="role" required class="form-select">
                    <option value="buyer" selected>Buyer</option>
                    <option value="seller">Seller</option>
                </select>
                <label for="userRole">User Role</label>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="button">Register</button>

            <!-- Login Link -->
            <div class="register">
                <p>Already have an account? <a href="/signin">Login</a></p>
            </div>
        </form>
    </div>

    <script>
        // Hide success message after 2 seconds
        setTimeout(function() {
            const successMessage = document.getElementById("success-message");
            if (successMessage) {
                successMessage.style.display = "none";
            }
        }, 2000);

        // Form validation script
        function validateForm() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmpassword").value;

            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
