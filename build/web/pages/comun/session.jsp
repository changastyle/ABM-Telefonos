<%@page import="com.google.gson.Gson"%>
<%@page import="modelo.login.Usuario"%>
<!-- MUESTRO SI ESTOY SESSIONADO:-->
<%
    String usrJSON = (String) request.getSession().getAttribute("usuario");

    Usuario usuario = null;
    if(usrJSON != null)
    {
        usuario = new Gson().fromJson(usrJSON, Usuario.class) ;
        //out.print(usuario.toString());
    }
    else
    {
        response.sendRedirect("../login/login.jsp");
    }
%>