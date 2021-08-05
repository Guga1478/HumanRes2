<%-- 
    Document   : Locations
    Created on : Mar 10, 2021, 9:43:22 AM
    Author     : GUSATAVO
--%>

<%@page import="ar.com.java.humanRes.repositories.jdbc.CountriesRepository"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.CountriesRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_CountriesRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_CountriesRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_CountriesRepository"%>
<%@page import="ar.com.java.humanRes.connectors.Connector"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.LocationsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.LocationsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_LocationsRepository"%>
<%@page import="ar.com.java.humanRes.entities.Locations"%>
<%@page import="ar.com.java.humanRes.entities.Countries"%>
<%@page import="ar.com.java.humanRes.utils.html.HtmlTable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_LocationsRepository lr = new LocationsRepository(Connector.getConnection());%>
<%I_CountriesRepository cr= new CountriesRepository(Connector.getConnection());%>
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
        <title>Locations</title>
       <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <div class="container" id="advanced-search-form">
            <%
          HttpSession sesion = request.getSession();
          String usuario;
          String nivel;
          if(session.getAttribute("user")!=null && session.getAttribute("nivel")!=null){
              usuario=session.getAttribute("user").toString();
              nivel=session.getAttribute("nivel").toString();
              out.print("<a href='Login.jsp?cerrar=true'><h5>Cerrar Sesion " + usuario + "</h5></a>");
            }else{
               out.print("<script>location.replace('Login.jsp');</script>");
            }
          
        %>
        <h2>Locations Data Control</h2>
        <form>
            <div class="form-group">
                    <label for="locationId">Location Id</label>
                    <input type="number" class="form-control" placeholder="Location Id" name="locationId" id="locationId">
                </div>
            <div class="form-group">
                    <label for="streetAddress">Street Address</label>
                    <input type="text" class="form-control" placeholder="Street Address" name="streetAddress" id="streetAddress">
                </div>
            <div class="form-group">
                    <label for="postalCode">Postal Code</label>
                    <input type="text" class="form-control" placeholder="Postal Code" name="postalCode" id="postalCode">
                </div>
            <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" class="form-control" placeholder="City" name="city" id="city">
                </div>
            <div class="form-group">
                    <label for="stateProvince">State Province</label>
                    <input type="text" class="form-control" placeholder="State Province" name="stateProvince" id="stateProvince">
                </div>
            <div class="form-group">
                    <label for="countryId">Country Id</label>
                    <select class="form-control" name="countryId">
                    <%
                                for(Countries c: cr.getAll())
                                out.println("<option value="+ c.getCountryId()+">"+
                                c.getCountryId()+", "+c.getCountryName()+"</option>");                            
                            %>
                        </select>
                 </div> 
                <div class="clearfix"></div>
                <button type="submit" class="btn btn-info btn-lg btn-responsive" id="Guardar" value="Guardar"> <span class="glyphicon glyphicon-search"></span> Guardar</button> 
        <%
            try{
            String streetAddress = request.getParameter("streetAddress");
            String postalCode = request.getParameter("postalCode");
            String city = request.getParameter("city");
            String stateProvince = request.getParameter("stateProvince");
            String countryId = request.getParameter("countryId");
            
            
            if(streetAddress == null || streetAddress.isEmpty() || postalCode == null ||
            postalCode.isEmpty() || city == null || city.isEmpty() || stateProvince == null || 
            stateProvince.isEmpty() || countryId == null || countryId.isEmpty() || streetAddress.contains("<") || postalCode.contains("<") || 
            city.contains("<") || stateProvince.contains("<") || countryId.contains("<"))
            {
                    out.println("<h4>Ingresar datos</h4>");            
            }else{
                  Locations locations = new Locations(streetAddress, postalCode, city, stateProvince, countryId);
                  lr.save(locations);
                  if(locations.getLocationId()!=0){
                         out.println("<h4>Se guardo la location id:" + locations.getLocationId() + "</h4>");
                }
            }
        } catch (NullPointerException | NumberFormatException e) { out.println("<h4>Ingresar datos de la nueva Location</h4>");
            } catch (Exception e) {
                out.println("<h4>Ocurrio un error!!</h4>");
                System.out.println("*****************************************");
                System.out.println(e);
                System.out.println("*****************************************");
                }
        %>                
    
        <%         Connection conn;
                String driver = "com.mysql.cj.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/humanresources";
                String user = "root";
                String pass = "Amelia2015";
                Class.forName(driver);
                conn = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps;
                ResultSet rs;
                ps = conn.prepareStatement("select * from locations");
                rs = ps.executeQuery();
            %>
     <div class="table-responsive">
                <h2>Locations List</h2>
                <table class="table table-bordered">
                    <tr>
                        <th class="danger" text="locationId" name="locationId">Location Id</th>
                        <th class="danger" text="streetAddress" name="streetAddress">Street Address</th>
                        <th class="danger" text="postalCode" name="postalCode">Postal Code</th>
                        <th class="danger" text="city" name="city">City</th>
                        <th class="danger" text="stateProvince" name="stateProvince">State Province</th>
                        <th class="danger" text="countryId" name="countryId">Country Id</th>
                    </tr>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="active"><%= rs.getInt("locationId")%></td>
                        <td class="active"><%= rs.getString("streetAddress")%></td> 
                        <td class="success"><%= rs.getString("postalCode")%></td>
                        <td class="success"><%= rs.getString("city")%></td>
                        <td class="active"><%= rs.getString("stateProvince")%></td>
                        <td class="active"><%= rs.getString("countryId")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>     
            
    <form>
           Buscar Location:<input type="text" name="buscarLocation" />
    </form>
    <%
        String buscarLocation = request.getParameter("buscarLocation");
            out.println(new HtmlTable().getTable(lr.getByCity(buscarLocation)));              
    %>
        </div>
     </body>    
</html>

