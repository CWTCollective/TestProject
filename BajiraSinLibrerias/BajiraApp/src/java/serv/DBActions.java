package serv;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
/**
 * Esta clase provee las funciones necesarias par hacer login
 * @author Alumno Tarde
 */
public class DBActions {
       
     private Connection conn = null;
   
     DBActions() {
        try{
            Class.forName("org.mariadb.jdbc.Driver");
       } catch (ClassNotFoundException cE) {
           System.out.println("Class Not Found Exception: "+ cE.toString());
       
       } catch (Exception ex) {
           System.out.println("Exception: "+ ex.toString());
       }       
    }
    /**
     * 
     * @param request
     * @return 
     */
    public boolean DBLogin(HttpServletRequest request) {
        try{
           HttpSession session = request.getSession(false);
           CurUser curUser = (CurUser) session.getAttribute("curUser");           
            List<String> userList = new ArrayList<String>();
           conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/bajira", 
                   curUser.getUsername(),
                   curUser.getPass());
           
           if (conn != null){
               
               curUser.setNivel(getUserLevel( curUser.getUsername()));
               session.setAttribute("curUser",curUser);
                conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/bajira", 
                   curUser.getUsername(),
                   curUser.getPass());
           
               userList = getUserList(userList);
               
               session.setAttribute("userList",userList);
               
               return true;}
           else
           {return false;}
           
        }
       catch (SQLException e) {
           System.out.println("SQL Exception: "+ e.toString());  
           return false;
       } catch (Exception ex) {
           System.out.println("Exception: "+ ex.toString());
           return false;       
       }       
    }
    
  public int getUserLevel(String userName) {
        CallableStatement stmt = null;
        ResultSet rs = null;
        int userLevel;
        
        try {
            String QueryString = "{CALL getUserLevel( ?,?,?)}";
            stmt = conn.prepareCall(QueryString);
            //Bind IN parameter first, then bind OUT parameters
            stmt.setString(1, userName) ;
            // Because second parameter is OUT so register it
            stmt.registerOutParameter(2, java.sql.Types.INTEGER);
            stmt.registerOutParameter(3, java.sql.Types.INTEGER);

//Use execute method to run stored procedure.
            System.out.println("Executing stored procedure...");
            stmt.execute();

            // extract the output parameters
            userLevel= stmt.getInt(2);
            boolean lError = (stmt.getInt(3) == -1);

            stmt.close();
            conn.close();
            if (lError) {
                return 0;
            } else {                
                return userLevel;
            }
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
            return 0;
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
            return 0;
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
            }// nothing we can do
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try    
    }
  public List<String> getUserList(List<String> userList) {
        CallableStatement stmt = null;
        ResultSet rs = null;
        int userLevel;
        
        try {
            String QueryString = "{CALL getUserList( ?)}";
            stmt = conn.prepareCall(QueryString);
            // Because second parameter is OUT so register it
            stmt.registerOutParameter(1, java.sql.Types.INTEGER);            

//Use execute method to run stored procedure.
            System.out.println("Executing stored procedure...");
             boolean isResultSet = stmt.execute();

            //  ReulstSet object
            if (isResultSet) {

// ResulstSet object
                ResultSet res = stmt.getResultSet();
                while (res.next()) {
                    userList.add(res.getString("userName"));
                }
            }
            
            // extract the output parameters
           
            boolean lError = (stmt.getInt(1) == -1);

            stmt.close();
            conn.close();
            if (lError) {
                return null;
            } else {                
                return userList;
            }
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
            return null;
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
            return null;
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
            }// nothing we can do
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try    
    }
}
