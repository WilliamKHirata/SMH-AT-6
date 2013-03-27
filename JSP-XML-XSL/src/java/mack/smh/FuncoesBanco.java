/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mack.smh;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joaquim
 */
public class FuncoesBanco {

    public List<Mensagem> getMsgs() {
        try {
            Connection con = this.getConnection();

            String sql = "SELECT TITULO,MENSAGEM FROM APP.MENSAGENS";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.execute();
            ResultSet rs = pstm.getResultSet();
            List<Mensagem> msgs = new ArrayList<Mensagem>();

            while (rs.next()) {
                msgs.add(new Mensagem(rs.getString("TITULO"),rs.getString("MENSAGEM")));
            }
            return msgs;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Driver não disponível na biblioteca do projeto");
        }
        return null;
    }

    public boolean addMsg(String titulo, String mensagem) {
        try {
            Connection con = this.getConnection();

            String sql = "INSERT INTO APP.MENSAGENS VALUES(?,?)";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, titulo);
            pstm.setString(2, mensagem);


            if (pstm.execute()) {
                return true;
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Driver não disponível na biblioteca do projeto");
        }
        return false;

    }

    public boolean searchUser(Usuario u) {
        return true;
//        try {
//            Connection con = this.getConnection();
//
//            String sql = "SELECT * FROM APP.USUARIOS WHERE LOGIN = ? AND SENHA = ?";
//            PreparedStatement pstm = con.prepareStatement(sql);
//            pstm.setString(1, u.getLogin());
//            pstm.setString(2, u.getPassword());
//
//            pstm.execute();
//            ResultSet rs = pstm.getResultSet();
//            // List<Usuario> usuarios = new ArrayList<Usuario>();
//
//            if (rs.next()) {
//                return true;
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
//            System.out.println("Driver não disponível na biblioteca do projeto");
//        }
//        return false;
    }

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        //testa se o driver esta presente

        Class.forName("org.apache.derby.jdbc.ClientDriver");

        String url = "jdbc:derby://localhost:1527/USUARIOS";
        String usuario = "app";
        String senha = "app";

        Connection con = DriverManager.getConnection(url, usuario, senha);
        return con;
    }
}