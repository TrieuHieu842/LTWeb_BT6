<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search Videos</title>
</head>
<body>
<h2>Search Videos</h2>

<form method="get" action="${pageContext.request.contextPath}/admin/videos/search">
    <input type="text" name="keyword" placeholder="Enter keyword..." value="${param.keyword}"/>
    <button type="submit">🔍 Search</button>
    <a href="${pageContext.request.contextPath}/admin/videos/list">Back to List</a>
</form>

<hr/>

<c:if test="${not empty videos}">
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
        <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Title</th>
            <th>Poster</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="video" items="${videos}">
            <tr>
                <td>${video.videoId}</td>
                <td>${video.videoCode}</td>
                <td>${video.title}</td>
                <td>
                    <c:if test="${not empty video.poster}">
                        <img src="${pageContext.request.contextPath}/uploads/${video.poster}" width="80"/>
                    </c:if>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${video.status}">Active</c:when>
                        <c:otherwise>Inactive</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/videos/edit/${video.videoId}">✏ Edit</a> |
                    <a href="${pageContext.request.contextPath}/admin/videos/delete/${video.videoId}"
                       onclick="return confirm('Are you sure to delete?')">🗑 Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty videos}">
    <p>No videos found.</p>
</c:if>

</body>
</html>
