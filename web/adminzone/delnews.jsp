<%@page import="connect.DB_manager"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DB_manager dm = new DB_manager();
    String query = "delete from news where id ='"+id+"'";
    if(dm.insertUpdateDelete(query)==true)
    {
        out.print("<script>alert('News is deleted');window.location.href='adminhome.jsp';</script>");
    }
    else{
        out.print("<script>alert('News is not deleted');window.href='adminhome.jsp';</script>");
    }
%>