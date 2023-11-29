
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DB_manager"%>
<%
    if(request.getParameter("page").equals("contact_us"))
    {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String contactno = request.getParameter("contactno");
        String emailaddress = request.getParameter("email");
        String enquirytext = request.getParameter("enquirytext");
        
        DB_manager db = new DB_manager();
        
        String query="insert into enquiry(name,gender,address,contactno, emailaddress, enquirytext, enquirydate)values('"+name+"','"+gender+"','"+address+"','"+contactno+"','"+emailaddress+"','"+enquirytext+"',curdate())";
        boolean res=db.insertUpdateDelete(query);
        if (res==true)
        {
            out.print("<script>alert('Enquiry is submitted'); window.location.href='contact_us.jsp';</script>");
            
        }
        else{
            out.print("<script>alert('Enquiry is not submitted'); window.location.href='contact_us.jsp';</script>");

        }
    }
    else if(request.getParameter("page").equals("Registration"))
    {
        String rollno=request.getParameter("rollno");
        String name=request.getParameter("name");
        String fname=request.getParameter("fname");
        String mname=request.getParameter("mname");
        String gender=request.getParameter("gender");
        String address=request.getParameter("address");
        String program=request.getParameter("program");
        String branch=request.getParameter("branch");
        String year=request.getParameter("year");
        String contactno=request.getParameter("contactno");
        String emailaddress=request.getParameter("emailaddress");
        String password=request.getParameter("password");
        String usertype="student";
        DB_manager db = new DB_manager();
        String query1="insert into student values('"+rollno+"','"+name+"','"+fname+"','"+mname+"','"+gender+"','"+address+"','"+program+"','"+branch+"','"+year+"','"+contactno+"','"+emailaddress+"', curdate())";
        String query2= "insert into login values('"+rollno+"','"+password+"','"+usertype+"')";
        if(db.insertUpdateDelete(query1)==true)
        {
            if(db.insertUpdateDelete(query2)==true)
            {
            out.print("<script>alert('Registration is done.'); window.location.href='Registration.jsp';</script>");
            
            }
        }
            else{
            out.print("<script>alert('Registration is not done.'); window.location.href='Registration.jsp';</script>");
            }
        }
        else if(request.getParameter("page").equals("login"))
        {
            String userid=request.getParameter("userid");
            String password=request.getParameter("password");
            String query="select * from login where userid='"+userid+"' and password='"+password+"'";
            DB_manager dm =new DB_manager();
            ResultSet rs = dm.select(query);
            if(rs.next())
            {
                String usertype=rs.getString("usertype");
                if(usertype.equals("student"))
                {
                    session.setAttribute("studentid", userid);
                    response.sendRedirect("studentzone/studenthome.jsp");
                }
                else if(usertype.equals("admin"))
                {
                    session.setAttribute("adminid",userid);
                    response.sendRedirect("adminzone/adminhome.jsp");
                }
            }
            else
            {
                out.print("<script>alert('Invalid User'); window.location.href='login.jsp';</script>");
            }
        }
    
%>