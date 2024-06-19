package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Clientsubs;

/**
 *
 * @author Muhammad Zulhilmi Bin Rosli S61807
 */
public class ClientsubsDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/sasgym";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_CLIENTSUBS_SQL = "INSERT INTO client_subs (id, packageID, packageDesc, bookingDate) VALUES (?, ?, ?, ?)";
    private static final String SELECT_CLIENTSUBS_ID = "SELECT subsNo, id, packageID, packageDesc, bookingDate from client_subs where subsNo=?";
    private static final String SELECT_ALL_CLIENTSUBS = "SELECT * FROM client_subs";
    private static final String DELETE_CLIENTSUBS_SQL = "DELETE FROM client_subs where subsNo = ?";
    private static final String UPDATE_CLIENTSUBS_SQL = "UPDATE client_subs set id = ?, packageID = ?, packageDesc = ?, bookingDate = ? where subsNo = ?";
    private static final String SELECT_FROM2TABLE = "select subsNo,client_subs.id, name, client_package, age, gender, bookingDate from client_subs,user_ where client_subs.id=users.id";
    private static final String SELECT_SUBS_ID = "SELECT subsNo, id, packageID, packageDesc, bookingDate from client_subs where id=?";

    public ClientsubsDAO() {
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

    public void insertClientsubs(Clientsubs clientsubs) throws SQLException {
        System.out.println(INSERT_CLIENTSUBS_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CLIENTSUBS_SQL);) {

            preparedStatement.setInt(1, clientsubs.getId());
            preparedStatement.setString(2, clientsubs.getPackageID());
            preparedStatement.setString(3, clientsubs.getPackageDesc());
            preparedStatement.setString(4, clientsubs.getBookingDate());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Clientsubs selectClientsubs(int subsNo) {
        Clientsubs clientsubs = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLIENTSUBS_ID);) {
            preparedStatement.setInt(1, subsNo);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String packageID = rs.getString("packageID");
                String packageDesc = rs.getString("packageDesc");
                String bookingDate = rs.getString("bookingDate");
                clientsubs = new Clientsubs(subsNo, id, packageID, packageDesc, bookingDate);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return clientsubs;
    }

    public List<Clientsubs> selectAllClientSubs() {
        List<Clientsubs> clientsubs = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CLIENTSUBS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int subsNo = rs.getInt("subsNo");
                int id = Integer.parseInt(rs.getString("id"));
                String packageID = rs.getString("packageID");
                String packageDesc = rs.getString("packageDesc");
                String bookingDate = rs.getString("bookingDate");

                clientsubs.add(new Clientsubs(subsNo, id, packageID, packageDesc, bookingDate));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return clientsubs;

    }

    public List<Clientsubs> selectSubs(int id) {
        List<Clientsubs> clientsubs = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUBS_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int subsNo = rs.getInt("subsNo");
                String packageID = rs.getString("packageID");
                String packageDesc = rs.getString("packageDesc");
                String bookingDate = rs.getString("bookingDate");

                clientsubs.add(new Clientsubs(subsNo, id, packageID, packageDesc, bookingDate));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return clientsubs;

    }

    public boolean deleteClientsubs(int subsNo) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CLIENTSUBS_SQL);) {
            preparedStatement.setInt(1, subsNo);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateClientsubs(Clientsubs clientsubs) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CLIENTSUBS_SQL);) {
            preparedStatement.setInt(1, clientsubs.getId());
            preparedStatement.setString(2, clientsubs.getPackageID());
            preparedStatement.setString(3, clientsubs.getPackageDesc());
            preparedStatement.setString(4, clientsubs.getBookingDate());
            preparedStatement.setInt(5, clientsubs.getSubsNo());
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
