<%@page import="connect.DB_manager"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DB_manager dm = new DB_manager();
    String query = "delete from enquiry where id ='"+id+"'";
    if(dm.insertUpdateDelete(query)==true)
    {
        out.print("<script>alert('Enquiry is deleted');window.location.href='enquirymgmt.jsp';</script>");
    }
    else{
        out.print("<script>alert('Enquiry is not deleted');window.href='enquirymgmt.jsp';</script>");
    }
%>