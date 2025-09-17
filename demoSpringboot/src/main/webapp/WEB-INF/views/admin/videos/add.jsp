<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add / Edit Video</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #2c3e50;
        }
        form {
            background: #fff;
            padding: 20px;
            width: 600px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
            height: 80px;
        }
        .form-actions {
            text-align: center;
            margin-top: 15px;
        }
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            background: #3498db;
            color: #fff;
            font-size: 15px;
            cursor: pointer;
        }
        button:hover {
            background: #2980b9;
        }
        .back-link {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #555;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">Add / Edit Video</h2>

<form action="${pageContext.request.contextPath}/admin/videos/saveOrUpdate" method="post">
    <!-- hidden id để update -->
    <input type="hidden" name="videoId" value="${video.videoId}"/>
    <table>
        <tr>
            <td><label>Title:</label></td>
            <td><input type="text" name="title" value="${video.title}" required/></td>
        </tr>
        <tr>
            <td><label>Description:</label></td>
            <td><textarea name="description" required>${video.description}</textarea></td>
        </tr>
        <tr>
            <td><label>Poster URL:</label></td>
            <td><input type="text" name="poster" value="${video.poster}"/></td>
        </tr>
        <tr>
            <td><label>Category:</label></td>
            <td>
                <select name="category.id" required>
                    <option value="">-- Chọn Category --</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}"
                            <c:if test="${video.category != null && video.category.id == cat.id}">selected</c:if>>
                            ${cat.categoryName}
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>👁 Views:</label></td>
            <td><input type="text" name="views" value="${video.views != null ? video.views : 0}"/></td>
        </tr>
        <tr>
            <td><label>Active:</label></td>
            <td>
                <!-- trick: unchecked checkbox sẽ không gửi => thêm hidden để luôn có value -->
                <input type="hidden" name="active" value="false"/>
                <input type="checkbox" name="active" value="true" <c:if test="${video.active}">checked</c:if>/>
                <span>Hiển thị</span>
            </td>
        </tr>
    </table>

    <div class="form-actions">
        <button type="submit">💾 Save</button>
    </div>
</form>

<div style="text-align:center;">
    <a href="${pageContext.request.contextPath}/admin/videos/list" class="back-link">⬅ Back to Video List</a>
</div>

</body>
</html>
