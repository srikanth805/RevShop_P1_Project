
<%@include file="./base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>

        /* Global styling */
        body {
            background-color : #fff;
            background-size: cover;
            color: #ffffff;
            font-family: 'Arial', sans-serif;
            height: 100vh;
        }

        /* Custom hover and animation styles */
        .sidebar-card:hover {
            transform: translateX(10px);
            transition: transform 0.3s ease-in-out, background-color 0.3s;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .sidebar-card img {
            transition: transform 0.3s;
        }

        .sidebar-card:hover img {
            transform: scale(1.1);
        }

        .sidebar {
            background-color: #1F2937; /* Dark gray background for sidebar */
        }

        .sidebar-title {
            letter-spacing: 0.1rem;
        }
    </style>
</head>

<body class="">



    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <aside class="sidebar w-64 min-h-screen px-6 py-8 shadow-lg text-white flex flex-col">
            <p class="text-3xl font-bold sidebar-title mb-8">Admin Dashboard</p>

            <!-- Sidebar Menu Cards -->
            <div class="space-y-6 flex-grow">
                <a href="/admin/products" class="sidebar-card flex items-center p-4 rounded-lg bg-gray-800 shadow-lg hover:bg-gray-700">
                    <img src="/img/Images/prod.png" class="w-10 h-10 mr-4" alt="View Product">
                    <h4 class="text-xl font-semibold">View Product</h4>
                </a>

                <a href="/admin/add-admin" class="sidebar-card flex items-center p-4 rounded-lg bg-gray-800 shadow-lg hover:bg-gray-700">
                    <img src="/img/Images/admini.png" class="w-10 h-10 mr-4" alt="Add Admin">
                    <h4 class="text-xl font-semibold">Add Admin</h4>
                </a>

                <a href="/admin/users?type=2" class="sidebar-card flex items-center p-4 rounded-lg bg-gray-800 shadow-lg hover:bg-gray-700">
                    <img src="/img/Images/admin.png" class="w-10 h-10 mr-4" alt="Admin">
                    <h4 class="text-xl font-semibold">Admin</h4>
                </a>

                <a href="/admin/loadAddProduct" class="sidebar-card flex items-center p-4 rounded-lg bg-gray-800 shadow-lg hover:bg-gray-700">
                    <img src="/img/Images/Productsi.png" class="w-10 h-10 mr-4" alt="Add Product">
                    <h4 class="text-xl font-semibold">Add Product</h4>
                </a>

                <a href="/admin/category" class="sidebar-card flex items-center p-4 rounded-lg bg-gray-800 shadow-lg hover:bg-gray-700">
                    <img src="/img/Images/cat.png" class="w-10 h-10 mr-4" alt="Add Category">
                    <h4 class="text-xl font-semibold">Add Category</h4>
                </a>

                <a href="/admin/orders" class="sidebar-card flex items-center p-4 rounded-lg bg-gray-800 shadow-lg hover:bg-gray-700">
                    <img src="/img/Images/orderi.png" class="w-10 h-10 mr-4" alt="Orders">
                    <h4 class="text-xl font-semibold">Orders</h4>
                </a>

                <a href="/admin/users?type=1" class="sidebar-card flex items-center p-4 rounded-lg bg-gray-800 shadow-lg hover:bg-gray-700">
                    <img src="/img/Images/useri.png" class="w-10 h-10 mr-4" alt="Users">
                    <h4 class="text-xl font-semibold">Users</h4>
                </a>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="flex-1 p-10 bg-white shadow-lg rounded-lg">
            <div class="text-4xl font-bold text-gray-700 mb-5">
                Welcome to the Admin Dashboard
            </div>
            <p class="text-gray-600 mt-2">Use the sidebar to navigate the admin tools.</p>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-6">
                <!-- Card for Number of Users -->
                <div class="bg-white shadow-lg rounded-lg p-6 flex items-center">
                    <div class="flex-shrink-0">
                        <i class="fas fa-users text-blue-600 text-3xl"></i>
                    </div>
                    <div class="ml-4">
                        <h2 class="text-xl font-bold text-gray-700">Total Users</h2>
                        <p class="text-gray-600">1234</p> <!-- Replace with dynamic data -->
                    </div>
                </div>

                <!-- Card for Number of Admins -->
                <div class="bg-white shadow-lg rounded-lg p-6 flex items-center">
                    <div class="flex-shrink-0">
                        <i class="fas fa-user-shield text-green-600 text-3xl"></i>
                    </div>
                    <div class="ml-4">
                        <h2 class="text-xl font-bold text-gray-700">Total Admins</h2>
                        <p class="text-gray-600">56</p> <!-- Replace with dynamic data -->
                    </div>
                </div>

                <!-- Card for Number of Products -->
                <div class="bg-white shadow-lg rounded-lg p-6 flex items-center">
                    <div class="flex-shrink-0">
                        <i class="fas fa-box text-purple-600 text-3xl"></i>
                    </div>
                    <div class="ml-4">
                        <h2 class="text-xl font-bold text-gray-700">Total Products</h2>
                        <p class="text-gray-600">789</p> <!-- Replace with dynamic data -->
                    </div>
                </div>

                <!-- Card for Total Income -->
                <div class="bg-white shadow-lg rounded-lg p-6 flex items-center">
                    <div class="flex-shrink-0">
                        <i class="fas fa-dollar-sign text-yellow-600 text-3xl"></i>
                    </div>
                    <div class="ml-4">
                        <h2 class="text-xl font-bold text-gray-700">Total Income</h2>
                        <p class="text-gray-600">$12,345.67</p> <!-- Replace with dynamic data -->
                    </div>
                </div>

                <!-- Card for Total Orders -->
                <div class="bg-white shadow-lg rounded-lg p-6 flex items-center">
                    <div class="flex-shrink-0">
                        <i class="fas fa-shopping-cart text-red-600 text-3xl"></i>
                    </div>
                    <div class="ml-4">
                        <h2 class="text-xl font-bold text-gray-700">Total Orders</h2>
                        <p class="text-gray-600">345</p> <!-- Replace with dynamic data -->
                    </div>
                </div>

                <!-- Card for Total Revenue -->
                <div class="bg-white shadow-lg rounded-lg p-6 flex items-center">
                    <div class="flex-shrink-0">
                        <i class="fas fa-chart-line text-teal-600 text-3xl"></i>
                    </div>
                    <div class="ml-4">
                        <h2 class="text-xl font-bold text-gray-700">Total Revenue</h2>
                        <p class="text-gray-600">$15,678.90</p> <!-- Replace with dynamic data -->
                    </div>
                </div>
            </div>
        </main>

    </div>

</body>
</html>
