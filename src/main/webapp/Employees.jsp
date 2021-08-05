<%-- 
    Document   : Employees
    Created on : Mar 9, 2021, 9:18:12 AM
    Author     : GUSATAVO
--%>

<%@page import="ar.com.java.humanRes.entities.Employees"%>
<%@page import="ar.com.java.humanRes.connectors.Connector"%>
<%@page import="ar.com.java.humanRes.connectors.Connector"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.EmployeesRepository"%>
<%@page import="ar.com.java.humanRes.repositories.jdbc.EmployeesRepository"%>
<%@page import="ar.com.java.humanRes.repositories.interfaces.I_EmployeesRepository"%>
<%@page import="ar.com.java.humanRes.utils.html.HtmlTable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_EmployeesRepository er = new EmployeesRepository(Connector.getConnection());%>
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
        <title>Employees</title>
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
            <img src="CSS/Imagenes/empleados2.jpg" alt=""/>
            <h2>Employees Data</h2>
            <form>
                <div class="form-group">
                    <label for="employeeId">Id:</label>
                    <input type="text" class="form-control" placeholder="Id" name="employeeId" id="employeeId">
                </div>
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" placeholder="First Name" name="firstName" id="firstName">
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" placeholder="Last Name" name="lastName" id="lastName">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" placeholder="Email" name="email" id="email">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="phone" class="form-control" placeholder="Phone Number" name="phoneNumber" id="phoneNumber">
                </div>
                <div class="form-group">
                    <label for="hireDate">Hire Date</label>
                    <input type="text" class="form-control" placeholder="Hire Date" name="hireDate" id="hireDate">
                </div>
                <div class="form-group">
                    <label for="jobId">Job Id</label>
                    <input type="text" class="form-control" placeholder="Job Id" name="jobId" id="jobId">
                </div>
                <div class="form-group">
                    <label for="salary">Salary</label>
                    <input type="number" class="form-control" placeholder="Salary" name="salary" id="salary">
                </div>
                <div class="form-group">
                    <label for="commissionPct">Commission Pct</label>
                    <input type="number" class="form-control" placeholder="Commission Pct" name="commisionPct" id="commissionPct">
                </div>
                <div class="form-group">
                    <label for="managerId">Manager Id</label>
                    <input type="text" class="form-control" placeholder="Manager Id" name="managerId" id="managerId">
                </div>
                <div class="form-group">
                    <label for="departmentId">Department Id</label>
                    <input type="text" class="form-control" placeholder="Department Id" name="departmentId" id="departmentId">
                </div>
                <div class="clearfix"></div>
                <button type="submit" class="btn btn-info btn-lg btn-responsive" id="Guardar" value="Guardar"> <span class="glyphicon glyphicon-search"></span> Guardar</button>
            </form>
            <%            try {
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String email = request.getParameter("email");
                    String phoneNumber = request.getParameter("phoneNumber");
                    String hireDate = request.getParameter("hireDate");
                    String jobId = request.getParameter("jobId");
                    int salary = Integer.parseInt(request.getParameter("salary"));
                    int commisionPct = Integer.parseInt(request.getParameter("commisionPct"));
                    int managerId = Integer.parseInt(request.getParameter("managerId"));
                    int departmentId = Integer.parseInt(request.getParameter("departmentId"));

                    if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty()
                            || email == null || email.isEmpty() || phoneNumber == null || phoneNumber.isEmpty()
                            || hireDate == null || hireDate.isEmpty() || jobId == null || jobId.isEmpty()
                            || firstName.contains("<") || lastName.contains("<") || email.contains("<") || email.contains("<")
                            || phoneNumber.contains("<") || hireDate.contains("<") || jobId.contains("<")) {
                        out.println("<h3>Ingresar datos</h3>");
                    } else {
                        Employees employees = new Employees(firstName, lastName, email, phoneNumber, hireDate, jobId, salary, commisionPct, managerId, departmentId);
                        er.save(employees);
                        if (employees.getEmployeeId() != 0) {
                            out.println("<h3>Se guardo el Employee id:" + employees.getEmployeeId() + "</h3>");
                        } else {
                            out.println("<h3>No se pudo guardar el Employee</h3>");
                        }

                    }
                } catch (NullPointerException | NumberFormatException e) {
                    out.println("<h3>Ingresar datos del nuevo Employee</h3>");
                } catch (Exception e) {
                    out.println("<h3>Ocurrio un error!!</h3>");
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
                ps = conn.prepareStatement("select * from employees");
                rs = ps.executeQuery();
            %>
            <div class="table-responsive">
                <h2>Employees List</h2>
                <table class="table table-bordered">
                    <tr>
                        <th class="danger" text="employeeId" name="employeeId">Employee Id</th>
                        <th class="danger" text="firstName" name="firstName">First Name</th>
                        <th class="danger" text="lastName" name="lastName">Last Name</th>
                        <th class="danger" text="email" name="email">Email</th>
                        <th class="danger" text="phoneNumber" name="phoneNumber">Phone Number</th>
                        <th class="danger" text="hireDate" name="hireDate">Hire Date</th>
                        <th class="danger" text="jobId" name="jobId">Job Id</th>
                        <th class="danger" text="salary" name="salary">Salary</th>
                        <th class="danger" text="commisionPct" name="commisionPct">Commission</th>
                        <th class="danger" text="managerId" name="managerId">Manager Id</th>
                        <th class="danger" text="departmentId" name="departmentId">Department Id</th>
                        
                    </tr>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="active"><%= rs.getInt("employeeId")%></td>
                        <td class="active"><%= rs.getString("firstName")%></td>
                        <td class="active"><%= rs.getString("lastName")%></td>
                        <td class="success"><%= rs.getString("email")%></td>
                        <td class="success"><%= rs.getString("phoneNumber")%></td>
                        <td class="success"><%= rs.getString("hireDate")%></td>
                        <td class="success"><%= rs.getString("jobId")%></td>
                        <td class="success"><%= rs.getInt("salary")%></td>
                        <td class="active"><%= rs.getInt("commisionPct")%></td>
                        <td class="active"><%= rs.getInt("managerId")%></td>
                        <td class="active"><%= rs.getInt("departmentId")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>     
            <form>
                Buscar Empleado:<input type="text" name="buscarEmployee" />
            </form>
            <%        String buscarEmployee = request.getParameter("buscarEmployee");
               // if (buscarEmployee == null || buscarEmployee.isEmpty()) {//
                 //   out.println(new HtmlTable().getTable(er.getAll()));//
               // } else {//
                    out.println(new HtmlTable().getTable(er.getLikeLastName(buscarEmployee)));

            %>    

        </div>
    </body>
</html>

