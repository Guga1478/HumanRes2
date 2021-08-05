<%-- 
    Document   : Countries
    Created on : Mar 10, 2021, 8:01:49 AM
    Author     : GUSATAVO
--%>

<%@page import="ar.com.java.humanRes.utils.html.HtmlTable"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.RegionsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_RegionsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_RegionsRepository"%>
<%@page import="ar.com.java.humanRes.connectors.Connector"%>
<%@page import="ar.com.java.humanRes.connectors.Connector"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.CountriesRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_CountriesRepository"%>
<%@page import="ar.com.java.humanRes.entities.Regions"%>
<%@page import="ar.com.java.humanRes.entities.Countries"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_CountriesRepository cr = new CountriesRepository(Connector.getConnection());%>
<%I_RegionsRepository rr = new RegionsRepository(Connector.getConnection());%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <style>
        html{
            
            background-size: auto;
            min-height: 100%;
            background-color: #cccccc;
        }

        body{
            background-image: url("CSS/Imagenes/background.jpg");
            background-color: #007bff; 
        }

        #advanced-search-form{
            background-size: auto;
            background-color: lightcyan;
            max-width: 980px;
            margin: auto auto auto;
            padding:auto;
            color: #858b8e;
            box-shadow: 40px 6px 40px rgba(0,0,0,0.2);
        }

        #advanced-search-form h2{
            padding-bottom: 20px;
            margin: 10px 10px;
            font-size: 24px;
        }

        #advanced-search-form hr{
            margin-top: 38px;
            margin-bottom: 54px;
            margin-left:3px;
            border: 1px solid #cccccc;

        }

        #advanced-search-form .form-group{
            margin-bottom: 20px;
            margin-left:5px;
            width: 30%;
            float:left;
            text-align: left;
        }

        #advanced-search-form .form-control{
            padding: 12px 20px;
            height: auto;
            border-radius: 2px;
        }

        #advanced-search-form .radio-inline{
            margin-left: 10px;
            margin-right: 10px;
        }

        #advanced-search-form .gender{
            width: 30%;
            margin-top: 30px;
            padding-left: 20px;
            padding-top: 10px;
            padding-bottom: 5px;
        }

        #advanced-search-form .btn{
            width: 46%;
            margin: 20px auto 0;
            display: block;
            outline: none;
        }

        @media screen and (max-width: 800px){
            #advanced-search-form .form-group{
                width: 55%;
            }

            #advanced-search-form{
                margin-top: 0;
            }
        }

        @media screen and (max-width: 560px){
            #advanced-search-form .form-group{
                width: 100%;
                margin-left: 0;
            }

            #advanced-search-form h2{
                text-align: center;
            }

            #table{
                text-align: left;
                table-layout: fixed;
                width: 100px;
                border-color: #c82333;
            }

        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Countries</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <div class="container" id="advanced-search-form">     
            <%
                HttpSession sesion = request.getSession();
                String usuario;
                String nivel;
                if (session.getAttribute("user") != null && session.getAttribute("nivel") != null) {
                    usuario = session.getAttribute("user").toString();
                    nivel = session.getAttribute("nivel").toString();
                    out.print("<a href='Login.jsp?cerrar=true'><h5>Cerrar Sesion " + usuario + "</h5></a>");
                } else {
                    out.print("<script>location.replace('Login.jsp');</script>");
                }

            %>
            <img src="CSS/Imagenes/mundo4.png" alt="" class="img-circle"/>
            <h2>Countries Data Control</h2>
            <form>
                <div class="form-group">
                    <label for="countryId">Country Id</label>
                    <input type="text" class="form-control" placeholder="Country Id" name="countryId" id="countryId">
                </div>
                <div class="form-group">
                    <label for="countryName">Country Name</label>
                    <input type="text" class="form-control" placeholder="Country Name" name="countryName" id="countryName">
                </div>
                <div class="form-group">
                    <label for="regionId">Region Id</label>
                    <select class="form-control" name="regionId">
                        <%                                for (Regions r : rr.getAll())
                                out.println("<option value=" + r.getRegionId() + ">"
                                        + r.getRegionId() + ", " + r.getRegionName() + "</option>");
                        %>
                    </select>    
                </div>
                <div class="form-group">
                    <label for="countryNumber">Country Number</label>
                    <input type="number" class="form-control" placeholder="Country Number" name="countryNumber" id="countryNumber">
                </div>                  
                <div class="clearfix"></div>
                <button type="submit" class="btn btn-info btn-lg btn-responsive" id="Guardar" value="Guardar"> <span class="glyphicon glyphicon-search"></span> Guardar</button> 
            </form>        
            <!--        
                <form>
                    <table>
                        <tr><td>Id:              </td><td><input type="text"    name="countryId"        /></td></tr>
                        <tr><td>Country Name:    </td><td><input type="text"    name="countryName"      /></td></tr>
                        <tr><td>Region Id:       </td><td>
                                <select name="regionId">
                               //     <%
                               //         for (Regions r : rr.getAll())
                               //             out.println("<option value=" + r.getRegionId() + ">"
                               //                     + r.getRegionId() + ", " + r.getRegionName() + "</option>");
                               //     %>
                                </select>    
                            </td>
                        </tr>
                        <tr><td>Country Number:  </td><td><input type="number"  name="countryNumber"    /></td></tr>                                
                        <tr>
                            <td><input type="submit" value="Guardar" class="btn btn-primary btn-sm"/></td>
                            <td><input type="reset" value="Borrar" class="btn btn-primary btn-sm"/></td>
                        </tr>                 
                    </table>   
                </form>
            -->
                <%
                    try {
                        String countryId = request.getParameter("countryId");
                        String countryName = request.getParameter("countryName");
                        int regionId = Integer.parseInt(request.getParameter("regionId"));

                        if (countryId == null || countryId.isEmpty() || countryName == null
                                || countryName.isEmpty() || countryId.contains("<") || countryName.contains("<")) {
                            out.println("<h4>Ingresar datos</h4>");
                        } else {
                            Countries countries = new Countries(countryId, countryName, regionId);
                            cr.save(countries);
                            if (countries.getCountryNumber() != 0) {
                                out.println("<h4>Se ha guardado el Country:" + countries.getCountryNumber() + "</h4>");
                            } else {
                                out.println("<h4>No se pudo guardar el Country</h4>");
                            }
                        }
                    } catch (NullPointerException | NumberFormatException e) {
                        out.println("<h4>Ingresar datos del nuevo Country</h4>");
                    } catch (Exception e) {
                        out.println("<h4>Ocurrio un error!!</h4>");
                        System.out.println("*****************************************");
                        System.out.println(e);
                        System.out.println("*****************************************");
                    }
                %>
               
                 <%
            Connection conn;
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/humanresources";
            String user = "root";
            String pass = "Amelia2015";
            Class.forName(driver);
            conn=DriverManager.getConnection(url, user, pass);
            PreparedStatement ps;
            ResultSet rs;
            ps=conn.prepareStatement("select * from countries");
            rs=ps.executeQuery();
            %>
            <div class="table-responsive">
                <h2>Countries Data List</h2>
                <table class="table table-bordered">
                    <tr>
                        <th class="danger" text="countryId" name="countryId">Country Id</th>
                        <th class="danger" text="countryName" name="countryName">Country Name</th>`
                        <th class="danger" text="regionId" name="regionId">Region Id</th>
                        <th class="danger" text="countryNumber" name="countryNumber">Country Number</th>
                    </tr>    
                    <%
                        while (rs.next()) {
                    %>
                    <tr>    
                        <td class="active"><%= rs.getString("countryId")%></td>
                        <td class="success"><%= rs.getString("countryName")%></td>
                        <td class="active"><%= rs.getString("regionId")%></td>
                        <td class="success"><%= rs.getInt("countryNumber")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>        
                   
                <form>
                    Buscar Country:<input type="text" name="buscarCountry" />
                </form>
                <%
                    String buscarCountry = request.getParameter("buscarCountry");
             //       if (buscarCountry == null || buscarCountry.isEmpty())
             //           out.println(new HtmlTable().getTable(cr.getAll()));
             //       else
                        out.println(new HtmlTable().getTable(cr.getLikeCountryName(buscarCountry)));
                %>
        </div>
    </body>
</html>

