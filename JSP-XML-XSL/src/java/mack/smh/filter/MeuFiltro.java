/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mack.smh.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import mack.smh.FuncoesBanco;
import mack.smh.Mensagem;
import mack.smh.Usuario;
import org.jboss.weld.context.http.HttpRequestContext;

/**
 *
 * @author 1130847
 */
public class MeuFiltro implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        Usuario u = null;
        PrintWriter out;
        try {
            u = (Usuario) ((HttpServletRequest) request).getSession(false).getAttribute("user");

            out = response.getWriter();

            if (u != null) {
                List<Mensagem> lista = new ArrayList<Mensagem>();
                lista.add(new Mensagem("Novo titulo", "Nova mensagem"));
                lista.add(new Mensagem("Outro", "gato"));
                lista.add(new Mensagem("Mais outro", "cachorro"));
                lista.add(new Mensagem("Cansei", "de escrever"));
                ((HttpServletRequest) request).getSession(true).setAttribute("mensagens", lista);
                chain.doFilter(request, response);
            } else {
                ((HttpServletResponse) response).sendRedirect("index.jsp");
            }
            /*
             FuncoesBanco bd = new FuncoesBanco();
             List<Mensagem> lista = bd.getMsgs();
             */
        } catch (Exception e) {
            ((HttpServletResponse) response).sendRedirect("index.jsp");
        }


    }

    @Override
    public void destroy() {
    }
}
