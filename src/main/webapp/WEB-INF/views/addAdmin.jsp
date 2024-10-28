<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>
       .container {
           position: relative;
           z-index: 2;
           margin-top: 5rem;
           max-width: 900px;
           background-color: rgba(255, 255, 255, 0.9);
           padding: 2rem;
           border-radius: 20px;
           box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
           backdrop-filter: blur(10px);
           transition: transform 0.3s ease, box-shadow 0.3s ease;
       }

       .container:hover {
           transform: translateY(-10px);
           box-shadow: 0px 15px 40px rgba(0, 0, 0, 0.2);
       }

       .card-header {
           background-color: #ff7f50;
           color: #fff;
           font-weight: bold;
           text-align: center;
           font-size: 1.8rem;
           padding: 1rem;
           border-radius: 15px 15px 0 0;
           letter-spacing: 1.2px;
           box-shadow: inset 0 -5px 10px rgba(0, 0, 0, 0.1);
       }

       .card-body {
           padding: 2rem;
           color: #333;
           font-size: 1.1rem;
           line-height: 1.6;
       }

       .form-label {
           font-weight: bold;
           color: #475c6c;
           letter-spacing: 0.5px;
       }

       .form-control {
           background-color: rgba(255, 255, 255, 0.95);
           border: 1px solid #ddd;
           color: #333;
           padding: 0.75rem;
           border-radius: 5px;
           transition: border-color 0.2s ease, box-shadow 0.2s ease;
       }

       .form-control:focus {
           border-color: #ff7f50;
           outline: none;
           box-shadow: 0 0 8px rgba(255, 127, 80, 0.5);
       }

       .btn-primary {
           background-color: #ff7f50;
           border: none;
           padding: 0.75rem 1.5rem;
           font-size: 1.1rem;
           font-weight: bold;
           color: #fff;
           border-radius: 10px;
           width: 100%;
           transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
       }

       .btn-primary:hover {
           background-color: #e56e42;
           box-shadow: 0px 10px 20px rgba(255, 127, 80, 0.3);
           transform: translateY(-5px);
       }

       .text-success, .text-danger {
           font-weight: bold;
           font-size: 1rem;
       }

       /* Responsive Design */
       @media (max-width: 768px) {
           .container {
               padding: 1.5rem;
           }
       }
   </style>

</head>
<body>
    <div class="overlay"></div>

    <section>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            Add Admin
                        </div>
                        <div class="card-body">
                            <% 
                                String succMsg = (String) session.getAttribute("succMsg");
                                String errorMsg = (String) session.getAttribute("errorMsg");
                                if (succMsg != null) {
                            %>
                                <p class="text-success" id="success-alert"><%= succMsg %></p>
                                <% session.removeAttribute("succMsg"); %>
                            <% 
                                }
                                if (errorMsg != null) {
                            %>
                                <p class="text-danger" id="error-alert"><%= errorMsg %></p>
                                <% session.removeAttribute("errorMsg"); %>
                            <% 
                                } 
                            %>

                            <form action="<c:url value='/admin/save-admin' />" method="post" enctype="multipart/form-data">
                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">Full Name</label>
                                        <input required class="form-control" name="name" type="text">
                                    </div>

                                    <div class="col">
                                        <label class="form-label">Mobile Number</label>
                                        <input required class="form-control" name="mobileNumber" type="number">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input required class="form-control" name="email" type="email">
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">Address</label>
                                        <input required class="form-control" name="address" type="text">
                                    </div>

                                    <div class="col">
                                        <label class="form-label">City</label>
                                        <input required class="form-control" name="city" type="text">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">State</label>
                                        <input required class="form-control" name="state" type="text">
                                    </div>

                                    <div class="col">
                                        <label class="form-label">Pincode</label>
                                        <input required class="form-control" name="pincode" type="number">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">Password</label>
                                        <input required class="form-control" name="password" type="password">
                                    </div>
                                    <div class="col">
                                        <label class="form-label">Confirm Password</label>
                                        <input required class="form-control" name="cpassword" type="password">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Profile Image</label>
                                    <input class="form-control" name="img" type="file">
                                </div>

                                <button type="submit" class="btn btn-primary">Register</button>
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
</body>
</html>