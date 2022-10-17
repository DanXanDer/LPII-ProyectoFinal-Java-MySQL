/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package negocio.controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import negocio.modelo.Admin;
import negocio.modelo.Categoria;
import negocio.modelo.Comida;
import negocio.modelo.DAO.AdminDAO;
import negocio.modelo.DAO.CategoriaDAO;
import negocio.modelo.DAO.ComidaDAO;
import negocio.modelo.DAO.OrdenClienteDAO;
import negocio.modelo.ordenCliente;

/**
 *
 * @author Daniel
 */
@MultipartConfig
@WebServlet(name = "ServletAdministracion", urlPatterns = {"/ServletAdministracion", "/ingresarAdmin", "/logearAdmin", "/Producto", "/Grabar", "/eliminarProducto", "/adminComidaSegunCategoria", "/adminTodasLasComidas", "/registroVentas", "/CRUDProductos", "/AdminBuscarProducto", "/registroDeVentasFiltrar", "/AdminEditarImagen", "/GrabarEditImg"})
public class ServletAdministracion extends HttpServlet {

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
            if (path.equals("/ingresarAdmin")) {
                request.getRequestDispatcher("WEB-INF/admin/LoginAdmin.jsp").forward(request, response);
            }
            if (path.equals("/logearAdmin")) {
                String email = request.getParameter("email");
                String clave = request.getParameter("clave");
                Admin admin = AdminDAO.buscarAdmin(email, clave);
                if (admin != null) {
                    ArrayList<Comida> comidasTotal = ComidaDAO.mostrarComidas();
                    request.setAttribute("comidas", comidasTotal);
                    request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("WEB-INF/admin/LoginAdmin.jsp").forward(request, response);
                }
            }
            if (path.equals("/Producto")) {

                String pathJSP = request.getParameter("pathJSP");
                if (pathJSP.equals("agregarProducto")) {
                    request.setAttribute("titulo", "Agregar producto");
                    request.setAttribute("comida", new Comida());
                    request.getRequestDispatcher("WEB-INF/admin/Producto.jsp").forward(request, response);

                }
                if (pathJSP.equals("editarProducto")) {
                    request.setAttribute("titulo", "Editar producto");
                    int idcomida = Integer.parseInt(request.getParameter("idcomida"));
                    Comida comida = ComidaDAO.comidaSegunID(idcomida);
                    request.setAttribute("comida", comida);
                    request.getRequestDispatcher("WEB-INF/admin/Producto.jsp").forward(request, response);
                }

            }
            if (path.equals("/Grabar")) {
                int idcomida = Integer.parseInt(request.getParameter("idcomida"));
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                float precio = Float.parseFloat(request.getParameter("precio"));

                int idcategoria = Integer.parseInt(request.getParameter("categoria"));
                if (idcomida >= 1) {
                    Comida comida = new Comida(nombre, descripcion, precio, idcategoria);
                    comida.setIdcomida(idcomida);
                    ComidaDAO.editarComida(comida);
                    ArrayList<Comida> comidasTotal = ComidaDAO.mostrarComidas();
                    request.setAttribute("comidas", comidasTotal);
                    request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
                } else {
                    Part part = request.getPart("foto");
                    InputStream inputStream = part.getInputStream();
                    Comida comida = new Comida(nombre, descripcion, precio, inputStream, idcategoria);
                    if (nombre.equals(null) || (descripcion.equals(null)) || (precio <= 0) || (part.equals(""))) {
                        request.setAttribute("titulo", "Agregar producto");
                        request.setAttribute("msg", "Rellene correctamente todos los campos");
                        request.getRequestDispatcher("WEB-INF/admin/Producto.jsp").forward(request, response);
                    } else {
                        ComidaDAO.agregarComida(comida);
                        ArrayList<Comida> comidasTotal = ComidaDAO.mostrarComidas();
                        request.setAttribute("comidas", comidasTotal);
                        request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
                    }

                }

            }
            if (path.equals("/eliminarProducto")) {
                int idcomida = Integer.parseInt(request.getParameter("idcomida"));
                ComidaDAO.eliminarComida(idcomida);
                ArrayList<Comida> comidasTotal = ComidaDAO.mostrarComidas();
                request.setAttribute("comidas", comidasTotal);
                request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
            }
            if (path.equals("/adminComidaSegunCategoria")) {
                int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
                ArrayList<Comida> comidasSegunCategoria = ComidaDAO.mostrarComidasSegunCategoria(idcategoria);
                request.setAttribute("comidas", comidasSegunCategoria);
                request.setAttribute("categoria", CategoriaDAO.obtenerCategoria(idcategoria).getCategoria());
                request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
            }
            if (path.equals("/adminTodasLasComidas")) {
                ArrayList<Comida> comidasTotal = ComidaDAO.mostrarComidas();
                request.setAttribute("comidas", comidasTotal);
                request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
            }
            if (path.equals("/registroVentas")) {
                ArrayList<ordenCliente> ordenDelCliente = OrdenClienteDAO.mostrarOrden();
                request.setAttribute("ordenDelCliente", ordenDelCliente);
                request.getRequestDispatcher("WEB-INF/admin/registroVentas.jsp").forward(request, response);
            }
            if (path.equals("/CRUDProductos")) {
                ArrayList<Comida> comidasTotal = ComidaDAO.mostrarComidas();
                request.setAttribute("comidas", comidasTotal);
                request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
            }
            if (path.equals("/AdminBuscarProducto")) {
                String producto = request.getParameter("producto");
                request.setAttribute("comidas", ComidaDAO.buscarComidaPorNombre(producto));
                request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
            }
            if (path.equals("/registroDeVentasFiltrar")) {
                String precio = request.getParameter("precio");
                int idproducto = Integer.parseInt(request.getParameter("producto"));
                ArrayList<ordenCliente> ordenDelCliente = new ArrayList();
                if (precio.equals("0") && (idproducto == 0)) {
                    ordenDelCliente = OrdenClienteDAO.mostrarOrden();

                } else if (!(precio.equals("0")) && (idproducto == 0)) {
                    if (precio.equals("1")) {
                        ordenDelCliente = OrdenClienteDAO.ordenarPrecioAsc();

                    } else {
                        ordenDelCliente = OrdenClienteDAO.ordenarPrecioDesc();

                    }
                } else if ((precio.equals("0")) && !(idproducto == 0)) {
                    ordenDelCliente = OrdenClienteDAO.mostrarOrdenSegunIDComida(idproducto);
                } else {
                    if (precio.equals("1")) {
                        ordenDelCliente = OrdenClienteDAO.mostrarOrdenSegunIDComidaAsc(idproducto);

                    } else {
                        ordenDelCliente = OrdenClienteDAO.mostrarOrdenSegunIDComidaDesc(idproducto);

                    }
                }
                request.setAttribute("ordenDelCliente", ordenDelCliente);
                request.getRequestDispatcher("WEB-INF/admin/registroVentas.jsp").forward(request, response);
            }
            if (path.equals("/AdminEditarImagen")) {
                int idcomida = Integer.parseInt(request.getParameter("idcomida"));
                Comida comida = ComidaDAO.comidaSegunID(idcomida);
                request.setAttribute("comida", comida);
                request.setAttribute("titulo", "Editar imagen");
                request.getRequestDispatcher("WEB-INF/admin/edicionImagen.jsp").forward(request, response);
            }
            if (path.equals("/GrabarEditImg")) {
                Comida comida = ComidaDAO.comidaSegunID(Integer.parseInt(request.getParameter("idcomida")));
                Part part = request.getPart("foto");
                InputStream inputStream = part.getInputStream();
                comida.setFoto(inputStream);
                ComidaDAO.editarComidaImagen(comida);
                ArrayList<Comida> comidasTotal = ComidaDAO.mostrarComidas();
                request.setAttribute("comidas", comidasTotal);
                request.getRequestDispatcher("WEB-INF/admin/CRUDProductos.jsp").forward(request, response);
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
