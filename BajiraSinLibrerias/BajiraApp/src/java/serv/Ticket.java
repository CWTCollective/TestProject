/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Maria
 */
public class Ticket {

    double ID;
    String tipo;
    String descripcion;
    int Estado;
    String Resolucion;
    String Notas;
    Date fechaApertura;
    Date fechaResolucion;
    String usuarioEnd;
    String UsuarioNivel2;

    public List<String> getListaTiposValidos() {
        List<String> list = new ArrayList<String>();
        list.add("OP");
        list.add("SW");
        list.add("HW");
        return list;
    }

    public double getID() {
        return ID;
    }

    public void setID(double ID) {
        this.ID = ID;
    }

    public String getEstadoString() {
        String retVal;
        switch (this.Estado) {            
            case 1:
                retVal= "Abierto";
                break;
            case 2:
                retVal= "EnProceso";               
                break;
            case 3:
                retVal= "Escalado";
                break;
            case 4:
                retVal= "Cerrado";                
                break;
            default:
                retVal= "";
                break;
        }
        return retVal;
    }

    public void setEstadoString(String estado) {
        switch (estado) {
            case "Abierto":
                this.Estado =1;
                break;
            case "EnProceso":              
                this.Estado =2;
                break;
            case "Escalado":
                this.Estado=3;
                break;
            case "Cerrado":
                this.Estado=4;                
                break;
            default:
                this.Estado=0;
                break;
        }
    }
    
    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
          this.tipo = tipo;        
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getResolucion() {
        return Resolucion;
    }

    public void setResolucion(String Resolucion) {
        this.Resolucion = Resolucion;
    }

    public String getNotas() {
        return Notas;
    }

    public void setNotas(String Notas) {
        this.Notas = Notas;
    }

    public Date getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(Date fechaApertura) {
        this.fechaApertura = fechaApertura;
    }

    public Date getFechaResolucion() {
        return fechaResolucion;
    }

    public void setFechaResolucion(Date fechaResolucion) {
        this.fechaResolucion = fechaResolucion;
    }

 
    public String getUsuarioEnd() {
        return usuarioEnd;
 
    }
    public void setUsuarioEnd(String usuarioEnd) {
        this.usuarioEnd = usuarioEnd;
    }

    public String getUsuarioNivel2() {
        return UsuarioNivel2;
 
    }

    
    public void setUsuarioNivel2(String UsuarioNivel2) {
        this.UsuarioNivel2 = UsuarioNivel2;
    }
    public String getFechaAperturaString() {
        return JavaToMysqlDate(this.fechaApertura);
    }

     public String getFechaResolucionString() {
        return JavaToMysqlDate(this.fechaResolucion);
    }

     
     public String getJavaFechaAperturaString() {
        return MySqlToJavaDate(this.fechaApertura);
    }
    
    public String getJavaFechaResolucionString() {
        return MySqlToJavaDate(this.fechaResolucion);
    }
    /**
 * Esta funcion es necesaria porque el formato de fechas de java  y el mysql difer
 * @param inDate 
 * @return 
 */
    public String JavaToMysqlDate(java.util.Date inDate) {
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        String mysqlDateString = formatter.format(inDate);
        return mysqlDateString;
    }
/**
 * * Esta funcion es necesaria porque el formato de fechas de java  y el mysql difer
 * @param inDate
 * @return 
 */
    public String MySqlToJavaDate(java.util.Date inDate) {
        String pattern = "dd/MM/yyyy";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        String mysqlDateString = formatter.format(inDate);
        return mysqlDateString;
    }

}
