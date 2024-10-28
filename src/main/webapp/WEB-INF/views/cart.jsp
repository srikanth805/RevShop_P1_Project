<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <style>
        /* Advanced Styling for Cart Page */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #c3d5d5;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            max-width: 1400px;
            margin: auto;
        }

/* Card Styles */
.card-sh {
    background-color: #fefefe; /* Soft white for a cleaner look */
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Elevation for a modern look */
    overflow: hidden;
    border: none;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card-sh:hover {
    transform: translateY(-8px); /* Subtle lift on hover */
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15); /* Deepened shadow on hover */
}

.card-header {
    background: linear-gradient(135deg, #4a90e2, #007bff); /* Modern gradient */
    color: #fff;
    padding: 2rem;
    border-radius: 16px 16px 0 0;
    text-align: center;
}

.card-header p {
    margin: 0;
    font-size: 1.85rem;
    font-weight: 700;
    letter-spacing: 0.6px;
}

.card-body {
    padding: 2rem;
    background-color: #fafafa; /* Softer background */
}

/* Table Styles */
.table {
    width: 100%;
    border-radius: 12px;
    overflow: hidden;
    background-color: #fff;
    border-collapse: separate;
    border-spacing: 0 10px;
}

th, td {
    padding: 1.5rem;
    text-align: center;
    background-color: #f2f4f6; /* Updated light background */
}

.table th {
    background-color: #476b6b;
    color: white;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 1px;
    border: none;
}

.table td {
    vertical-align: middle;
    font-size: 1.1rem;
    color: #333;
    transition: background-color 0.3s ease;
}

.table tr:hover td {
    background-color: #eef0f5; /* Subtle hover effect on rows */
}

.table img {
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Stronger depth for images */
    width: 75px;
    height: 75px;
}

/* Button Styles */
.btn {
    padding: 12px 24px;
    border-radius: 10px;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    background-color: #007bff;
    transition: background-color 0.3s ease, transform 0.3s ease;
    display: inline-block;
    border: none;
    font-weight: 600;
}

.btn:hover {
    background-color: #0056b3;
    transform: translateY(-3px); /* Lift effect on hover */
}

.btn-warning {
    background-color: #699696;
    color: #fff;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.btn-warning:hover {
    background-color: #699696;
    transform: translateY(-3px);
}

.btn i {
    margin-right: 6px;
}

/* Typography */
.fw-bold {
    font-weight: 700;
}

/* Message Styles */
.text-success {
    color: #28a745;
    font-weight: bold;
}

.text-danger {
    color: #dc3545;
    font-weight: bold;
}

/* Responsive Table */
@media (max-width: 768px) {
    .table thead {
        display: none;
    }

    .table tr {
        display: block;
        margin-bottom: 1rem;
        border: 1px solid #dee2e6;
        padding: 1.25rem;
    }

    .table td {
        display: flex;
        justify-content: space-between;
        padding: 1rem;
        position: relative;
    }

    .table td:before {
        content: attr(data-label);
        background-color: #4a90e2;
        color: white;
        font-weight: bold;
        padding: 0.75rem;
        border-right: 1px solid #dee2e6;
        width: 160px;
        text-align: left;
        display: inline-block;
    }

    .btn-warning {
        width: 100%; /* Full width buttons */
        margin-top: 1rem;
    }
}

/* Hover Effects for Interactivity */
.card-header p:hover {
    letter-spacing: 0.8px;
    transition: letter-spacing 0.3s ease;
}

.table td:hover {
    color: #007bff; /* Accent color for hover */
}

    </style>
</head>
<body>
    <section>
         <div class="mt-16 image-container relative">
            <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1728223258/RevShop/b2_qnmjba.jpg" alt="Summer Collection" class="w-full h-44 md:h-48 object-cover">
            <div class="heading-overlay absolute inset-0 flex flex-col justify-center items-center text-white">
                <h2 class="text-white text-3xl md:text-4xl font-bold">Cart Items</h2>
                <p class="text-white text-lg md:text-xl">Manage Cart Items</p>
            </div>
        </div>
        <div class="container-fluid mt-5 p-5">
            <div class="card card-sh">
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Sl No</th>
                                <th scope="col">Image</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Price</th>
                                <th scope="col" class="text-center">Quantity</th>
                                <th scope="col">Total Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cart" items="${carts}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.index + 1}</th>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/img/product_img/${cart.product.image}" width="70px" height="70px">
                                    </td>
                                    <td>${cart.product.title}</td>
                                    <td>&#8377; ${cart.product.discountPrice}</td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/user/cartQuantityUpdate?sy=de&cid=${cart.id}" class="btn btn-warning">
                                            <i class="fa-solid fa-minus"></i>
                                        </a>
                                        [ ${cart.quantity} ]
                                        <a href="${pageContext.request.contextPath}/user/cartQuantityUpdate?sy=in&cid=${cart.id}" class="btn btn-warning">
                                            <i class="fa-solid fa-plus"></i>
                                        </a>

                                        <!-- Display message if quantity exceeds 5 -->
                                        <c:if test="${cart.quantity >= 5}">
                                            <div class="text-danger mt-2 text-sm">
                                                Not enough quantity available
                                            </div>
                                        </c:if>
                                    </td>
                                    <td>&#8377; ${cart.totalPrice}</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="4"></td>
                                <td class="fw-bold">Total Price</td>
                                <td class="fw-bold">&#8377; ${totalOrderPrice}</td>
                            </tr>
                        </tbody>

                    </table>
                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/user/orders" class="btn btn-warning">Proceed Payment</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>