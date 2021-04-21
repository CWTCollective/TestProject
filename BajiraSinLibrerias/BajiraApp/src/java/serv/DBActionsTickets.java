/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Maria
 */
public class DBActionsTickets {

    private Connection conn = null;

    DBActionsTickets(HttpServletRequest request) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            HttpSession session = request.getSession(false);
            CurUser curUser = (CurUser) session.getAttribute("curUser");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bajira",
                    curUser.getUsername(),
                    curUser.getPass());
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.toString());
        } catch (ClassNotFoundException cE) {
            System.out.println("Class Not Found Exception: " + cE.toString());

        } catch (Exception ex) {
            System.out.println("Exception: " + ex.toString());

        }
    }

    public double creaUsuario(String userName, int userLevel) {
        CallableStatement stmt = null;

        try {
            String QueryString = "{CALL creaUsuario( ?,?,?,?)}";
            stmt = conn.prepareCall(QueryString);
            //Bind IN parameter first, then bind OUT parameters
            stmt.setString(1, userName);
            stmt.setInt(2, userLevel);
            // Because second parameter is OUT so register it            
            stmt.registerOutParameter(3, java.sql.Types.DOUBLE);
            stmt.registerOutParameter(4, java.sql.Types.INTEGER);

            stmt.execute();

            // extract the output parameters
            double lID = stmt.getDouble(3);
            boolean lError = (stmt.getInt(4) == -1);

            stmt.close();
            conn.close();
            if (lError) {
                return lID;
            } else {
                return lID;
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

    public double creaTicket(Ticket ticket) {
        CallableStatement stmt = null;

        try {
            String QueryString = "{CALL creaTicket( ?,?,?,?,?,?,?,?,?)}";
            stmt = conn.prepareCall(QueryString);
            //Bind IN parameter first, then bind OUT parameters
            stmt.setString(1, ticket.getTipo());
            stmt.setString(2, ticket.getDescripcion());
            stmt.setInt(3, ticket.getEstado());
            stmt.setString(4, "");
            stmt.setString(5, "");
            stmt.setString(6, ticket.getUsuarioEnd());
            stmt.setString(7, "");
            // Because second parameter is OUT so register it            
            stmt.registerOutParameter(8, java.sql.Types.DOUBLE);
            stmt.registerOutParameter(9, java.sql.Types.INTEGER);

            stmt.execute();

            // extract the output parameters
            double lID = stmt.getDouble(8);
            boolean lError = (stmt.getInt(9) == -1);

            stmt.close();
            conn.close();
            if (lError) {
                return 0;
            } else {
                return lID;
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

    public boolean muestraTickets(List<Ticket> rTickets) {
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            String QueryString = "{CALL muestraTickets(?)}";
            stmt = conn.prepareCall(QueryString);

            stmt.registerOutParameter(1, java.sql.Types.INTEGER);
            //Use execute method to run stored procedure.
            System.out.println("Executing stored procedure...");
            boolean isResultSet = stmt.execute();

            //  ReulstSet object
            if (isResultSet) {

// ResulstSet object
                ResultSet res = stmt.getResultSet();
                while (res.next()) {
                    Ticket lTicket = new Ticket();
                    lTicket.setID(res.getInt("ID"));
                    lTicket.setTipo(res.getString("Tipo"));
                    lTicket.setDescripcion(res.getString("Descripcion"));
                    lTicket.setEstado(Integer.parseInt(res.getString("Estado")));
                    lTicket.setResolucion(res.getString("Resolucion"));
                    lTicket.setNotas(res.getString("Notas"));
                    lTicket.setUsuarioEnd(res.getString("UsuarioEnd"));
                    lTicket.setUsuarioNivel2(res.getString("UsuarioNivel2"));
                    lTicket.setFechaApertura(res.getDate("FechaApertura"));
                    lTicket.setFechaResolucion(res.getDate("FechaResolucion"));
                    rTickets.add(lTicket);
                }
            }

            boolean lError = (stmt.getInt(1) == -1);

            stmt.close();
            conn.close();
            if (lError) {
                return false;
            } else {
                return true;
            }

        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
            return false;
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
            return false;
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

    public boolean muestraEscalatedTickets(List<Ticket> rTickets) {
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            String QueryString = "{CALL muestraTicketsEscalados(?)}";
            stmt = conn.prepareCall(QueryString);

            stmt.registerOutParameter(1, java.sql.Types.INTEGER);

            boolean isResultSet = stmt.execute();

            //  ReulstSet object
            if (isResultSet) {

// ResulstSet object
                ResultSet res = stmt.getResultSet();
                while (res.next()) {
                    Ticket lTicket = new Ticket();
                    lTicket.setID(res.getInt("ID"));
                    lTicket.setTipo(res.getString("Tipo"));
                    lTicket.setDescripcion(res.getString("Descripcion"));
                    lTicket.setEstado(Integer.parseInt(res.getString("Estado")));
                    lTicket.setResolucion(res.getString("Resolucion"));
                    lTicket.setNotas(res.getString("Notas"));
                    lTicket.setUsuarioEnd(res.getString("UsuarioEnd"));
                    lTicket.setUsuarioNivel2(res.getString("UsuarioNivel2"));
                    lTicket.setFechaApertura(res.getDate("FechaApertura"));
                    lTicket.setFechaResolucion(res.getDate("FechaResolucion"));
                    rTickets.add(lTicket);
                }
            }

            boolean lError = (stmt.getInt(1) == -1);

            stmt.close();
            conn.close();
            if (lError) {
                return false;
            } else {
                return true;
            }

        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
            return false;
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
            return false;
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

    public boolean GetTicket(Ticket rTicket) {
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            String QueryString = "{CALL muestraTicket( ?,?,?,?,?,?,?,?,?,?,?,?)}";
            stmt = conn.prepareCall(QueryString);
            //Bind IN parameter first, then bind OUT parameters
            stmt.setDouble(12, rTicket.getID());
            // Because second parameter is OUT so register it
            stmt.registerOutParameter(2, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(3, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(4, java.sql.Types.INTEGER);
            stmt.registerOutParameter(5, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(6, java.sql.Types.DATE);
            stmt.registerOutParameter(7, java.sql.Types.DATE);
            stmt.registerOutParameter(8, java.sql.Types.DATE);
            stmt.registerOutParameter(9, java.sql.Types.DATE);
            stmt.registerOutParameter(10, java.sql.Types.DATE);
            stmt.registerOutParameter(11, java.sql.Types.DATE);

            //Use execute method to run stored procedure.
            System.out.println("Executing stored procedure...");
            stmt.execute();
            // Step-6: extract the output parameters

            rTicket.setTipo(stmt.getString(2));
            rTicket.setDescripcion(stmt.getString(3));
            rTicket.setEstado(stmt.getInt(4));
            rTicket.setResolucion(stmt.getString(5));
            rTicket.setNotas(stmt.getString(6));
            rTicket.setFechaApertura(stmt.getDate(7));
            rTicket.setFechaResolucion(stmt.getDate(8));
            rTicket.setUsuarioEnd(stmt.getString(9));
            rTicket.setUsuarioNivel2(stmt.getString(10));

            int lError = (stmt.getInt(11));
            stmt.close();
            conn.close();
            return true;
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
            return false;
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
            return false;
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

    public boolean ActualizaTicket(Ticket rTicket) {
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            String QueryString = "{CALL actualizaTicket( ?,?,?,?,?,?,?,?,?)}";
            stmt = conn.prepareCall(QueryString);
            //Bind IN parameter first, then bind OUT parameters
            stmt.setString(1, rTicket.getTipo());
            stmt.setString(2, rTicket.getDescripcion());
            stmt.setInt(3, rTicket.getEstado());
            stmt.setString(4, rTicket.getResolucion());
            stmt.setString(5, rTicket.getNotas());
            stmt.setString(6, rTicket.getUsuarioEnd());
            stmt.setString(7, rTicket.getUsuarioNivel2());
            stmt.setDouble(8, rTicket.getID());
            // Because second parameter is OUT so register it
            stmt.registerOutParameter(9, java.sql.Types.DATE);

            //Use execute method to run stored procedure.
            System.out.println("Executing stored procedure...");
            stmt.execute();
            // Step-6: extract the output parameters

            int lError = (stmt.getInt(9));
            stmt.close();
            conn.close();
            if (lError > -1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
            return false;
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
            return false;
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
