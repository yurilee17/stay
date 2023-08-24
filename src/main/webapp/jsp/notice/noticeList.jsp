<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
</head>
<body>
    <h1></h1>
    <ul>
        <%
        try {
            String jdbcUrl = "jdbc:oracle:thin:@//localhost:1521/XE";
            String username = "oracle";
            String password = "oracle";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);

            Statement statement = connection.createStatement();
            String query = "SELECT * FROM noticeForm";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                String noticeTitle = resultSet.getString("ntitle");
                String noticeDate = resultSet.getString("ndate");
        %>
        <li>
            <strong><%= noticeTitle %></strong> (<%= noticeDate %>)
        </li>
        <%
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </ul>
</body>
</html>