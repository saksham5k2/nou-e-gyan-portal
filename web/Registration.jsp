<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>nouegyan</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.bundle.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    
    
    <!-- navbar section end -->
    <!-- footer start -->
    <!--main section start -->
    
    <div class ="row">
        <div class="col-sm-12" style ="background-color:pink; min-height: 500px;"> 
            <h2 style="text-align: center; color: blue;">Student Registration form</h2>
            <form method="post" class="form-group" action="controller.jsp">
                <input type="hidden" name="page" value="Registration"/>
                <table class="table table-bordered" style="width: 70%; margin:auto;">
                    <tr>
                        <td>
                          Enter Roll no.  
                        </td>
                        <td>
                            <input type="number" name="rollno" class="form-control" required/>  
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                          Enter name  
                        </td>
                        <td>
                            <input type="text" name="name" class="form-control" required/>  
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                          Enter Father's name  
                        </td>
                        <td>
                            <input type="text" name="fname" class="form-control" required/>  
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                          Enter Mother's name  
                        </td>
                        <td>
                            <input type="text" name="mname" class="form-control" required/>  
                        </td>
                    </tr>
                    
                     <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            <input type="radio" name = "gender" value="male" class="form-check-input" required/>Male
                            <input type="radio" name = "gender" value="female" class="form-check-input" required/>Female
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter Address
                        </td>
                        <td>
                            <textarea name="address" class="form-control"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Select Program
                        </td>
                        <td>
                            <select name="program" class="form-control">
                                <option selected>-Select Program-</option>
                                <option value="B.Tech.">B.Tech.</option>
                                <option value="M.Tech.">M.Tech.</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Select Branch
                        </td>
                        <td>
                            <select name="branch" class="form-control">
                                <option selected>-Select Branch-</option>
                                <option value="CS">Computer Science</option>
                                <option value="IT">Information Technology</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Select Year
                        </td>
                        <td>
                            <select name="year" class="form-control">
                                <option selected>-Select Year-</option>
                                <option value="First Year">First Year</option>
                                <option value="Second Year">Second Year</option>
                                <option value="Third Year">Third Year</option>
                                <option value="Final Year">Final Year</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter Contact No.
                        </td>
                        <td>
                            <input type="number" name = "contactno" class="form-control"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Enter Email Address
                        </td>
                        <td>
                            <input type="email" name= "emailaddress" class="form-control" required/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Enter Password
                        </td>
                        <td>
                            <input type="password" name = "password" class="form-control" required/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Confirm Password
                        </td>
                        <td>
                            <input type="password" name= "confirmpassword" class="form-control" required/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <button type="submit" name = "submit" class="btn btn-success">Register</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    
    <jsp:include page="footer.jsp"/>
    
    <!--main section end -->
    
</body>
</html>