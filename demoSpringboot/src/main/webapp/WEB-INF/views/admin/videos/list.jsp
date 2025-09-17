<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Video List</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold">🎬 Video List</h2>
        <div>
            <a href="${pageContext.request.contextPath}/admin/videos/saveOrUpdate" class="btn btn-primary btn-sm">
                ➕ Add New Video
            </a>
            <a href="${pageContext.request.contextPath}/admin/videos/searchpaginated" class="btn btn-info btn-sm">
                🔍 Search Video
            </a>
        </div>
    </div>

    <!-- Video Table -->
    <div class="card shadow-lg rounded-4">
        <div class="card-body">
            <table class="table table-hover align-middle">
                <thead class="table-dark text-center">
                <tr>
                    <th scope="col">#ID</th>
                    <th scope="col">Title</th>
                    <th scope="col">Description</th>
                    <th scope="col">Poster</th>
                    <th scope="col">Status</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody class="text-center">
                <c:forEach var="v" items="${videos}">
                    <tr>
                        <td>${v.videoId}</td>
                        <td class="fw-bold">${v.title}</td>
                        <td class="text-truncate" style="max-width: 300px;">${v.description}</td>
                        <td>
                            <c:if test="${not empty v.poster}">
                                <img src="${pageContext.request.contextPath}/uploads/${v.poster}" 
                                     class="img-thumbnail" style="width: 120px; height: auto;">
                            </c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${v.active}">
                                    <span class="badge bg-success">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">Inactive</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/videos/edit/${v.videoId}" 
                               class="btn btn-info btn-sm">Edit</a>
                            <a href="${pageContext.request.contextPath}/admin/videos/delete/${v.videoId}" 
                               class="btn btn-info btn-sm"
                               onclick="return confirm('Are you sure to delete this video?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Paging -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:if test="${page > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${page - 1}">⬅ Previous</a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item <c:if test='${i == page}'>active</c:if>'">
                            <a class="page-link" href="?page=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${page < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${page + 1}">Next ➡</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
