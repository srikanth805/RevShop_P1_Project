<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RevShop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="wrapper">
        <form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return validateForm()">
            <h2>Login</h2>

            <!-- Error Message -->
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    <h5 style="color:red;"><c:out value="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}" /></h5>
                </div>
            </c:if>

            <!-- Success Message -->
            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    Logout successful!
                </div>
            </c:if>

            <!-- Email Field -->
            <div class="input-field">
                <input id="email" placeholder="Enter your Email" type="email" name="username" required>
                <label for="email">Enter your email</label>
            </div>

            <!-- Password Field -->
            <div class="input-field">
                <input id="password" placeholder="Enter your Password" type="password" name="password" required>
                <label for="password">Enter your password</label>
            </div>

            <!-- Remember Me and Forgot Password -->
            <div class="forget">
                <label for="remember">
                    <input type="checkbox" id="remember" name="remember">
                    <p>Remember me</p>
                </label>
                <a href="${pageContext.request.contextPath}/forgot-password" class="forgot-password">Forgot password?</a>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="button">Sign In</button>

            <!-- Registration Link -->
            <div class="register">
                <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign Up</a></p>
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            const password = document.getElementById("password").value;

            // Check if password is at least 8 characters long
            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false; // Prevent form submission
            }

            return true; // Allow form submission if everything is valid
        }
    </script>
</body>
</html>