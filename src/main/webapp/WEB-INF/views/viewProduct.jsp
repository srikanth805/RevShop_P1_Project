<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- Internal CSS -->
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            max-width: 1200px;
            margin-top: 70px;
            margin-bottom: 100px;
        }

        .product-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .product-card:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .product-image {
            border-bottom: 1px solid #ddd;
        }

        .product-image img {
            border-bottom: 1px solid #ddd;
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .product-info {
            padding: 2rem;
        }

        .product-title {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 1rem;
        }

        .product-description {
            font-size: 1rem;
            color: #666;
            margin-bottom: 1rem;
        }

        .product-details {
            font-size: 0.9rem;
            color: #444;
            margin-bottom: 1.5rem;
        }

        .price-info {
            font-size: 1.5rem;
            font-weight: 700;
            color: #28a745;
            margin-bottom: 1rem;
        }

        .price-info .discount-price {
            color: #007bff;
            margin-right: 1rem;
        }

        .price-info .original-price {
            text-decoration: line-through;
            color: #888;
        }

        .price-info .discount-percentage {
            color: #dc3545;
        }

        .btn-custom {
            border-radius: 50px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-custom-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }

        .btn-custom-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-custom-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
        }

        .btn-custom-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .btn-custom-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
        }

        .btn-custom-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .review-form {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-top: 2rem;
        }

        .review-list {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-top: 2rem;
        }

        .review-item {
            border-bottom: 1px solid #ddd;
            padding: 1rem 0;
        }

        .review-item:last-child {
            border-bottom: none;
        }

        .review-user {
            font-weight: 700;
            color: #333;
        }

        .review-rating {
            font-size: 0.9rem;
            color: #f39c12;
        }

        .review-comment {
            font-size: 0.9rem;
            color: #666;
        }

        .review-date {
            font-size: 0.8rem;
            color: #999;
        }

        .btn-custom-group {
            display: flex;
            gap: 1rem;
        }

        @media (max-width: 767.98px) {
            .btn-custom-group {
                flex-direction: column;
                align-items: stretch;
            }
        }
    </style>
</head>
<body>
    <section>
    
        <div class="container">
        <!-- Display success message -->
                 <div class="text-center">
            <c:if test="${not empty sessionScope.succMsg}">
                        <p class="text-success fw-bold">${sessionScope.succMsg}</p>
                        <c:remove var="sessionScope.succMsg" />
                    </c:if>

                    <!-- Display error message -->
                    <c:if test="${not empty sessionScope.errorMsg}">
                        <p class="text-danger fw-bold">${sessionScope.errorMsg}</p>
                        <c:remove var="sessionScope.errorMsg" />
                    </c:if>
            </div>   
            <div class="product-card">
            
                <div class="row">
                    <div class="col-md-6 product-image">
                        <img alt="${product.title}" src="${pageContext.request.contextPath}/img/product_img/${product.image}">
                    </div>

                    <div class="col-md-6 product-info">
                        <h1 class="product-title">${product.title}</h1>
                        <p class="product-description">${product.description}</p>
                        <p class="product-details">
                            <span class="fw-bold">Status:</span>
                            <c:choose>
                                <c:when test="${product.stock > 0}">
                                    <span class="badge badge-success">Available</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-warning">Out of Stock</span>
                                </c:otherwise>
                            </c:choose>
                            <br>Category: ${product.category}<br>
                            Policy: 7 Days Replacement & Return
                        </p>
                        <div class="price-info">
                            <span class="discount-price">
                                <i class="fas fa-rupee-sign"></i> ${product.discountPrice}
                            </span>
                            <span class="original-price">
                                <i class="fas fa-rupee-sign"></i> ${product.price}
                            </span>
                            <span class="discount-percentage">
                                ${product.discount}% off
                            </span>
                        </div>

                        <div class="btn-custom-group">
                            <c:choose>
                                <c:when test="${product.stock > 0}">
                                    <c:choose>
                                        <c:when test="${user == null}">
                                            <a href="${pageContext.request.contextPath}/signin" class="btn btn-custom btn-custom" style="background-color:#558ddf;color:white">Add To Cart</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/user/addCart?pid=${product.id}&uid=${user.id}" class="btn btn-custom btn-custom-danger">Add To Cart</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" class="btn btn-custom btn-custom-warning">Out of Stock</a>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${product.stock > 0}">
                                <form action="${pageContext.request.contextPath}/user/cart" method="get">
                                    <input type="hidden" name="pid" value="${product.id}">
                                    <button type="submit" class="btn btn-custom btn-custom" style="background-color:#288293;color:white">Buy Now</button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Review Form -->
            <div class="review-form">
                <h3>Leave a Review:</h3>
                <c:if test="${user != null}">
                    <form action="${pageContext.request.contextPath}/saveReview" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="hidden" name="userId" value="${user.id}">
                        <div class="form-group">
                            <label for="rating">Rating:</label>
                            <input type="number" name="rating" id="rating" class="form-control" min="1" max="5" required>
                        </div>
                        <div class="form-group mt-2">
                            <label for="comment">Comment:</label>
                            <textarea name="comment" id="comment" class="form-control" rows="4" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-custom btn-custom-primary mt-3">Submit Review</button>
                    </form>
                </c:if>
                <c:if test="${user == null}">
                    <p>Please <a href="${pageContext.request.contextPath}/signin">sign in</a> to leave a review.</p>
                </c:if>
            </div>

            <!-- Display Reviews -->
            <div class="review-list">
                <h3>Reviews:</h3>
                <c:forEach var="review" items="${reviews}">
                    <div class="review-item">
                        <p class="review-user">${review.user.name} <span class="review-rating">${review.rating} Stars</span></p>
                        <p class="review-comment">${review.comment}</p>
                        <p class="review-date"><small>Date: ${fn:substring(review.date, 0, 19)}</small></p>
                    </div>
                </c:forEach>
                <c:if test="${empty reviews}">
                    <p>No reviews yet. Be the first to leave a review!</p>
                </c:if>
            </div>
        </div>
    </section>
</body>
</html>