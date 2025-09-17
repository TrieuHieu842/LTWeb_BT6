<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search Category</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .pagination {
            margin-top: 15px;
        }
        .pagination a, .pagination span {
            display: inline-block;
            padding: 5px 10px;
            margin: 2px;
            border: 1px solid #ccc;
            text-decoration: none;
        }
        .pagination .current {
            font-weight: bold;
            background-color: #eee;
        }
    </style>
</head>
<body>
<h2>Search Category (Paginated)</h2>

<!-- Form search -->
<form action="${pageContext.request.contextPath}/admin/categories/searchpaginated" method="get">
    <input type="text" name="name" value="${name}" placeholder="Nhập từ khóa..."/>
    <button type="submit">🔍 Search</button>
</form>

<!-- Hiển thị kết quả -->
<c:choose>
    <c:when test="${not empty categories}">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Code</th>
                <th>Name</th>
                <th>Image</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cat" items="${categories}">
                <tr>
                    <td>${cat.id}</td>
                    <td>${cat.categoryCode}</td>
                    <td>${cat.categoryName}</td>
                    <td>
                        <c:if test="${not empty cat.images}">
                            <img src="${pageContext.request.contextPath}/uploads/${cat.images}" width="80"/>
                        </c:if>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${cat.status}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/categories/edit/${cat.id}">✏ Edit</a> |
                        <a href="${pageContext.request.contextPath}/admin/categories/delete/${cat.id}"
                           onclick="return confirm('Are you sure to delete?')">🗑 Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <c:if test="${totalPages > 1}">
            <div class="pagination">
                <c:if test="${currentPage > 0}">
                    <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${currentPage - 1}&size=3">Previous</a>
                </c:if>

                <c:forEach var="i" begin="0" end="${totalPages - 1}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current">${i + 1}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${i}&size=3">${i + 1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage + 1 < totalPages}">
                    <a href="${pageContext.request.contextPath}/admin/categories/searchpaginated?name=${name}&page=${currentPage + 1}&size=5">Next</a>
                </c:if>
            </div>
        </c:if>
    </c:when>

    <c:otherwise>
        <p><i>Không tìm thấy kết quả nào.</i></p>
    </c:otherwise>
</c:choose>

<p><a href="${pageContext.request.contextPath}/admin/categories/list">⬅ Back to full list</a></p>

</body>
</html>
