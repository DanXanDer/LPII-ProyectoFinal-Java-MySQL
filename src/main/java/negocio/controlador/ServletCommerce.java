/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package negocio.controlador;

import com.mysql.cj.conf.PropertyKey;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import negocio.modelo.Categoria;
import negocio.modelo.Cliente;
import negocio.modelo.Comida;
import negocio.modelo.ComidaDelCarrito;
import negocio.modelo.DAO.CategoriaDAO;
import negocio.modelo.DAO.ClienteDAO;
import negocio.modelo.DAO.ComidaDAO;
import negocio.modelo.DAO.OrdenClienteDAO;
import negocio.modelo.ordenCliente;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "ServletCommerce", urlPatterns = {"/ServletCommerce", "/carrito", "/confirmarCompra", "/indexCommerce", "/login", "/registrarCliente", "/shop", "/agregarCliente", "/logearCliente", "/datosCliente", "/cerrarSesionCliente", "/actualizarCliente", "/actualizarClave", "/agregarCarrito", "/comidasCategoria", "/eliminarDelCarrito", "/shopSegunCategoria", "/realizarCompra","/detallesProducto","/historialDeCompra", "/buscarProductoPorInicial"})
public class ServletCommerce extends HttpServlet {

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

            String path = request.getServletPath();
            if (path.equals("/carrito")) {
                request.getRequestDispatcher("WEB-INF/e-commerce/carrito.jsp").forward(request, response);
            }
            if (path.equals("/confirmarCompra")) {
                Cliente cl = (Cliente) request.getSession().getAttribute("cliente");
                if (cl == null) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/login.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("WEB-INF/e-commerce/confirmarCompra.jsp").forward(request, response);
                }

            }

            if (path.equals("/indexCommerce")) {

                request.getRequestDispatcher("WEB-INF/e-commerce/index.jsp").forward(request, response);
            }
            if (path.equals("/login")) {
                request.getRequestDispatcher("WEB-INF/e-commerce/login.jsp").forward(request, response);
            }
            if (path.equals("/agregarCliente")) {
                request.setAttribute("cliente", new Cliente());
                request.getRequestDispatcher("WEB-INF/e-commerce/registro.jsp").forward(request, response);
            }
            if (path.equals("/registrarCliente")) {
                String usuario = request.getParameter("usuario");
                String celular = request.getParameter("celular");
                String email = request.getParameter("email");
                String clave = request.getParameter("clave");
                String conclave = request.getParameter("conclave");
                if (clave.equals(conclave)) {
                    Cliente c = new Cliente(usuario, email, celular, clave, "-", "-");
                    ClienteDAO.agregarCliente(c);

                    request.getRequestDispatcher("WEB-INF/e-commerce/login.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg", "Las claves no coinciden");
                    request.getRequestDispatcher("WEB-INF/e-commerce/registro.jsp").forward(request, response);
                }
            }
            if (path.equals("/shop")) {
                request.getRequestDispatcher("WEB-INF/e-commerce/shop.jsp").forward(request, response);
            }
            if (path.equals("/comidasCategoria")) {
                int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
                ArrayList<Comida> comidasPorCategoria = ComidaDAO.mostrarComidasSegunCategoria(idcategoria);
                request.setAttribute("comidasPorCategoria", comidasPorCategoria);
                request.getRequestDispatcher("WEB-INF/e-commerce/shopSegunCategoria.jsp").forward(request, response);

            }
            if (path.equals("/logearCliente")) {
                String email = request.getParameter("email");
                String clave = request.getParameter("clave");
                Cliente c = ClienteDAO.validarCliente(email, clave);
                if (c == null) {
                    request.setAttribute("msg", "Usuario o correo incorrect");
                    request.getRequestDispatcher("WEB-INF/e-commerce/login.jsp").forward(request, response);
                } else {
                    request.getSession().setAttribute("cliente", c);
                    request.getRequestDispatcher("WEB-INF/e-commerce/index.jsp").forward(request, response);
                }
            }
            if (path.equals("/cerrarSesionCliente")) {
                request.getSession().invalidate();
                request.getRequestDispatcher("WEB-INF/e-commerce/index.jsp").forward(request, response);
            }
            if (path.equals("/datosCliente")) {
                request.getRequestDispatcher("WEB-INF/e-commerce/datosCliente.jsp").forward(request, response);
            }
            if (path.equals("/actualizarCliente")) {
                String usuario = request.getParameter("usuario");
                String email = request.getParameter("email");
                String celular = request.getParameter("celular");
                String direccion = request.getParameter("direccion");
                String distrito = request.getParameter("distrito");
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                Cliente c = new Cliente(usuario, email, celular, email, distrito, direccion);
                c.setIdcliente(idcliente);
                ClienteDAO.editarCliente(c);
                request.getSession().invalidate();
                request.getSession().setAttribute("cliente", c);
                request.getRequestDispatcher("WEB-INF/e-commerce/datosCliente.jsp").forward(request, response);
            }
            if (path.equals("/actualizarClave")) {
                String claveantigua = request.getParameter("claveantigua");
                String clavenueva = request.getParameter("clavenueva");
                String conclavenueva = request.getParameter("conclavenueva");
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                if (ClienteDAO.verificarClave(claveantigua) == true) {
                    if (clavenueva.equals(conclavenueva)) {
                        ClienteDAO.editarClave(clavenueva, idcliente);
                        request.getRequestDispatcher("WEB-INF/e-commerce/datosCliente.jsp").forward(request, response);
                    } else {
                        request.setAttribute("msg", "Las clave nueva y la de confirmación no coinciden");
                        request.getRequestDispatcher("WEB-INF/e-commerce/datosCliente.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("msg", "Clave incorrecta");
                    request.getRequestDispatcher("WEB-INF/e-commerce/datosCliente.jsp").forward(request, response);
                }
            }
            if (path.equals("/eliminarCliente")) {
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                ClienteDAO.eliminarCliente(idcliente);
                request.getSession().invalidate();
                request.getRequestDispatcher("WEB-INF/e-commerce/index.jsp").forward(request, response);
            }
            if (path.equals("/agregarCarrito")) {

                ArrayList<ComidaDelCarrito> comidaCarrito = new ArrayList();
                int idcomida = Integer.parseInt(request.getParameter("idcomida"));
                Comida comida = ComidaDAO.comidaSegunID(idcomida);
                ComidaDelCarrito comidadelcarrito = new ComidaDelCarrito(comida.getIdcomida(), comida.getNombre(), comida.getDescripcion(), comida.getPrecio(), comida.getFoto(), comida.getIdcategoria());
                float total = comidadelcarrito.getPrecio() * comidadelcarrito.getCantidad();
                comidadelcarrito.setPrecio_total(total);
                boolean existe = false;
                int idcategoria = comida.getIdcategoria();
                ArrayList<ComidaDelCarrito> comida_Carrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");
                if (comida_Carrito == null) {
                    comidaCarrito.add(comidadelcarrito);
                    request.getSession().setAttribute("comida_Carrito", comidaCarrito);
                } else {
                    for (ComidaDelCarrito c : comida_Carrito) {
                        if (idcomida == c.getIdcomida()) {
                            existe = true;
                        }
                    }
                    if (existe == false) {
                        comidaCarrito = comida_Carrito;
                        comidaCarrito.add(comidadelcarrito);
                    }

                }
                String pathJSP = request.getParameter("pathJSP");
                if (pathJSP.equals("MenuTodo")||(pathJSP.equals("detalle"))) {
                    request.setAttribute("comidasPorCategoria", ComidaDAO.mostrarComidas());
                    request.getRequestDispatcher("WEB-INF/e-commerce/shop.jsp").forward(request, response);
                }                 
                else {
                    ArrayList<Comida> comidasPorCategoria = ComidaDAO.mostrarComidasSegunCategoria(idcategoria);
                    request.setAttribute("comidasPorCategoria", comidasPorCategoria);
                    request.getRequestDispatcher("WEB-INF/e-commerce/shopSegunCategoria.jsp").forward(request, response);
                }

                
            }
            if (path.equals("/eliminarDelCarrito")) {
                String pathJSP = request.getParameter("pathJSP");
                String idcomida = request.getParameter("idcomida");
                if (idcomida != null) {
                    ArrayList<ComidaDelCarrito> comida_Carrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");
                    if (comida_Carrito != null) {
                        for (ComidaDelCarrito c : comida_Carrito) {
                            if (c.getIdcomida() == Integer.parseInt(idcomida)) {

                                comida_Carrito.remove(c);

                                break;
                            }
                        }
                    }

                }
                if (pathJSP.equals("shopSegunCategoria")) {
                    int idcategoria = (ComidaDAO.comidaSegunID(Integer.parseInt(idcomida))).getIdcategoria();
                    ArrayList<Comida> comidasPorCategoria = ComidaDAO.mostrarComidasSegunCategoria(idcategoria);
                    request.setAttribute("comidasPorCategoria", comidasPorCategoria);
                    request.getRequestDispatcher("WEB-INF/e-commerce/shopSegunCategoria.jsp").forward(request, response);
                }
                if (pathJSP.equals("carrito")) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/carrito.jsp").forward(request, response);
                }
                if (pathJSP.equals("shop")) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/shop.jsp").forward(request, response);
                }
                if (pathJSP.equals("confirmarCompra")) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/confirmarCompra.jsp").forward(request, response);
                }
                if (pathJSP.equals("indexCommerce")) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/index.jsp").forward(request, response);
                }
                if (pathJSP.equals("registro")) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/registro.jsp").forward(request, response);
                }
                if (pathJSP.equals("datosCliente")) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/datosCliente.jsp").forward(request, response);
                }
                if (pathJSP.equals("login")) {
                    request.getRequestDispatcher("WEB-INF/e-commerce/login.jsp").forward(request, response);
                }
            }
            if (path.equals("/realizarCompra")) {
                ArrayList<ComidaDelCarrito> comida_Carrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");
                Cliente cl = (Cliente) request.getSession().getAttribute("cliente");
                for (ComidaDelCarrito c : comida_Carrito) {
                    ordenCliente orden = new ordenCliente(c.getIdcomida(), cl.getIdcliente(), c.getCantidad(), c.getPrecio_total());
                    OrdenClienteDAO.agregarOrden(orden);
                }
                request.getSession().invalidate();
                request.getSession().setAttribute("cliente", cl);
                request.getRequestDispatcher("WEB-INF/e-commerce/index.jsp").forward(request, response);
            }
            if (path.equals("/detallesProducto")) {
                int idcomida = Integer.parseInt(request.getParameter("idcomida"));
                Comida comida = ComidaDAO.mostrarComidaSegunId(idcomida);
                request.setAttribute("comida", comida);
                request.getRequestDispatcher("WEB-INF/e-commerce/detallesProducto.jsp").forward(request, response);
            }
            if(path.equals("/historialDeCompra")){
                Cliente cl = (Cliente)request.getSession().getAttribute("cliente");                
                request.setAttribute("ordenDelCliente",OrdenClienteDAO.mostrarOrdenDelCliente(cl.getIdcliente()));
                request.getRequestDispatcher("WEB-INF/e-commerce/historialDeCompra.jsp").forward(request, response);
            }
            if(path.equals("/buscarProductoPorInicial")){
                String nombreProducto = request.getParameter("nombreProducto");
                request.setAttribute("comidasPorCategoria", ComidaDAO.buscarComidaPorNombre(nombreProducto));
                
                request.getRequestDispatcher("WEB-INF/e-commerce/shopSegunCategoria.jsp").forward(request, response);
            }
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
