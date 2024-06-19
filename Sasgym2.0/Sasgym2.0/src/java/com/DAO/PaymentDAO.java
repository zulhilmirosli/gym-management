/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Payment;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Muhammad Ariq Iskandar S62678
 */
public class PaymentDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/sasgym";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_PAYMENT = "INSERT INTO payment (subsNo, cardNumber, expiry, cvv_cvc, amount) VALUES (?, ?, ?, ?, ?)";

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
    
    public void insertPayment(Payment payment) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT);) {
            preparedStatement.setInt(1, payment.getSubsID());
            preparedStatement.setString(2, payment.getCard_number());
            preparedStatement.setString(3, payment.getExpiry());
            preparedStatement.setString(4, payment.getCvv_cvc());
            preparedStatement.setInt(5, payment.getAmount());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
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
