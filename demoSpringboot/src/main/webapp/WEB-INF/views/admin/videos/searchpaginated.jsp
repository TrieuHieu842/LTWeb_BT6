<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search Videos</title>
    <style>
        table {
            border-collapse: collapse;
            width: 90%;
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
<h2>Search Video (Paginated)</h2>

<!-- Form search -->
<form action="${pageContext.request.contextPath}/admin/videos/searchpaginated" method="get">
    <input type="text" name="keyword" value="${keyword}" placeholder="Nhập từ khóa..."/>
    <button type="submit">🔍 Search</button>
</form>

<c:choose>
    <c:when test="${not empty videos}">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Poster</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="v" items="${videos}">
                <tr>
                    <td>${v.videoId}</td>
                    <td>${v.title}</td>
                    <td>${v.description}</td>
                    <td>
                        <c:if test="${not empty v.poster}">
                            <img src="${pageContext.request.contextPath}/uploads/${v.poster}" width="120"/>
                        </c:if>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${v.active}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/videos/edit/${v.videoId}">✏ Edit</a> |
                        <a href="${pageContext.request.contextPath}/admin/videos/delete/${v.videoId}"
                           onclick="return confirm('Are you sure to delete this video?')">🗑 Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <c:if test="${totalPages > 1}">
            <div class="pagination">
                <c:if test="${currentPage > 0}">
                    <a href="${pageContext.request.contextPath}/admin/videos/searchpaginated?keyword=${keyword}&page=${currentPage - 1}&size=3">Previous</a>
                </c:if>

                <c:forEach var="i" begin="0" end="${totalPages - 1}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current">${i + 1}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/admin/videos/searchpaginated?keyword=${keyword}&page=${i}&size=3">${i + 1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage + 1 < totalPages}">
                    <a href="${pageContext.request.contextPath}/admin/videos/searchpaginated?keyword=${keyword}&page=${currentPage + 1}&size=3">Next</a>
                </c:if>
            </div>
        </c:if>
    </c:when>

    <c:otherwise>
        <p><i>No video found.</i></p>
    </c:otherwise>
</c:choose>

<p><a href="${pageContext.request.contextPath}/admin/videos/list">⬅ Back to full list</a></p>

</body>
</html>
