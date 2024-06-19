package com.DAO;

import com.Model.Trainer;
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
 * @author Muhammad Ariq Iskandar S62678
 */
public class TrainerDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost/sasgym";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_TRAINERS_SQL = "INSERT INTO trainers (name, phone, email, course, shift) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_TRAINER_BY_ID = "SELECT id, name,phone, email, course, shift from trainers where id=?";
    private static final String SELECT_ALL_TRAINERS = "SELECT * FROM trainers";
    private static final String DELETE_TRAINERS_SQL = "DELETE FROM trainers where id = ?";
    private static final String UPDATE_TRAINERS_SQL = "UPDATE trainers set name = ?, phone = ?, email = ?, course = ?, shift = ? where id = ?";
    private static final String SEARCH_TRAINERS = "SELECT id, name, phone, email, course, shift from trainers where course=? or shift=?";
    private static final String SEARCH_TRAINERS_HOME = "SELECT name, phone, email, course, shift  from trainers where course=? or shift=?";
    private static final String SELECT_ALL_TRAINERS_HOME = "SELECT name, phone, email, course, shift  from trainers";


    public TrainerDAO() {
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

    public void insertTrainer(Trainer trainer) throws SQLException {
        System.out.println(INSERT_TRAINERS_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TRAINERS_SQL);) {

            preparedStatement.setString(1, trainer.getName());
            preparedStatement.setString(2, trainer.getPhone());
            preparedStatement.setString(3, trainer.getEmail());
            preparedStatement.setString(4, trainer.getCourse());
            preparedStatement.setString(5, trainer.getShift());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Trainer selectTrainer(int id) {
        Trainer trainer = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRAINER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String course = rs.getString("course");
                String shift = rs.getString("shift");
                trainer = new Trainer(id, name,phone, email,course, shift);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return trainer;
    }

    public List<Trainer> selectAllTrainers() {
        List<Trainer> trainers = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TRAINERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String course = rs.getString("course");
                String shift = rs.getString("shift");
                trainers.add(new Trainer(id, name,phone, email,course, shift));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return trainers;
    }

    public boolean deleteTrainer(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TRAINERS_SQL);) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateTrainer(Trainer trainer) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TRAINERS_SQL);) {
            preparedStatement.setString(1, trainer.getName());
            preparedStatement.setString(2, trainer.getPhone());
            preparedStatement.setString(3, trainer.getEmail());
            preparedStatement.setString(4, trainer.getCourse());
            preparedStatement.setString(5, trainer.getShift());
            preparedStatement.setInt(6, trainer.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
     public List<Trainer> searchTrainer(String course, String shift) {
        List<Trainer> trainers = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_TRAINERS);) {
            preparedStatement.setString(1, course);
            preparedStatement.setString(2, shift);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                course = rs.getString("course");
                shift = rs.getString("shift");
                trainers.add(new Trainer(id, name,phone, email,course, shift));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return trainers;
    }
    public List<Trainer> searchTrainerHome(String course, String shift) {
        List<Trainer> trainers = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_TRAINERS_HOME);) {
            preparedStatement.setString(1, course);
            preparedStatement.setString(2, shift);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                course = rs.getString("course");
                shift = rs.getString("shift");
                trainers.add(new Trainer(name,phone, email,course,shift));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return trainers;
    }
      public List<Trainer> selectAllTrainersHome() {
        List<Trainer> trainers = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TRAINERS_HOME);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String course = rs.getString("course");
                String shift = rs.getString("shift");
                trainers.add(new Trainer(name,phone, email,course, shift));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return trainers;
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
