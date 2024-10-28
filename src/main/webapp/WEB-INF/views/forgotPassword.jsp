<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f0f0; /* Light gray background */
            padding-top: 50px; /* Space at the top */
        }
        .form-container {
            margin: auto;
            padding: 40px;
            background: linear-gradient(135deg, #74ebd5, #acb6e5); /* Gradient background */
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            margin-top: 20px; /* Reduced margin for less space */
            border: 1px solid #ddd; /* Light border */
        }
        .card-header {
            background: none; /* No background */
            color: black;
            border-radius: 10px 10px 0 0;
            text-align: center;
            padding: 20px; /* Padding for header */
        }
        .form-label {
            font-weight: bold;
            color: #333;
        }
        .btn {
            background-color: #28a745; /* Green background */
            border: none;
            border-radius: 5px;
            padding: 10px;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%; /* Full width */
        }
        .btn:hover {
            background-color: #218838; /* Darker green on hover */
        }
        .alert {
            margin-bottom: 20px; /* Space below alerts */
        }
    </style>
</head>
<body>
    <section>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="form-container">
                        <div class="card-header">
                            <p class="fs-4">Forgot Password</p>
                            <c:if test="${not empty sessionScope.succMsg}">
                                <p class="text-success fw-bold" id="success-alert">${sessionScope.succMsg}</p>
                                <c:set var="sessionScope.succMsg" value="" />
                            </c:if>
                            <c:if test="${not empty sessionScope.errorMsg}">
                                <p class="text-danger fw-bold" id="error-alert">${sessionScope.errorMsg}</p>
                                <c:set var="sessionScope.errorMsg" value="" />
                            </c:if>
                        </div>
                        <div class="card-body">
                            <form action="/forgot-password" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input required="required" class="form-control" name="email" type="email" placeholder="Enter your email">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn">Send</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
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

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>