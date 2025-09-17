<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Video List</title>
</head>
<body>
<h2>Video List</h2>

<a href="${pageContext.request.contextPath}/admin/videos/saveOrUpdate">➕ Add New Video</a> |
<a href="${pageContext.request.contextPath}/admin/videos/searchpaginated">🔍 Search Video</a>

<table border="1" cellpadding="5" cellspacing="0">
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

</body>
</html>
