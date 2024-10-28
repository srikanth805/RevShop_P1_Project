<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RevShop</title>
    <link rel="stylesheet" href="static/css/productsCardHome.css"> <!-- Link to your CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <style>
         @keyframes fadeIn {
		    0% { opacity: 0; transform: scale(0.95); }
		    100% { opacity: 1; transform: scale(1); }
		}
		.fade-in {
		    animation: fadeIn 0.5s ease-in-out;
		}

		.placeholder {
		    background-color: #f3f4f6; /* Light grey color for placeholder */
		    width: 100%;
		    height: 200px; /* Set a fixed height for placeholder */
		    border-radius: 20px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    color: gray;
		}
    </style>
</head>
<body>
    <jsp:include page="base.jsp" />

     <div class="image-container relative">
	    <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1728223258/RevShop/b2_qnmjba.jpg" alt="Summer Collection" class="w-full h-44 md:h-48 object-cover">
	    <div class="heading-overlay absolute inset-0 flex flex-col justify-center items-center text-white">
	        <h2 class="text-white text-3xl md:text-4xl font-bold">Featured Products</h2>
	        <p class="text-white text-lg md:text-xl">Summer collection New Modern Design</p>
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
                    <div class="flex justify-between pb-2">
                        <a href="${pageContext.request.contextPath}/user/addCart?pid=${product.id}&uid=${user.id}"
                        class="px-4 py-1 bg-blue-900 text-white rounded-md hover:bg-blue-600 transition duration-300"
                        style="text-decoration: none;">Add to Cart</a>

                        <c:if test="${product.stock > 0}">
                            <form action="${pageContext.request.contextPath}/user/cart" method="get" class="inline">
                                <input type="hidden" name="pid" value="${product.id}">
                                <button type="submit" class="px-4 py-1 bg-blue-900 text-white rounded-md hover:bg-blue-600 transition duration-300">Buy Now</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </c:forEach>

        </div>
    </section>

    <%-- Include footer.jsp for the Footer --%>
    <%@ include file="footer.jsp" %>
</body>
</html>
