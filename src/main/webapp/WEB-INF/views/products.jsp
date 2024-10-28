<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        /* Body background image */
        body {
            background-color : #fff;
            background-size: cover;
            color: #f8f9fa;
        }

        /* Style for the div container inside section */
        section div.container-fluid {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            padding: 30px;
            margin: 20px auto;
            animation: fadeInUp 0.7s ease-out;
            max-width: 1200px;
        }

        /* Keyframes for fadeInUp animation */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Table hover effect */
        .table tbody tr:hover {
            background-color: #f0f4f8;
            transition: background-color 0.3s ease;
        }
    </style>
</head>
<body>
    <section>
        <div class="container-fluid p-8 bg-white rounded-lg shadow-lg">
            <div class="row">
                <p class="text-center text-3xl font-extrabold text-gray-800 mt-4">All Products</p>
                <hr class="border-t-2 border-indigo-500 my-4">

                <a href="${pageContext.request.contextPath}/admin/" class="text-indigo-500 hover:underline flex items-center">
                    <i class="fa-solid fa-arrow-left mr-2"></i> Back
                </a>

                <% if (session.getAttribute("succMsg") != null) { %>
                    <p class="text-green-600 font-semibold mt-4"><%= session.getAttribute("succMsg") %></p>
                    <% session.removeAttribute("succMsg"); %>
                <% } %>

                <% if (session.getAttribute("errorMsg") != null) { %>
                    <p class="text-red-600 font-semibold mt-4"><%= session.getAttribute("errorMsg") %></p>
                    <% session.removeAttribute("errorMsg"); %>
                <% } %>

                <div class="w-full md:w-1/3 p-3">
                    <form action="${pageContext.request.contextPath}/admin/products" method="get" class="flex">
                        <input type="text" class="form-control w-full p-2 border border-indigo-300 focus:outline-none focus:ring-2 focus:ring-indigo-500" name="ch" placeholder="Search products">
                        <button class="ml-2 bg-indigo-600 hover:bg-indigo-500 text-white py-2 px-4 rounded">Search</button>
                    </form>
                </div>

                <div class="w-full overflow-auto p-3">
                    <table class="table-auto w-full text-left border-collapse">
                        <thead class="bg-indigo-600 text-white">
                            <tr>
                                <th class="p-4">Sl No</th>
                                <th class="p-4">Image</th>
                                <th class="p-4">Title</th>
                                <th class="p-4">Type</th>
                                <th class="p-4">Category</th>
                                <th class="p-4">Sub-Category</th>
                                <th class="p-4">Price</th>
                                <th class="p-4">Size</th>
                                <th class="p-4">Discount</th>
                                <th class="p-4">Discount Price</th>
                                <th class="p-4">Status</th>
                                <th class="p-4">Stock</th>
                                <th class="p-4">Action</th>
                            </tr>
                        </thead>
                        <tbody class="text-indigo-400 font-bold">
                            <c:forEach var="p" items="${products}" varStatus="c">
                                <tr class="border-b border-gray-200">
                                    <td class="p-4"><c:out value="${c.index + 1}"/></td>
                                    <td class="p-4"><img src="${pageContext.request.contextPath}/img/product_img/${p.image}" class="w-16 h-16 rounded-md"></td>
                                    <td class="p-4"><c:out value="${p.title}"/></td>
                                    <td class="p-4"><c:out value="${p.type}"/></td>
                                    <td class="p-4"><c:out value="${p.category}"/></td>
                                    <td class="p-4"><c:out value="${p.subCategory}"/></td>
                                    <td class="p-4"><c:out value="${p.price}"/></td>
                                    <td class="p-4"><c:out value="${p.size}"/></td>
                                    <td class="p-4"><c:out value="${p.discount}"/></td>
                                    <td class="p-4"><c:out value="${p.discountPrice}"/></td>
                                    <td class="p-4"><c:out value="${p.isActive}"/></td>
                                    <td class="p-4"><c:out value="${p.stock}"/></td>
                                    <td class="p-4 flex">
                                        <a href="${pageContext.request.contextPath}/admin/editProduct/${p.id}" class="bg-blue-500 hover:bg-blue-400 text-white py-1 px-3 rounded mr-2">
                                            <i class="fa-solid fa-pen-to-square"></i> Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/deleteProduct/${p.id}" class="bg-red-500 hover:bg-red-400 text-white py-1 px-3 rounded">
                                            <i class="fa-solid fa-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="row mt-4">
                    <div class="col-md-4">Total Products: <c:out value="${totalElements}"/></div>
                    <div class="col-md-6">
                        <nav>
                            <ul class="pagination">
                                <li class="page-item <c:if test='${isFirst}'>disabled</c:if>">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${pageNo - 1}">
                                        &laquo;
                                    </a>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item <c:if test='${pageNo + 1 == i}'>active</c:if>">
                                        <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${i - 1}">
                                            <c:out value="${i}"/>
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="page-item <c:if test='${isLast}'>disabled</c:if>">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${pageNo + 1}">
                                        &raquo;
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
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
        }, 2000);
    </script>
</body>
</html>
