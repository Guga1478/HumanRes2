<%-- 
    Document   : Jobs
    Created on : Mar 11, 2021, 8:55:16 AM
    Author     : GUSATAVO
--%>

<%@page import="ar.com.java.humanRes.connectors.Connector"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.JobsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.JobsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_JobsRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_JobsRepository"%>
<%@page import="ar.com.java.humanRes.entities.Jobs"%>
<%@page import="ar.com.java.humanRes.utils.html.HtmlTable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_JobsRepository jr = new JobsRepository(Connector.getConnection());%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <style>
        html{
           
            background-size: auto;
            min-height: 100%;
        }

        body{
            background-color: #007bff; 
            background-image: url("CSS/Imagenes/background.jpg");
        }

        #advanced-search-form{
            background-size: auto;
            background-color: lightcyan;
            max-width: 1200px;
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
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jobs</title>
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
            <h2>Jobs Control List</h2>
            <form>
                <div class="form-group">
                    <label for="jobId">Job Id:</label>
                    <input type="text" class="form-control" placeholder="Job Id" name="jobId" id="jobId">
                </div>
                <div class="form-group">
                    <label for="jobTitle">Job Title:</label>
                    <input type="text" class="form-control" placeholder="Job Title" name="jobTitle" id="jobTitle">
                </div>
                <div class="form-group">
                    <label for="minSalary">Min Salary:</label>
                    <input type="number" class="form-control" placeholder="Min Salary" name="minSalary" id="minSalary">
                </div>
                <div class="form-group">
                    <label for="maxSalary">Max Salary:</label>
                    <input type="number" class="form-control" placeholder="Max Salary" name="maxSalary" id="maxSalary">
                </div>
                <div class="form-group">
                    <label for="controlNumber">Control Number:</label>
                    <input type="number" class="form-control" placeholder="Control Number" name="controlNumber" id="controlNumber">
                </div>
                <div class="clearfix"></div>
                <button type="submit" class="btn btn-info btn-lg btn-responsive" id="Guardar" value="Guardar"> <span class="glyphicon glyphicon-search"></span> Guardar</button>
            </form>
            
            <%            try {
                    String jobId = request.getParameter("jobId");
                    String jobTitle = request.getParameter("jobTitle");
                    int minSalary = Integer.parseInt(request.getParameter("minSalary"));
                    int maxSalary = Integer.parseInt(request.getParameter("maxSalary"));
                    int controlNumber = Integer.parseInt(request.getParameter("controlNumber"));

                    if (jobId == null || jobId.isEmpty() || jobTitle == null
                            || jobTitle.isEmpty() || jobId.contains("<") || jobTitle.contains("<")) {
                        out.println("<h4>Ingresar datos</h4>");
                    } else {
                        Jobs jobs = new Jobs(jobId, jobTitle, minSalary, maxSalary);
                        jr.save(jobs);
                        if (jobs.getControlNumber() != 0) {
                            out.println("<h4>Se ha guardado la informacion" + jobs.getControlNumber() + "</h4>");
                        }
                    }
                } catch (NullPointerException | NumberFormatException e) {
                    out.println("<h4>Ingresar datos </h4>");
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
                ps = conn.prepareStatement("select * from jobs");
                rs = ps.executeQuery();
            %>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <tr>
                        <th class="danger" text="jobId" name="jobId">Job Id</th>
                        <th class="danger" text="jobTitle" name="jobTitle">Job Title</th>
                        <th class="danger" text="minSalary" name="minSalary">Min Salary</th>
                        <th class="danger" text="maxSalary" name="maxSalary">Max Salary</th>
                        <th class="danger" text="controlNumber" name="controlNumber">Control Number</th>
                    </tr>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="active"><%= rs.getString("jobId")%></td>
                        <td class="success"><%= rs.getString("jobTitle")%></td>
                        <td class="warning"><%= rs.getInt("minSalary")%></td>
                        <td class="active"><%= rs.getInt("maxSalary")%></td>
                        <td class="success"><%= rs.getInt("controlNumber")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>     
            <form>
                Buscar Jobs:<input type="text" name="buscarJobs" />
            </form>
            <%
                String buscarJobs = request.getParameter("buscarJobs");
                    out.println(new HtmlTable().getTable(jr.getLikeJobTitle(buscarJobs)));
            %>
        </div>
    </body>

</html>

