
<%
    if(session.getAttribute("studentid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else
    {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NOU - Student Zone</title>
        <link href="../css/bootstrap.css" rel="stylesheet"/>
    </head>
    <body>
        <div>
            <jsp:include page="header.jsp"/>
            
            <div class="row">
                <div class="col-sm-12" style="background-color: pink; min-height: 600px;">
                    <h2 style="color: blue; text-align: center;">Submit your response</h2>
                    <form class="form-group" method="post" action="studentcontroller.jsp">
                        <input type="hidden" name="page" value="response"/>
                        <table style="margin: auto; width: 60%" class="table table-bordered">
                            <tr>
                                <td>
                                    Select the response type
                                </td>
                                <td>
                                    <select name="responsetype" class="form-control">
                                        <option selected>-Select response </option>
                                        <option value="feedback">Feedback</option>
                                        <option value="complain">Complain</option>
                                    </select>
                                </td>
                            </tr>
                            
                            <</td>
                            </tr>
                            <tr>
                                <td>Enter Subject</td>
                                <td>
                                    <input type="text" name="subject" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Response Text</td>
                                <td>
                                    <textarea name="responsetext" class="form-control"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            
            
            <jsp:include page="footer.jsp"/>
        </div>
 
    </body>
</html>
<% 
    }
%>