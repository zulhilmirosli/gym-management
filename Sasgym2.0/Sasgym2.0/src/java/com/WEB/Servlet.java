package com.WEB;

import com.DAO.ClientsubsDAO;
import com.DAO.PackageDAO;
import com.DAO.PaymentDAO;
import com.DAO.TrainerDAO;
import com.DAO.UserDAO;

import com.Model.Package;
import com.Model.Clientsubs;
import com.Model.Trainer;
import com.Model.User;
import com.Model.Payment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Muhamad Syahmi S62602
 */
@WebServlet("/")
public class Servlet extends HttpServlet {

    private UserDAO userDAO;
    private TrainerDAO trainerDAO;
    private ClientsubsDAO clientsubsDAO;
    private PackageDAO packageDAO;
    private PaymentDAO paymentDAO;

    public void init() {
        userDAO = new UserDAO();
        trainerDAO = new TrainerDAO();
        clientsubsDAO = new ClientsubsDAO();
        packageDAO = new PackageDAO();
        paymentDAO = new PaymentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            List<Package> dropdownList = packageDAO.DropDownList();
            request.setAttribute("listDropDown", dropdownList);

            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertTrainer(request, response);
                    break;
                case "/delete":
                    deleteTrainer(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateTrainer(request, response);
                    break;
                case "/search":
                    searchTrainer(request, response);
                    break;
                case "/list1":
                    listTrainer(request, response);
                    break;
                case "/new2":
                    showNewForm2(request, response);
                    break;
                case "/insert2":
                    insertUser(request, response);
                    break;
                case "/delete2":
                    deleteUser(request, response);
                    break;
                case "/edit2":
                    showEditForm2(request, response);
                    break;
                case "/update2":
                    updateUser(request, response);
                    break;
                case "/search2":
                    searchUser(request, response);
                    break;
                case "/list2":
                    listUser(request, response);
                    break;
                case "/searchHome":
                    searchTrainerHome(request, response);
                    break;
                case "/listHome":
                    listTrainerHome(request, response);
                    break;
                case "/listSubs":
                    listSubs(request, response);
                    break;
                case "/new3":
                    showNewForm3(request, response);
                    break;
                case "/insert3":
                    insertClientsubs(request, response);
                    break;
                case "/delete3":
                    deleteClientsubs(request, response);
                    break;
                case "/edit3":
                    showEditForm3(request, response);
                    break;
                case "/update3":
                    updateClientsubs(request, response);
                    break;
                case "/payment":
                    showPaymentForm(request, response);
                    break;
                case "/updatePayment":
                    updatePayment(request, response);
                    break;
                //package
                case "/newpack":
                    showNewFormPack(request, response);
                    break;
                case "/insertpack":
                    insertPack(request, response);
                    break;
                case "/deletepack":
                    deletePack(request, response);
                    break;
                case "/editpack":
                    showEditFormPack(request, response);
                    break;
                case "/updatepack":
                    updatePack(request, response);
                    break;
                case "/listpack":
                    listPack(request, response);
                    break;
                default:
                    listClientsubs3(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("userForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm2(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userForm.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String phoneNo = request.getParameter("phoneNo");
        User newUser = new User(username, password, name, age, gender, phoneNo);
        userDAO.insertUser(newUser);
        response.sendRedirect("list2");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String phoneNo = request.getParameter("phoneNo");
        User user = new User(id, name, age, gender, phoneNo);
        userDAO.updateUser(user);
        response.sendRedirect("list2");
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        List<User> listUser = userDAO.searchUser(name, age);
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userList.jsp#usertable");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        response.sendRedirect("list2");
    }

    private void listTrainer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Trainer> listTrainer = trainerDAO.selectAllTrainers();
        request.setAttribute("listTrainer", listTrainer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("trainerList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("trainerForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Trainer existingTrainer = trainerDAO.selectTrainer(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("trainerForm.jsp");
        request.setAttribute("trainer", existingTrainer);
        dispatcher.forward(request, response);
    }

    private void insertTrainer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String shift = request.getParameter("shift");
        Trainer newTrainer = new Trainer(name, phone, email, course, shift);
        trainerDAO.insertTrainer(newTrainer);
        response.sendRedirect("list1");
    }

    private void updateTrainer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String shift = request.getParameter("shift");
        Trainer trainer = new Trainer(id, name, phone, email, course, shift);
        trainerDAO.updateTrainer(trainer);
        response.sendRedirect("list1");
    }

    private void searchTrainer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String course = request.getParameter("course");
        String shift = request.getParameter("shift");
        List<Trainer> listTrainer = trainerDAO.searchTrainer(course, shift);
        request.setAttribute("listTrainer", listTrainer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("trainerList.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteTrainer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        trainerDAO.deleteTrainer(id);
        response.sendRedirect("list1");
    }

    private void searchTrainerHome(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String course = request.getParameter("course");
        String shift = request.getParameter("shift");
        List<Trainer> listTrainer = trainerDAO.searchTrainer(course, shift);
        request.setAttribute("listTrainerHome", listTrainer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("trainerHome.jsp");
        dispatcher.forward(request, response);
    }

    private void listTrainerHome(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Trainer> listTrainer = trainerDAO.selectAllTrainersHome();
        request.setAttribute("listTrainerHome", listTrainer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("trainerHome.jsp");
        dispatcher.forward(request, response);
    }

    //---------------------------------------Client Subs Section---------------------------------------
    private void listClientsubs3(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Clientsubs> listClientsubs = clientsubsDAO.selectAllClientSubs();
        request.setAttribute("listClientsubs", listClientsubs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("clientsubsList.jsp");
        dispatcher.forward(request, response);
    }

    private void listSubs(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession(true);
        int id = Integer.parseInt(request.getParameter("id"));
        List<Clientsubs> listClientsubs = clientsubsDAO.selectSubs(id);
        request.setAttribute("listClientsubs", listClientsubs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("clientsubsList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm3(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("clientsubsForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm3(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int subsNo = Integer.parseInt(request.getParameter("subsNo"));
        Clientsubs existingClient = clientsubsDAO.selectClientsubs(subsNo);
        RequestDispatcher dispatcher = request.getRequestDispatcher("clientsubsForm.jsp");
        request.setAttribute("clientsubs", existingClient);
        dispatcher.forward(request, response);
    }

    private void insertClientsubs(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String packageID = request.getParameter("packageID");
        String packageDesc = request.getParameter("packageDesc");
        String bookingDate = request.getParameter("bookingDate");
        int id = Integer.parseInt(request.getParameter("id"));

        Clientsubs newClient = new Clientsubs(id, packageID, packageDesc, bookingDate);
        clientsubsDAO.insertClientsubs(newClient);
        response.sendRedirect("clientsubsList");
    }

    private void updateClientsubs(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int subsNo = Integer.parseInt(request.getParameter("subsNo"));
        String packageID = request.getParameter("packageID");
        String packageDesc = request.getParameter("packageDesc");
        String bookingDate = request.getParameter("bookingDate");
        int id = Integer.parseInt(request.getParameter("id"));

        Clientsubs clientsubs = new Clientsubs(subsNo, id, packageID, packageDesc, bookingDate);
        clientsubsDAO.updateClientsubs(clientsubs);
        response.sendRedirect("clientsubsList");
    }

    private void deleteClientsubs(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int subsNo = Integer.parseInt(request.getParameter("subsNo"));
        clientsubsDAO.deleteClientsubs(subsNo);
        response.sendRedirect("clientsubsList");
    }

    private void showPaymentForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int subsNo = Integer.parseInt(request.getParameter("subsNo"));
        Clientsubs existingClient = clientsubsDAO.selectClientsubs(subsNo);
        request.setAttribute("payment", existingClient);
        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentForm.jsp");
        dispatcher.forward(request, response);
    }

    private void updatePayment(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int subsID = Integer.parseInt(request.getParameter("subsID"));
        String fullName = request.getParameter("full_name");
        String cardNumber = request.getParameter("card_number");
        String expiry = request.getParameter("expiry");
        String cvv_cvc = request.getParameter("cvv_cvc");
        int amount = Integer.parseInt(request.getParameter("amount"));

        Payment payment = new Payment(subsID, fullName, cardNumber, expiry, cvv_cvc, amount);
        paymentDAO.insertPayment(payment);
        response.sendRedirect("thankPage.jsp");
    }

    //package
    private void listPack(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Package> listPack = packageDAO.selectAllPackage();
        request.setAttribute("listPack", listPack);
        RequestDispatcher dispatcher = request.getRequestDispatcher("packageList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewFormPack(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("packageForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditFormPack(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String packageID = request.getParameter("packageID");
        Package existingPackage = packageDAO.selectPackage(packageID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("packageForm.jsp");
        request.setAttribute("pack", existingPackage);
        dispatcher.forward(request, response);
    }

    private void insertPack(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String packageID = request.getParameter("packageID");
        String packageDesc = request.getParameter("packageDesc");
        int price = Integer.parseInt(request.getParameter("price"));
        Package newPack = new Package(packageID, packageDesc, price);
        packageDAO.insertPackage(newPack);
        response.sendRedirect("listpack");
    }

    private void updatePack(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String packageID = request.getParameter("packageID");
        String packageDesc = request.getParameter("packageDesc");
        int price = Integer.parseInt(request.getParameter("price"));
        Package pack = new Package(packageID, packageDesc, price);
        packageDAO.updatePack(pack);
        response.sendRedirect("listpack");
    }

    private void deletePack(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String packageID = request.getParameter("packageID");
        packageDAO.deletePackage(packageID);
        response.sendRedirect("listpack");
    }

}
