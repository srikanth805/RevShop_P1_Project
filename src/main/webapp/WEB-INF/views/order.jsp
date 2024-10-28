<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="./base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f7fa;
        color: #4a5568;
    }

    .container {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        padding: 2rem;
        max-width: 900px;
        margin: auto;
    }

    p.fs-4 {
        font-size: 1.75rem;
        color: #1a202c;
        font-weight: 600;
        text-align: center;
    }

    label {
        font-size: 0.875rem;
        color: #4a5568;
        font-weight: 500;
    }

    input, select {
        width: 100%;
        padding: 0.75rem;
        margin-top: 0.5rem;
        border-radius: 8px;
        border: 1px solid #e2e8f0;
        transition: all 0.3s ease;
        font-size: 1rem;
        background-color: #f7fafc;
    }

    input:focus, select:focus {
        outline: none;
        border-color: #3182ce;
        box-shadow: 0 0 0 2px rgba(66, 153, 225, 0.4);
        background-color: #ffffff;
    }

    .btn {
        display: inline-block;
        padding: 0.75rem 1.5rem;
        font-size: 1rem;
        font-weight: 600;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }

    .bg-primary {
        background-color: #3182ce;
        color: white;
    }

    .bg-primary:hover {
        background-color: #2b6cb0;
    }

    .table-borderless td {
        padding: 0.75rem;
        color: #2d3748;
    }

    .table-borderless tr.border-top td {
        border-top: 2px solid #3182ce;
        font-weight: 700;
        font-size: 1.125rem;
    }

    .card {
        border: none;
        background-color: #edf2f7;
        border-radius: 8px;
    }

    .card-body {
        padding: 1.5rem;
        background-color: white;
        border-radius: 8px;
        transition: box-shadow 0.3s ease;
    }

    .card-body:hover {
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }

    @media (max-width: 768px) {
        .col-md-6 {
            width: 100%;
            margin-bottom: 1.5rem;
        }
    }
</style>

</head>
<body>
    <section>
        <div class="container mt-5 p-5">
            <form action="${pageContext.request.contextPath}/user/save-order" method="post" id="orders" onsubmit="return validateForm();" novalidate>
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <p class="text-center fs-4">Billing Address</p>
                            <hr>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="firstName">First Name</label>
                                    <input type="text" id="firstName" name="firstName" required class="form-control mt-1">
                                </div>
                                <div class="col p-1">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" id="lastName" name="lastName" required class="form-control mt-1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" required class="form-control">
                                </div>
                                <div class="col p-1">
                                    <label for="mobileNo">Mobile Number</label>
                                    <input type="text" id="mobileNo" name="mobileNo" required class="form-control ms-2">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="address">Address</label>
                                    <input type="text" id="address" name="address" required class="form-control">
                                </div>
                                <div class="col p-1">
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" required class="form-control ms-2">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="state">State</label>
                                    <input type="text" id="state" name="state" required class="form-control">
                                </div>
                                <div class="col p-1">
                                    <label for="pincode">Pincode</label>
                                    <input type="number" id="pincode" name="pincode" required class="form-control ms-2">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <p class="text-center fs-4">Payment Type</p>
                        <hr>
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td>Price</td>
                                            <td>:</td>
                                            <td>&#8377; ${orderPrice}</td>
                                        </tr>
                                        <tr>
                                            <td>Delivery Fee</td>
                                            <td>:</td>
                                            <td>&#8377; 39</td>
                                        </tr>
                                        <tr>
                                            <td>Tax</td>
                                            <td>:</td>
                                            <td>&#8377; 20</td>
                                        </tr>
                                        <tr class="border-top">
                                            <td>Total Price</td>
                                            <td>:</td>
                                            <td>&#8377; ${totalOrderPrice}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="card shadow p-3 mb-5 mt-2 bg-body-tertiary rounded">
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="paymentType" class="form-label">Select Payment Type</label>
                                    <select required id="paymentType" name="paymentType" class="form-control">
                                        <option value="">--select--</option>
                                        <option value="COD">Cash On Delivery</option>
                                        <option value="ONLINE">Online Payment</option>
                                    </select>
                                </div>
                                <button type="button" id="razorpay-button" class="btn bg-primary text-white col-md-12" style="display:none;">Pay with Razorpay</button>
                                <button type="submit" id="place-order" class="btn bg-primary text-white col-md-12">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <script type="text/javascript">
    // Show or hide Razorpay button based on payment type selection
    document.getElementById('paymentType').addEventListener('change', function () {
        const paymentType = this.value;
        const razorpayButton = document.getElementById('razorpay-button');
        const placeOrderButton = document.getElementById('place-order');

        if (paymentType === 'ONLINE') {
            razorpayButton.style.display = 'block';
            placeOrderButton.style.display = 'none';
        } else {
            razorpayButton.style.display = 'none';
            placeOrderButton.style.display = 'block';
        }
    });

    // Trigger Razorpay Checkout
    document.getElementById('razorpay-button').addEventListener('click', function (e) {
        e.preventDefault();

        const totalOrderPrice = ${totalOrderPrice};  // Ensure this is a valid number
        const options = {
            "key": "rzp_test_kOZuSgBkSmpz5o",  // Replace with your Razorpay Key ID
            "amount": totalOrderPrice * 100,  // Razorpay accepts amount in paise (multiply by 100)
            "currency": "INR",
            "name": "E-Commerce Website",
            "description": "Order Payment",
            "handler": function (response) {
                // After payment is successful, submit form with Razorpay response ID
                const form = document.getElementById('orders');
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'razorpayPaymentId';
                input.value = response.razorpay_payment_id;
                form.appendChild(input);
                form.submit();
            },
            "prefill": {
                "name": document.getElementsByName('firstName')[0].value + ' ' + document.getElementsByName('lastName')[0].value,
                "email": document.getElementsByName('email')[0].value,
                "contact": document.getElementsByName('mobileNo')[0].value
            },
            "theme": {
                "color": "#3399cc"
            }
        };

        const rzp1 = new Razorpay(options);
        rzp1.open();
    });
    </script>
    <script>
function validateForm() {
    const mobile = document.getElementById("mobileNo").value;
    const email = document.getElementById("email").value;
    const pincode = document.getElementById("pincode").value;

    // Regular expressions for validation
    const mobileRegex = /^[0-9]{10}$/;
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const pincodeRegex = /^[0-9]{6}$/;
    }

    // Validate mobile number
    if (!mobileRegex.test(mobile)) {
        alert("Please enter a valid 10-digit mobile number.");
        return false;
    }

    // Validate email
    if (!emailRegex.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    // Validate pincode
    if (!pincodeRegex.test(pincode)) {
        alert("Please enter a valid 6-digit pincode.");
        return false;
    }
    
    

    return true; // If all validations pass
}
</script>
</body>
</html>
