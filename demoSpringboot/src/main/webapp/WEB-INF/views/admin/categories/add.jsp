<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add / Edit Category</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg rounded-4">
        <div class="card-header bg-primary text-white text-center">
            <h3 class="mb-0">
                <c:choose>
                    <c:when test="${empty category.id}">Add New Category</c:when>
                    <c:otherwise>Edit Category</c:otherwise>
                </c:choose>
            </h3>
        </div>
        <div class="card-body p-4">

            <form action="${pageContext.request.contextPath}/admin/categories/saveOrUpdate" method="post">
                <input type="hidden" name="id" value="${category.id}"/>

                <!-- Category Code -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Category Code</label>
                    <input type="text" class="form-control" name="categoryCode" 
                           value="${category.categoryCode}" placeholder="Enter category code">
                </div>

                <!-- Category Name -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Category Name</label>
                    <input type="text" class="form-control" name="categoryName" 
                           value="${category.categoryName}" placeholder="Enter category name">
                </div>

                <!-- Image -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Image</label>
                    <input type="text" class="form-control" name="images" 
                           value="${category.images}" placeholder="Image URL">
                </div>

                <!-- Status -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Status</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="status" value="true"
                               <c:if test="${category.status}">checked</c:if> >
                        <label class="form-check-label">Active</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="status" value="false"
                               <c:if test="${!category.status}">checked</c:if> >
                        <label class="form-check-label">Inactive</label>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between">
                    <a href="${pageContext.request.contextPath}/admin/categories/list" class="btn btn-secondary">
                        ⬅ Back
                    </a>
                    <button type="submit" class="btn btn-success">
                        💾 Save
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
