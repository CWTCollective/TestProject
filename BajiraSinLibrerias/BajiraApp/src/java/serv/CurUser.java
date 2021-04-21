/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;

/**
 *
 * @author Maria
 */
public class CurUser {

    String username = "";
    String pass = "";
    int nivel= 0;

    public CurUser() {
    }

    public CurUser(CurUser curUser) {
        this.username = curUser.username;
        this.pass = curUser.pass;
        this.nivel = curUser.nivel;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getNivel() {
        return nivel;
    }

    public String getNivelString() {
        switch (nivel) {
            case 1:
                return "Admin";
            case 2:
                return "Nivel1";
            case 3:
                return "Nivel2";
            case 4:
                return "Usuario";
        }
        return "Not set";
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public void setNivelString(String rNivel) {
        switch (rNivel) {
            case "Admin":
            case "admin":
                this.nivel = 1;
                break;
            case "Nivel1":
            case "nivel1":
                this.nivel = 2;
                break;
            case "Nivel2":
            case "nivel2":
                this.nivel = 3;
                break;
            case "Usuario":
            case "usuario":
                this.nivel = 4;
                break;
            default:
                nivel = 0;
                break;
        }
    }

}
