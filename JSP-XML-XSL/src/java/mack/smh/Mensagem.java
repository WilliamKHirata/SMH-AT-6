/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mack.smh;

/**
 *
 * @author 30954231
 */
public class Mensagem {
    String titulo,msg;
    
    public Mensagem(String _titulo, String _msg)
    {
        titulo = _titulo;
        msg = _msg;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getMsg() {
        return msg;
    }
    
    
}
