<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Category</title>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
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
        input[type="text"] {
            padding: 6px;
            width: 200px;
        }
        button {
            padding: 6px 12px;
        }
    </style>
</head>
<body>
<h2>Search Category</h2>

<form action="${pageContext.request.contextPath}/admin/categories/search" method="get">
    <input type="text" name="keyword" value="${keyword}" placeholder="Nhập từ khóa...">
    <button type="submit">Search</button>
</form>

<c:choose>
    <c:when test="${not empty categories}">
        <h3>Results:</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="c" items="${categories}">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.categoryName}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/categories/edit/${c.id}">Edit</a>
                        |
                        <a href="${pageContext.request.contextPath}/admin/categories/delete/${c.id}?keyword=${fn:escapeXml(keyword)}"
                           onclick="return confirm('Bạn có chắc muốn xóa?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p><i>No category found.</i></p>
    </c:otherwise>
</c:choose>

<p><a href="${pageContext.request.contextPath}/admin/categories/list">Back to full list</a></p>

</body>
</html>
