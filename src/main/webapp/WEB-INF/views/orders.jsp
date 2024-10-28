<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./base.jsp" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
       /* Background and general text styling */
       body {
           background: linear-gradient(135deg, #3f8da7, #3a8181);
           color: #316ca2;
           font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
       }

       /* Page header styling */
       .page-header {
           text-align: center;
           margin-top: 2rem;
           font-size: 2.5rem;
           font-weight: 700;
           color: #0b0c0e;
           animation: fadeIn 1s ease;
       }

       /* Fade-in animation for page header */
       @keyframes fadeIn {
           from {
               opacity: 0;
           }
           to {
               opacity: 1;
           }
       }

       /* Updated DIV container inside SECTION */
       section .container-fluid {
           background-color: #ffffff;
           padding: 2rem;
           border-radius: 1rem;
           box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
           margin-top: 2rem;
           animation: fadeInUp 0.8s ease-in-out;
       }

       /* Fade-in up animation for the container */
       @keyframes fadeInUp {
           from {
               transform: translateY(20px);
               opacity: 0;
           }
           to {
               transform: translateY(0);
               opacity: 1;
           }
       }

       /* Adding some padding inside the inner rows */
       section .row {
           margin-bottom: 1.5rem;
       }

       /* Styling links inside the container */
       section .container-fluid a {
           font-weight: 500;
           color: #3f8da7;
           text-decoration: none;
       }

       section .container-fluid a:hover {
           color: #0b7abf;
           text-decoration: underline;
       }

       /* Styling the search input group */
       .input-group .form-control {
           border-radius: 0.5rem 0 0 0.5rem;
           border: 2px solid #ced4da;
           transition: border-color 0.3s ease;
       }

       .input-group .form-control:focus {
           border-color: #0b7abf;
           box-shadow: 0 0 5px rgba(13, 110, 253, 0.25);
       }

       /* Button styling for input group */
       .input-group .btn {
           border-radius: 0 0.5rem 0.5rem 0;
           background-color: #0b7abf;
           border: none;
           font-weight: 600;
           color: #fff;
           transition: background-color 0.3s ease;
       }

       .input-group .btn:hover {
           background-color: #045a94;
       }

       /* Success and error message styling */
       .alert {
           border-radius: 0.5rem;
           padding: 1rem;
           box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
           font-size: 1rem;
       }

       /* Table styling */
       .table {
           background-color: #ffffff;
           border-radius: 1rem;
           box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
           overflow: hidden;
           animation: fadeInUp 0.8s ease-in-out;
       }

       /* Pagination styling */
       .pagination {
           justify-content: center;
           margin-top: 1.5rem;
       }

       .pagination .page-link {
           background-color: #ffffff;
           border-radius: 0.5rem;
           padding: 0.5rem 1rem;
           box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
           transition: background-color 0.3s ease;
       }

       .pagination .page-link:hover {
           background-color: #f1f1f1;
       }

       .pagination .page-item.active .page-link {
           background-color: #0dfd7d;
           border-color: #0d6efd;
           color: #fff;
       }

       /* Responsive styles */
       @media (max-width: 768px) {
           section .container-fluid {
               padding: 1.5rem;
           }

           .table {
               font-size: 0.875rem;
           }
       }

       @media (max-width: 576px) {
           .page-header {
               font-size: 1.75rem;
           }

           .form-control, .btn-primary {
               font-size: 0.875rem;
           }
       }

    </style>


</head>
<body>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <p class="page-header">All Orders</p>
                    <hr>
                    <a href="/admin/" class="text-decoration-none mb-3 d-inline-block"><i class="fa-solid fa-arrow-left"></i> Back</a>

                    <!-- Success message -->
                    <c:if test="${not empty sessionScope.succMsg}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert" id="success-alert">
                            <strong>Success!</strong> ${sessionScope.succMsg}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <c:set var="null" value="${sessionScope.succMsg}" scope="session" />
                    </c:if>

                    <!-- Error message -->
                    <c:if test="${not empty sessionScope.errorMsg}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert" id="error-alert">
                            <strong>Error!</strong> ${sessionScope.errorMsg}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <c:set var="null" value="${sessionScope.errorMsg}" scope="session" />
                    </c:if>

                    <div class="col-md-4 mb-4">
                        <form action="/admin/search-order" method="get">
                            <div class="input-group">
                                <input type="text" class="form-control" name="orderId" placeholder="Enter order ID">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Deliver Details</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Product Details</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!-- If search result exists -->
                                <c:if test="${srch}">
                                    <c:choose>
                                        <c:when test="${not empty orderDtls}">
                                            <tr>
                                                <th scope="row">${orderDtls.orderId}</th>
                                                <td>
                                                    <p><strong>Name:</strong> ${orderDtls.orderAddress.firstName} ${orderDtls.orderAddress.lastName}</p>
                                                    <p><strong>Email:</strong> ${orderDtls.orderAddress.email}</p>
                                                    <p><strong>Mobno:</strong> ${orderDtls.orderAddress.mobileNo}</p>
                                                    <p><strong>Address:</strong> ${orderDtls.orderAddress.address}</p>
                                                    <p><strong>City:</strong> ${orderDtls.orderAddress.city}</p>
                                                    <p><strong>State:</strong> ${orderDtls.orderAddress.state}, ${orderDtls.orderAddress.pincode}</p>
                                                </td>
                                                <td>${orderDtls.orderDate}</td>
                                                <td>${orderDtls.product.title}</td>
                                                <td>
                                                    <p><strong>Quantity:</strong> ${orderDtls.quantity}</p>
                                                    <p><strong>Price:</strong> ${orderDtls.price}</p>
                                                    <p><strong>Total Price:</strong> ${orderDtls.quantity * orderDtls.price}</p>
                                                </td>
                                                <td>${orderDtls.status}</td>
                                                <td>
                                                    <form action="/admin/update-order-status" method="post">
                                                        <div class="input-group">
                                                            <select class="form-control" name="st">
                                                                <option>--select--</option>
                                                                <option value="1">In Progress</option>
                                                                <option value="2">Order Received</option>
                                                                <option value="3">Product Packed</option>
                                                                <option value="4">Out for Delivery</option>
                                                                <option value="5">Delivered</option>
                                                                <option value="6">Cancelled</option>
                                                            </select>
                                                            <input type="hidden" name="id" value="${orderDtls.id}">
                                                            <button class="btn btn-primary btn-sm" type="${orderDtls.status == 'Cancelled' || orderDtls.status == 'Delivered' ? 'button' : 'submit'}" ${orderDtls.status == 'Cancelled' || orderDtls.status == 'Delivered' ? 'disabled' : ''}>Update</button>
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="7" class="text-center">No order found with ID ${param.orderId}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <!-- Display all orders if no search -->
                                <c:if test="${not srch}">
                                    <c:forEach var="o" items="${orders}">
                                        <tr>
                                            <th scope="row">${o.orderId}</th>
                                            <td>
                                                <p><strong>Name:</strong> ${o.orderAddress.firstName} ${o.orderAddress.lastName}</p>
                                                <p><strong>Email:</strong> ${o.orderAddress.email}</p>
                                                <p><strong>Mobno:</strong> ${o.orderAddress.mobileNo}</p>
                                                <p><strong>Address:</strong> ${o.orderAddress.address}</p>
                                                <p><strong>City:</strong> ${o.orderAddress.city}</p>
                                                <p><strong>State:</strong> ${o.orderAddress.state}, ${o.orderAddress.pincode}</p>
                                            </td>
                                            <td>${o.orderDate}</td>
                                            <td>${o.product.title}</td>
                                            <td>
                                                <p><strong>Quantity:</strong> ${o.quantity}</p>
                                                <p><strong>Price:</strong> ${o.price}</p>
                                                <p><strong>Total Price:</strong> ${o.quantity * o.price}</p>
                                            </td>
                                            <td>${o.status}</td>
                                            <td>
                                                <form action="/admin/update-order-status" method="post">
                                                    <div class="input-group">
                                                        <select class="form-control" name="st">
                                                            <option>--select--</option>
                                                            <option value="1">In Progress</option>
                                                            <option value="2">Order Received</option>
                                                            <option value="3">Product Packed</option>
                                                            <option value="4">Out for Delivery</option>
                                                            <option value="5">Delivered</option>
                                                            <option value="6">Cancelled</option>
                                                        </select>
                                                        <input type="hidden" name="id" value="${o.id}">
                                                        <button class="btn btn-dark btn-sm" type="${o.status == 'Cancelled' || o.status == 'Delivered' ? 'button' : 'submit'}" ${o.status == 'Cancelled' || o.status == 'Delivered' ? 'disabled' : ''}>Update</button>
                                                    </div>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>

                        <!-- Pagination section -->
                        <c:if test="${not srch}">
                            <div class="row">
                                <div class="col-md-4 mb-3">Total Orders: ${totalElements}</div>
                                <div class="col-md-8">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li class="page-item ${isFirst ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/orders?pageNo=${pageNo-1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>

                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <li class="page-item ${pageNo+1 == i ? 'active' : ''}">
                                                    <a class="page-link" href="/admin/orders?pageNo=${i-1}">${i}</a>
                                                </li>
                                            </c:forEach>

                                            <li class="page-item ${isLast ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/orders?pageNo=${pageNo+1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </c:if>
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

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>