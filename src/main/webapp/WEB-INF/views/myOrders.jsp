<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .order-card {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .order-card-header {
            background-color: #f1f3f5;
            padding: 10px 15px;
            border-bottom: 1px solid #dee2e6;
            font-size: 1.2rem;
            font-weight: 600;
        }

        .order-details {
            padding: 15px;
        }

        .order-actions {
            text-align: right;
        }

        .btn-cancel {
            background-color: #ff5a5f;
            color: white;
            font-size: 0.9rem;
            border-radius: 20px;
            padding: 5px 15px;
            transition: background-color 0.3s ease;
        }

        .btn-cancel:hover {
            background-color: #d9534f;
        }

        .btn-cancel:disabled {
            opacity: 0.5;
        }

        .order-card img {
            border-radius: 8px;
            height: auto;
            width: auto;
        }

        .order-card h5 {
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .total-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #28a745;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

</head>
<body>
    <div class="image-container relative">
         <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1728223257/RevShop/b1_elce1n.jpg" alt="wishlist" class="w-full h-44 md:h-48 object-cover">
        <div class="heading-overlay absolute inset-0 flex flex-col justify-center items-center text-white">
            <h2 class="text-white text-3xl md:text-4xl font-bold">Order History</h2>
            <p class="text-white text-lg md:text-xl">Manage Orders</p>
        </div>
    </div>
    <section>
        <div class="container mt-5">

            <!-- Success message display -->
            <c:if test="${sessionScope.succMsg != null}">
                <div class="alert alert-success text-center" role="alert" id="success-alert">
                    ${sessionScope.succMsg}
                </div>
                <c:out value="${commnServiceImpl.removeSessionMessage()}"/>
            </c:if>

            <!-- Error message display -->
            <c:if test="${sessionScope.errorMsg != null}">
                <div class="alert alert-danger text-center" role="alert" id="error-alert">
                    ${sessionScope.errorMsg}
                </div>
                <c:out value="${commnServiceImpl.removeSessionMessage()}"/>
            </c:if>

            <!-- Orders list -->
            <c:forEach var="o" items="${orders}">
                <div class="order-card row">
                    <!-- Product Image -->
                    <div class="col-md-2 d-flex align-items-center justify-content-center">
                        <img alt="${item.product.title}"
                             src="/img/product_img/${o.product.image}"
                             class="img-fluid"
                             style="max-width: 100%; height: auto; object-fit: contain;">
                    </div>


                    <div class="col-md-10">
                        <!-- Order Card Header -->
                        <div class="order-card-header d-flex justify-content-between align-items-center">
                            <span>Order ID: ${o.orderId}</span>
                            <span>${o.orderDate}</span>
                        </div>

                        <!-- Order Details -->
                        <div class="order-details row mt-3">
                            <div class="col-md-6">
                                <h5>Product Details</h5>
                                <p>Title: ${o.product.title}</p>
                                <p>Quantity: ${o.quantity}</p>
                                <p>Price per unit: &#8377;${o.price}</p>
                                <p>Total Price: <span class="total-price">&#8377;${o.quantity * o.price}</span></p>
                            </div>
                            <div class="col-md-6">
                                <h5>Status: <span class="badge ${o.status == 'Cancelled' ? 'bg-danger' : 'bg-success'}">${o.status}</span></h5>
                                <div class="order-actions mt-4">
                                    <c:choose>
                                        <c:when test="${o.status != 'Cancelled'}">
                                            <a href="${pageContext.request.contextPath}/user/update-status?id=${o.id}&st=6" class="btn btn-sm btn-cancel">Cancel Order</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#" class="btn btn-sm btn-cancel disabled">Cancelled</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
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

    <!-- Bootstrap 5 JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
</body>
</html>
