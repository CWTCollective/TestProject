package serv;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Maria
 */
@WebServlet(name = "guardaDatos", urlPatterns = {"/guardaDatos"})
public class guardaDatos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet guardaDatos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet guardaDatos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DBActions myDB = new DBActions();
        CurUser curUser = new CurUser();
        curUser.setUsername(request.getParameter("user"));

        long lID = 0;
        if (curUser.getUsername() != ("")) {
            curUser.setPass(request.getParameter("pass"));
            HttpSession session = request.getSession();
            session.setAttribute("curUser", curUser);
            
            if (myDB.DBLogin(request)) {
                String userLevel = String.valueOf(curUser.getNivel());
                session.setAttribute("userLevel", userLevel);
               
                switch (userLevel) {
                    case "1":
                        response.sendRedirect("menuAdmin.jsp");
                        break;
                    case "2":
                        response.sendRedirect("menuNivel1.jsp");
                        break;
                    case "3":
                        response.sendRedirect("menuNivel2.jsp");
                        break;
                    case "4":
                        response.sendRedirect("menuEndUser.jsp");
                        break;
                    default:
                        response.sendRedirect("index.jsp");
                        break;
                }

            } else {

                request.setAttribute("data", "No se pudo entrar en la base de datos");
                RequestDispatcher req = request.getRequestDispatcher("index.jsp");
                req.include(request, response);

            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
