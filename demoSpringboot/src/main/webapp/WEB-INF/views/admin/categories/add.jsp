<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add / Edit Category</title>
</head>
<body>
<h2>
    <c:choose>
        <c:when test="${empty category.id}">Add New Category</c:when>
        <c:otherwise>Edit Category</c:otherwise>
    </c:choose>
</h2>

<form action="${pageContext.request.contextPath}/admin/categories/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${category.id}"/>

    <table>
        <tr>
            <td>Category Code:</td>
            <td><input type="text" name="categoryCode" value="${category.categoryCode}"/></td>
        </tr>
        <tr>
            <td>Category Name:</td>
            <td><input type="text" name="categoryName" value="${category.categoryName}"/></td>
        </tr>
        <tr>
            <td>Image:</td>
            <td><input type="text" name="images" value="${category.images}"/></td>
        </tr>
        <tr>
            <td>Status:</td>
            <td>
                <input type="radio" name="status" value="true" <c:if test="${category.status}">checked</c:if>/> Active
                <input type="radio" name="status" value="false" <c:if test="${!category.status}">checked</c:if>/> Inactive
            </td>
        </tr>
    </table>

    <button type="submit">💾 Save</button>
    <a href="${pageContext.request.contextPath}/admin/categories/list">⬅ Back</a>
</form>

</body>
</html>
