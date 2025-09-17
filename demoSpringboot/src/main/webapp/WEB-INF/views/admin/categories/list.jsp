<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Category List</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .table img {
            border-radius: 6px;
        }
        .action-links a {
            margin: 0 5px;
        }
    </style>
</head>
<body class="container py-4">

    <h2 class="mb-4 text-center">Category List</h2>

    <!-- Nút thêm mới -->
    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/admin/categories/saveOrUpdate"
           class="btn btn-success">Add New Category</a>
    </div>

    <!-- Form search -->
    <form action="${pageContext.request.contextPath}/admin/categories/search"
          method="get" class="row g-2 mb-4">
        <div class="col-md-6">
            <input type="text" name="name" value="${name}" class="form-control"
                   placeholder="Nhập từ khóa..." />
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-primary w-100">🔍 Search</button>
        </div>
    </form>

    <!-- Bảng hiển thị -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Status</th>
                    <th width="160px">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cat" items="${categories}">
                    <tr>
                        <td class="text-center">${cat.id}</td>
                        <td>${cat.categoryCode}</td>
                        <td>${cat.categoryName}</td>
                        <td class="text-center">
                            <c:if test="${not empty cat.images}">
                                <img src="${pageContext.request.contextPath}/uploads/${cat.images}"
                                     width="80" class="img-thumbnail" />
                            </c:if>
                        </td>
                        <td class="text-center">
                            <span class="badge ${cat.status ? 'bg-success' : 'bg-secondary'}">
                                <c:choose>
                                    <c:when test="${cat.status}">Active</c:when>
                                    <c:otherwise>Inactive</c:otherwise>
                                </c:choose>
                            </span>
                        </td>
                        <td class="text-center action-links">
                            <a href="${pageContext.request.contextPath}/admin/categories/edit/${cat.id}"
                               class="btn btn-sm btn-info">Edit</a>
                            <a href="${pageContext.request.contextPath}/admin/categories/delete/${cat.id}"
                               onclick="return confirm('Are you sure to delete?')"
                               class="btn btn-sm btn-info">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Phân trang (giữ nguyên logic cũ của bạn) -->
    <div class="pagination">
        <c:if test="${currentPage > 0}">
            <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${currentPage - 1}&size=5">Previous</a>
        </c:if>

        <c:if test="${totalPages > 0}">
            <div class="pagination">
                <c:if test="${currentPage > 0}">
                    <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${currentPage - 1}&size=5">Previous</a>
                </c:if>

                <c:forEach var="i" begin="0" end="${totalPages - 1}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current">${i + 1}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${i}&size=5">${i + 1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage + 1 < totalPages}">
                    <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${currentPage + 1}&size=5">Next</a>
                </c:if>
            </div>
        </c:if>

        <c:if test="${currentPage + 1 < totalPages}">
            <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${currentPage + 1}&size=5">Next</a>
        </c:if>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
