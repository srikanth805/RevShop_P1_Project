<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color : #fff;
            background-size: cover;
            color: #f8f9fa;
            min-height: 100vh;
            position: relative;
        }

        section .container {
            background: rgba(255, 255, 255, 0.15);
            padding: 2rem;
        }

        .card {
            color : rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 15px;
            padding: 20px;
            backdrop-filter: blur(20px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }

        .card-header {
            background-color: #6c63ff;
            color: white;
            font-size: 1.75rem;
            text-align: center;
            text-transform: uppercase;
            padding: 1.5rem;
            border-radius: 15px 15px 0 0;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .card-body {
            padding: 2rem;
            color: #fff;
        }

        label{
            color : black;
            font : bold;
        }

        input, textarea, select {
            background-color: rgba(255, 255, 255, 0.9);
            border: 2px solid transparent;
            color: #333;
            border-radius: 10px;
            padding: 0.75rem;
            transition: border 0.3s ease;
        }

        input:focus, textarea:focus, select:focus {
            border: 2px solid #6c63ff;
            outline: none;
            box-shadow: 0 0 10px rgba(108, 99, 255, 0.4);
        }

        .btn-primary {
            background-color: #6c63ff;
            border: none;
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.5s ease, transform 0.5s ease;
        }

        .btn-primary:hover {
            background-color: #574bfc;
        }

        .text-success, .text-danger {
            font-weight: bold;
        }

        .form-check-label {
            font-size: 1.5rem;
            color: black;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Add Product Form -->
    <section>
        <div class="container p-5 mt-3">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            Add Product
                        </div>

                        <!-- Success/Error Messages -->
                        <div class="card-body">
                            <!-- Success Message -->
                            <c:if test="${not empty sessionScope.succMsg}">
                                <p class="text-success fw-bold" id="success-alert">${sessionScope.succMsg}</p>
                                <%
                                    session.removeAttribute("succMsg");
                                %>
                            </c:if>

                            <!-- Error Message -->
                            <c:if test="${not empty sessionScope.errorMsg}">
                                <p class="text-danger fw-bold" id="error-alert">${sessionScope.errorMsg}</p>
                                <%
                                    session.removeAttribute("errorMsg");
                                %>
                            </c:if>

                            <!-- Form -->
                            <form action="${pageContext.request.contextPath}/admin/saveProduct" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label class="form-label">Enter Title</label>
                                    <input type="text" name="title" class="form-control" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Enter Description</label>
                                    <textarea rows="3" class="form-control" name="description" required></textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select class="form-select" name="category" required>
                                        <option value="">-- Select --</option>
                                        <c:forEach var="c" items="${categories}">
                                            <option value="${c.name}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Enter Price</label>
                                    <input type="number" name="price" class="form-control" required>
                                </div>

                                <!-- New fields from page 1 -->

                                <div class="mb-3">
                                    <label class="form-label">Type</label>
                                    <select class="form-select" name="type" required>
                                        <option value="">-- Select Type --</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="kids">Kids</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Sub-Category</label>
                                    <select class="form-select" name="subCategory" required>
                                        <option value="">-- Select Sub-Category --</option>
                                        <option value="kurta">Kurta</option>
                                        <option value="sherwani">Sherwani</option>
                                        <option value="tshirt">T-Shirt</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Size</label>
                                    <select class="form-select" name="size" required>
                                        <option value="">-- Select Size --</option>
                                        <option value="S">S</option>
                                        <option value="M">M</option>
                                        <option value="L">L</option>
                                        <option value="XL">XL</option>
                                        <option value="XXL">XXL</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="true" name="isActive" id="active" checked>
                                        <label class="form-check-label" for="active">Active</label>
                                    </div>
                                    <div class="form-check form-check-inline" style="margin-left: 20px;">
                                        <input class="form-check-input" type="radio" name="isActive" value="false" id="inactive">
                                        <label class="form-check-label" for="inactive">Inactive</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Enter Stock</label>
                                        <input type="number" name="stock" class="form-control" required>
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Upload Image</label>
                                        <input type="file" name="file" class="form-control">
                                    </div>
                                </div>

                                <button class="btn btn-primary col-md-12" type="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    // Fade out and hide the alert messages after 2 seconds
    setTimeout(function() {
        const successAlert = document.getElementById("success-alert");
        if (successAlert) {
            successAlert.style.transition = "opacity 0.5s ease-out";
            successAlert.style.opacity = "0";
            setTimeout(function() {
                successAlert.remove();
            }, 500);
        }

        const errorAlert = document.getElementById("error-alert");
        if (errorAlert) {
            errorAlert.style.transition = "opacity 0.5s ease-out";
            errorAlert.style.opacity = "0";
            setTimeout(function() {
                errorAlert.remove();
            }, 500);
        }
    }, 2000);
    </script>
</body>
</html>
