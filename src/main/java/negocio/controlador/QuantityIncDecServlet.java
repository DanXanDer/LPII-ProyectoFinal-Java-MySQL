/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package negocio.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.modelo.ComidaDelCarrito;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "QuantityIncDecServlet", urlPatterns = {"/QuantityIncDecServlet"})
public class QuantityIncDecServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuantityIncDecServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuantityIncDecServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int idcomida = Integer.parseInt(request.getParameter("idcomida"));
            ArrayList<ComidaDelCarrito> comida_Carrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");

            if (action != null && idcomida >= 1) {
                if (action.equals("inc")) {
                    for (ComidaDelCarrito c : comida_Carrito) {
                        if (c.getIdcomida() == idcomida) {
                            int cantidad = c.getCantidad();
                            cantidad++;
                            c.setCantidad(cantidad);
                            c.setPrecio_total(cantidad*c.getPrecio());
                            request.getRequestDispatcher("WEB-INF/e-commerce/carrito.jsp").forward(request, response);
                        }
                    }
                }

                if (action.equals("dec")) {
                    for (ComidaDelCarrito c : comida_Carrito) {
                        if (c.getIdcomida() == idcomida && c.getCantidad()> 1) {
                            int cantidad = c.getCantidad();
                            cantidad--;
                            c.setCantidad(cantidad);
                            c.setPrecio_total(cantidad*c.getPrecio());
                            break;
                        }
                    }
                    request.getRequestDispatcher("WEB-INF/e-commerce/carrito.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("WEB-INF/e-commerce/carrito.jsp").forward(request, response);
            }
        }
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
        processRequest(request, response);
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
