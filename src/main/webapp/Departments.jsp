<%-- 
    Document   : Departments
    Created on : Mar 13, 2021, 11:01:53 AM
    Author     : GUSATAVO
--%>

<%@page import="ar.com.java.humanRes.entities.Departments"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.LocationsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_LocationsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_LocationsRepository"%>
<%@page import="ar.com.java.humanRes.connectors.Connector"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.DepartmentsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.DepartmentsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_DepartmentsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_DepartmentsRepository"%>
<%@page import="ar.com.java.humanRes.entities.Locations"%>
<%@page import="ar.com.java.humanRes.utils.html.HtmlTable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_DepartmentsRepository dr = new DepartmentsRepository(Connector.getConnection());%>
<%I_LocationsRepository lr = new LocationsRepository(Connector.getConnection());%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <style>
        html{
            background-image: url("CSS/Imagenes/background.jpg");
            background-size: auto;
            min-height: 100%;
            background-color: #cccccc;
        }

        body{
            
            background-color: #007bff; 
        }

        #advanced-search-form{
            background-size: auto;
            background-color: #fff;
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
        <title>Departments</title>
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
            <img src="CSS/Imagenes/organigrama.png" alt=""/>
            <h2>Departments List Control</h2>
            <form>
                <div class="form-group">
                    <label for="departmentId">Id:</label>
                    <input type="number" class="form-control" placeholder="Id" name="departmentId" id="departmentId">
                </div>
                <div class="form-group">
                    <label for="departmentName">Department Name</label>
                    <input type="text" class="form-control" placeholder="Department Name" name="departmentName" id="departmentName">
                </div>
                <div class="form-group">
                    <label for="firstName">Manager Id</label>
                    <input type="number" class="form-control" placeholder="Manager Id" name="managerId" id="managerId">
                </div>
                <div class="form-group">
                    <label for="locationId">Location Id</label>
                    <select class="form-control" name="locationId">
                        <%                                for (Locations l : lr.getAll())
                                out.println("<option value=" + l.getLocationId() + ">"
                                        + l.getLocationId() + ", " + l.getCountryId() + ", "
                                        + l.getStreetAddress() + "</option>");
                        %>
                    </select>    
                </div>
                <div class="clearfix"></div>
                <button type="submit" class="btn btn-info btn-lg btn-responsive" id="Guardar" value="Guardar"> <span class="glyphicon glyphicon-search"></span> Guardar</button> 
            </form>    

            <%
                try {
                    int departmentId = Integer.parseInt(request.getParameter("departmentId"));
                    String departmentName = request.getParameter("departmentName");
                    int managerId = Integer.parseInt(request.getParameter("managerId"));
                    int locationId = Integer.parseInt(request.getParameter("locationId"));

                    if (departmentName == null || departmentName.isEmpty() || departmentName.contains("<")) {
                        out.println("<h4>Ingresar datos</h4>");
                    } else {
                        Departments departments = new Departments(departmentName, managerId, locationId);
                        dr.save(departments);
                        if (departments.getDepartmentId() != 0) {
                            out.println("<h4>Se ha ingresado el Department id:" + departments.getDepartmentId() + "</h4>");
                        } else {
                            out.println("<h4>No se pudo guardar el Department</h4>");
                        }
                    }
                } catch (NullPointerException | NumberFormatException e) {
                    out.println("<h4>Ingresar datos del nuevo Department</h4>");
                } catch (Exception e) {
                    out.println("<h3>Ocurrio un error!!</h3>");
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
            ps=conn.prepareStatement("select * from departments");
            rs=ps.executeQuery();
            %>
            <div class="table-responsive">
                <h2>Departments Data List</h2>
                <table class="table table table-bordered">
                    <tr>
                        <th class="danger" text="departmentId" name="departmentId">Department Id</th>
                        <th class="danger" text="departmentName" name="departmentName">Department Name</th>
                        <th class="danger" text="managerId" name="managerId">Manager Id</th>
                        <th class="danger" text="locationId" name="locationId">Manager Id</th>
                    </tr>
                        <%
                           while(rs.next()){
                        %>
                    <tr>
                        <td class="active"><%= rs.getInt("departmentId")%></td>
                        <td class="success"><%= rs.getString("departmentName")%></td>
                        <td class="warning"><%= rs.getInt("managerId")%></td>
                        <td class="active"><%= rs.getInt("locationId")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>     
            <!--   
            <form>
                   Buscar Department:<input type="text" name="buscarDepartments" />
            </form>
            -->
            <div class="form-group">
                <label for="buscarDepartments"></label>
                <input type="text" class="form-control" placeholder="Buscar Department" name="buscarDepartments" id="buscarDepartments">
            </div>
            <div class="clearfix"></div>
            <button type="submit" class="btn btn-info btn-lg btn-responsive" name="buscarDepartments" id="buscarDepartments" value="Buscar"> <span class="glyphicon glyphicon-search"></span> Buscar Department</button>   
            </br>
            <%
                String buscarDepartments = request.getParameter("buscarDepartments");
               // if (buscarDepartments == null || buscarDepartments.isEmpty())//
                    //out.println(new HtmlTable().getTable(dr.getAll()));//
                //else//
                    out.println(new HtmlTable().getTable(dr.getLikeDepartmentName(buscarDepartments)));
            %>
        </div>
        
    </body>
</html>

