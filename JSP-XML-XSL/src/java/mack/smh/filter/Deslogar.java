/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mack.smh.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 30841161
 */
public class Deslogar implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            
            if (((HttpServletRequest) request).getSession(false).getAttribute("user") != null) {
                ((HttpServletRequest) request).getSession(false).removeAttribute("user");
                ((HttpServletRequest) request).getSession(true).setAttribute("logado", new String("Sim"));
            } else {
                ((HttpServletRequest) request).getSession(true).setAttribute("logado", new String("Não"));
            }
            chain.doFilter(request, response);
        } catch (Exception e) {
            ((HttpServletRequest) request).getSession(true).setAttribute("logado", new String("Não"));
        }
    }

    @Override
    public void destroy() {
    }
}
