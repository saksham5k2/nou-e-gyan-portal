<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DB_manager"%>
<%
    if(request.getParameter("page").equals("changepassword"))
    {
        String userid=session.getAttribute("adminid").toString();
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        DB_manager dm = new DB_manager();
        String query = "update login set password='"+newpassword+"' where userid = '"+userid+"' and password='"+oldpassword+"'";
        if(dm.insertUpdateDelete(query)==true)
        {
            response.sendRedirect("logout.jsp");
        }
        else
        {
            out.print("<script>alert('Oldpassword does not match');window.location.href='changepassword.jsp';</script>");
        }
    }
    
    else if(request.getParameter("page").equals("response"))
    {
        String rollno=session.getAttribute("adminid").toString();
        DB_manager dm = new DB_manager();
        String query = "select * from student where rollno= '"+rollno+"'";
        ResultSet rs = dm.select(query);
        if(rs.next())
        {
            rollno = rs.getString("rollno");
            String name= rs.getString("name");
            String program= rs.getString("program");
            String branch= rs.getString("branch");
            String year= rs.getString("year");
            String contactno= rs.getString("contactno");
            String responsetype= request.getParameter("responsetype");
            String subject= request.getParameter("subject");
            String responsetext= request.getParameter("responsetext");
            
            query = "insert into response(rollno,name,program,branch,year,contactno,responsetype,subject,responsetext, responsedate) values('"+rollno+"','"+name+"','"+program+"','"+branch+"','"+year+"','"+contactno+"','"+responsetype+"','"+subject+"', '"+responsetext+"',curdate())";
            if(dm.insertUpdateDelete(query)==true)
            {
                out.print("<script>alert('Response is submitted');window.location.href='response.jsp';</script>");
            }
            else
            {
                out.print("<script>alert('Response not submitted');window.location.href='response.jsp';</script>");

            }
        }
    }
    else if(request.getParameter("page").equals("adminhome"))
    {
        String newstext=request.getParameter("newstext");
        DB_manager dm = new DB_manager();
        String query="insert into news(newstext, posteddate) values('"+newstext+"', curdate())";
        if(dm.insertUpdateDelete(query)==true)
        {
            out.print("<script>alert('News is added');window.location.href='adminhome.jsp';</script>");

        }
        else{
            out.print("<script>alert('News is not added');window.location.href='adminhome.jsp';</script>");

        }
    }
%>
