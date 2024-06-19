/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Package;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Muhammad Zulhilmi Bin Rosli S61807
 */
public class PackageDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/sasgym";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String SELECT_DROPDOWN = "SELECT packageDesc, price, packageID FROM package";
    private static final String INSERT_PACKAGE_SQL = "INSERT INTO package (packageID, packageDesc, price) VALUES (?, ?, ?)";
    private static final String SELECT_PACKAGE_BY_ID = "SELECT packageID, packageDesc, price from package where packageID=?";
    private static final String SELECT_ALL_PACKAGE = "SELECT * FROM package";
    private static final String DELETE_PACKAGE_SQL = "DELETE FROM package where packageID = ?";
    private static final String UPDATE_PACKAGE_SQL = "UPDATE package set packageID = ?, packageDesc = ?, price = ? where packageID = ?";

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

    public List<Package> DropDownList() {
        List<Package> DDL = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DROPDOWN);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String packageDesc = rs.getString("packageDesc");
                int price = Integer.parseInt(rs.getString("price"));
                String packageID = rs.getString("packageID");
                DDL.add(new Package(packageID, packageDesc, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return DDL;
    }

    public void insertPackage(Package pack) throws SQLException {
        System.out.println(INSERT_PACKAGE_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PACKAGE_SQL);) {

            preparedStatement.setString(1, pack.getPackageID());
            preparedStatement.setString(2, pack.getPackageDesc());
            preparedStatement.setInt(3, pack.getPrice());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Package selectPackage(String packageID) {
        Package pack = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PACKAGE_BY_ID);) {
            preparedStatement.setString(1, packageID);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String packageDesc = rs.getString("packageDesc");
                int price = rs.getInt("price");

                pack = new Package(packageID, packageDesc, price);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return pack;
    }

    public List<Package> selectAllPackage() {
        List<Package> pack = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PACKAGE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String packageID = rs.getString("packageID");
                String packageDesc = rs.getString("packageDesc");
                int price = rs.getInt("price");
                pack.add(new Package(packageID, packageDesc, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return pack;
    }

    public boolean deletePackage(String packageID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PACKAGE_SQL);) {
            preparedStatement.setString(1, packageID);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updatePack(Package pack) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PACKAGE_SQL);) {
            preparedStatement.setString(1, pack.getPackageID());
            preparedStatement.setString(2, pack.getPackageDesc());
            preparedStatement.setInt(3, pack.getPrice());
            preparedStatement.setString(4, pack.getPackageID());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
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
