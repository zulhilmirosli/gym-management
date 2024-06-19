package com.DAO;

import com.Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Muhamad Syahmi S62602
 */
public class UserDAO {
    

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/sasgym";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (username,password,name,age,gender,phoneNo) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT id, name, age, gender, phoneNo from users where id=?";
    private static final String SELECT_ALL_USERS = "SELECT id, name, age, gender, phoneNo from users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users where id = ?";
    private static final String UPDATE_USERS_SQL = "UPDATE users set name = ?, age = ?, gender = ?, phoneNo = ? where id = ?";
    private static final String SEARCH_USERS = "SELECT id, name, age, gender, phoneNo from users where name=? or age=?";

    public UserDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(4, user.getAge());
            preparedStatement.setString(5, user.getGender());
            preparedStatement.setString(6, user.getPhoneNo());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
        User user = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String age = rs.getString("age");
                String gender = rs.getString("gender");
                String phoneNo = rs.getString("phoneNo");
                user = new User(id, name, age, gender, phoneNo);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String age = rs.getString("age");
                String gender = rs.getString("gender");
                String phoneNo = rs.getString("phoneNo");
                users.add(new User(id, name, age, gender, phoneNo));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getAge());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setString(4, user.getPhoneNo());
            preparedStatement.setInt(5, user.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public List<User> searchUser(String name, String age) {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_USERS);) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, age);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                name = rs.getString("name");
                age = rs.getString("age");
                String gender = rs.getString("gender");
                String phoneNo = rs.getString("phoneNo");
                users.add(new User(id, name, age, gender, phoneNo));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.out.println("SQLState : " + ((SQLException) e).getSQLState());
                System.out.println("Error Code : " + ((SQLException) e).getErrorCode());
                System.out.println("Message : " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
