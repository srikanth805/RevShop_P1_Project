<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Wishlist</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome for icons -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet"> <!-- Tailwind for styling -->
    <style>
        body {
            background-color: #f0f8f4; /* Soft background color */
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        .alert {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #0f0c0d;
        }
        .card {
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .btn {
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
        }
        .btn-primary {
            background-color: #12b5a5;
        }
        .btn-danger {
            background-color: #121010;
        }
    </style>
</head>
<body>
    <!-- Display messages if any -->
    <c:if test="${not empty succMsg}">
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i> ${succMsg}
        </div>
        <c:remove var="succMsg" />
    </c:if>

    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger">
            <i class="fas fa-exclamation-circle"></i> ${errorMsg}
        </div>
        <c:remove var="errorMsg" />
    </c:if>

    <!-- Tailwind Heading for Featured Products -->
    <div class="image-container relative">
         <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1728223257/RevShop/b1_elce1n.jpg" alt="wishlist" class="w-full h-44 md:h-48 object-cover">
        <div class="heading-overlay absolute inset-0 flex flex-col justify-center items-center text-white">
            <h2 class="text-white text-3xl md:text-4xl font-bold">&#10084; Wishlist</h2>
            <p class="text-white text-lg md:text-xl">Check Out Your Wishlist</p>
        </div>
    </div>
<section>
    <div class="container mt-5">

        <c:if test="${not empty wishlist}">
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
                <c:forEach var="item" items="${wishlist}">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden transform transition-transform hover:scale-105">
                        <div class="p-4 text-center">
                            <div class="border rounded-md">
                                <img alt="${item.product.title}"
                                    src="/img/product_img/${item.product.image}"
                                    class="mx-auto mb-3 w-full h-full">
                            </div>
                            <p class="text-lg font-semibold text-gray-800">${item.product.title}</p>
                            <div class="flex flex-col gap-4 justify-center items-center mt-3">
                                <a href="/product/${item.product.id}" class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-teal-600 transition duration-300">
                                    <i class="fas fa-eye"></i> View Details
                                </a>
                                <a href="/user/removeWishlist?productId=${item.product.id}" class="ml-2 px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600 transition duration-300">
                                    <i class="fas fa-trash"></i> Remove from Wishlist
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty wishlist}">
            <p class="text-center text-gray-500">Your wishlist is empty</p>
        </c:if>
    </div>
</section>



    <jsp:include page="footer.jsp" />
</body>
</html>
