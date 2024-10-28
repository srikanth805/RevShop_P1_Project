<%@ page isErrorPage="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white shadow-lg rounded-lg p-8 max-w-md text-center fade-in">
        <h1 class="text-2xl font-bold text-red-600 mb-4">Oops! Something went wrong.</h1>
        <p class="text-gray-700 mb-6">We're sorry, but an error has occurred. Please try again later or contact support if the issue persists.</p>

        <!-- Display error details if available -->
        <c:if test="${not empty exception}">
            <div class="bg-gray-100 border-l-4 border-red-600 text-red-600 p-4 mb-6">
                <h3 class="font-semibold">Error Details:</h3>
                <p><strong>${exception.message}</strong></p>
            </div>
        </c:if>

        <a href="<%= request.getContextPath() %>/" class="inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300">Go Back to Home</a>
    </div>

    <script src="<%= request.getContextPath() %>/js/script.js"></script>
</body>
</html>
