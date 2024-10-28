<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Latest Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
     <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <style>
        /* Custom styles can be added here if needed */
        .cus-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .cus-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }
        .badge-discount {
            background-color: #ff5722;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            position: absolute;
            top: 10px;
            left: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp" />


     <div class="image-container relative">
        <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1728223258/RevShop/b2_qnmjba.jpg" alt="Summer Collection" class="w-full h-44 md:h-48 object-cover">
        <div class="heading-overlay absolute inset-0 flex flex-col justify-center items-center text-white">
            <h2 class="text-white text-3xl md:text-4xl font-bold">Shop Products</h2>
            <p class="text-white text-lg md:text-xl">New Modern Design & Collections</p>
        </div>
    </div>
    <section id="product1" class="section-p1">

            <div class="pro-container">
                <!-- Loop through the products and create product cards -->
                <c:forEach var="product" items="${products}">
                    <div class="pro fade-in">
                        <%-- Conditional rendering of the product image --%>
                        <c:choose>
                            <c:when test="${not empty product.image}">
                                <img src="${pageContext.request.contextPath}/img/product_img/${product.image}" alt="${product.title}">
                            </c:when>
                            <c:otherwise>
                                <div class="placeholder">Image not available</div> <!-- Placeholder for missing image -->
                            </c:otherwise>
                        </c:choose>
                        <div class="des">
                            <%-- <span>${product.brand}</span> --%>
                            <h5>${product.title}</h5>
                            <h4>₹${product.price}</h4>
                        </div>
                        <div class="flex items-center justify-between pb-2">
                            <a href="${pageContext.request.contextPath}/product/${product.id}" class="mx-auto btn btn-outline-primary" style="border: 2px solid;">View Product</a>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </section>

    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
