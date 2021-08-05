<%-- 
    Document   : Login
    Created on : Apr 11, 2021, 9:11:34 PM
    Author     : GUSATAVO
--%>
<%@page import="ar.com.java.humanRes.model.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <style>
        html{
    background-color: #3c3838;
}

body{
    background-color: transparent;
}

#log-in-form{
    margin: 230px auto 0;
    padding: 10px;
    color: white;
    height: auto;
    max-width: 800px;
    background-image: url("CSS/Imagenes/notebook-chill.jpg");
    background-size: cover;
}

#log-in-form .heading{
	text-align: center;
    margin-top: 50px;
    margin-bottom: 70px;
}
#log-in-form .form-group{
    float: left;
    width: 28%;
    margin-left: 40px;
}

#log-in-form .form-control{
    padding: 15px 25px;
    height: auto;
}

#log-in-form .form-group-btn{
    width: 15%;
    margin-left: 70px;
}

#log-in-form .btn{
    padding: 13px 32px;
}

#log-in-form .checkbox{
    float: left;
    margin: 15px 0 50px 40px;
}


@media screen and (max-width: 800px){
    #log-in-form{
        margin: 20px;
    }

    #log-in-form .form-group{
        width: 60%;
        float: none;
        margin: 10px auto;
    }

    #log-in-form .form-group-btn{
        margin-top: 30px;
    }

    #log-in-form .btn{
        width: 100%;
    }

    #log-in-form .checkbox{
        width: 60%;
        float: none;
        margin: 15px auto 50px auto;
    }
}

@media screen and (max-width: 600px){
    #log-in-form .form-group,
    #log-in-form .checkbox{
        width: 90%;
    }
}
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Log In</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="styles.css">    
    </head>
<body>
    <div class="container" id="log-in-form">
        <div class="heading">
            <h1>Log In Your Account</h1>
        </div>
            <form method="POST" action="Login.jsp">
            <div class="form-group">
                <input type="text" class="form-control" name="usuario" id="username" placeholder="Enter username">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="contra" id="pwd" placeholder="Enter password">
            </div>
            <div class="form-group form-group-btn">
                <button type="submit" name="btnIngresar" class="btn btn-success btn-lg">Log In</button>
            </div>
            <div class="clearfix"></div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Remember me</label>
            </div>
        </form>
     
        <%
          Operaciones op = new Operaciones();
          if(request.getParameter("btnIngresar")!=null){
              String usuario=request.getParameter("usuario");
              String contra=request.getParameter("contra");
              HttpSession sesion = request.getSession();
              switch(op.loguear(usuario, contra)){
                case 1:
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("nivel","1");
                    response.sendRedirect("Indice.jsp");
                break;
                case 2:
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("nivel","2");
                    response.sendRedirect("Employees.jsp");
                break;
                case 3:
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("nivel","3");
                    response.sendRedirect("Jobs.jsp");
                break;
                case 4:
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("nivel","4");
                    response.sendRedirect("RRHH.jsp");
                    
                default:
                     out.write("usuario no existe, o password incorrecto");
                break;
            }
           }
           if(request.getParameter("cerrar")!=null){
               session.invalidate();    
            }
        %>
    </body>
</html>
