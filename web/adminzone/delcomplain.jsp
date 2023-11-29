<%@page import="connect.DB_manager"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DB_manager dm = new DB_manager();
    String query = "delete from response where id ='"+id+"'";
    if(dm.insertUpdateDelete(query)==true)
    {
        out.print("<script>alert('complain is deleted');window.location.href='complainmgmt.jsp';</script>");
    }
    else{
        out.print("<script>alert('complain is not deleted');window.href='complainmgmt.jsp';</script>");
    }
%>