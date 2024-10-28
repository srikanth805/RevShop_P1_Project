<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RevShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f0f0;
        }

        .container {
            margin-top: 50px;
        }

        .change-password-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="change-password-form">
            <h2 class="text-center">Change Password</h2>

            <c:if test="${not empty sessionScope.succMsg}">
                <div class="alert alert-success" id="alert-success">
                    ${sessionScope.succMsg}
                </div>
                <c:out value="${commnServiceImpl.removeSessionMessage()}" />
            </c:if>

            <c:if test="${not empty sessionScope.errorMsg}">
                <div class="alert alert-danger" id="error-alert">
                    ${sessionScope.errorMsg}
                </div>
                <c:out value="${commnServiceImpl.removeSessionMessage()}" />
            </c:if>

            <form action="${pageContext.request.contextPath}/user/change-password" method="post">
                <div class="form-group">
                    <label for="currentPassword">Current Password</label>
                    <input type="password" name="currentPassword" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" name="newPassword" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" name="confirmPassword" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Update Password</button>
            </form>
        </div>
    </div>
    <script>
    // Fade out and hide the alert messages after 2 seconds
    setTimeout(function() {
        const successAlert = document.getElementById("success-alert");
        if (successAlert) {
            successAlert.style.transition = "opacity 0.5s ease-out";
            successAlert.style.opacity = "0";
            setTimeout(() => successAlert.style.display = "none", 500);
        }

        const errorAlert = document.getElementById("error-alert");
        if (errorAlert) {
            errorAlert.style.transition = "opacity 0.5s ease-out";
            errorAlert.style.opacity = "0";
            setTimeout(() => errorAlert.style.display = "none", 500);
        }
    }, 2000);  // 2000ms = 2 seconds
</script>
</body>
</html>