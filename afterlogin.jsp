<%@include file="validatesession.jsp" %> 
<%@taglib tagdir="/WEB-INF/tags" prefix="ob" %>
<%@page import="java.sql.*" %>
<%
String Name=(String)session.getAttribute("Name");
String Bdate=(String)session.getAttribute("Bdate");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","root");
Statement stat=con.createStatement();
ResultSet rs=stat.executeQuery("select * from pid where Name='"+Name+"' and Bdate='"+Bdate+"' ");
if(rs.next())
{
%>
<!DOCTYPE html>
<html>
<head>

<title>Title</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel='stylesheet' type='text/css' href='afterlogin.css'/>
	<script src="jquery-2.1.4.js"></script>
	<script type="text/javascript" src="afterlogin.js"></script>
	<script language="javascript">
	function validateFileSize(component,maxSize,msg_id,msg)
{
   if(navigator.appName=="Microsoft Internet Explorer")
   {
      if(component.value)
      {
         var oas=new ActiveXObject("Scripting.FileSystemObject");
         var e=oas.getFile(component.value);
         var size=e.size;
      }
   }
   else
   {
      if(component.files[0]!=undefined)
      {
         size = component.files[0].size;
      }
   }
   if(size!=undefined && size>maxSize)
   {
      document.getElementById(msg_id).innerHTML=msg;
      component.value="";
      component.style.backgroundColor="#eab1b1";
      component.style.border="thin solid #000000";
      component.focus();
      return false;
   }
   else
   {
      return true;
   }
}
	function validateFileExtension(component,msg_id,msg,extns)
{
   var flag=0;
   with(component)
   {
      var ext=value.substring(value.lastIndexOf('.')+1);
      for(i=0;i<extns.length;i++)
      {
         if(ext==extns[i])
         {
            flag=0;
            break;
         }
         else
         {
            flag=1;
         }
      }
      if(flag!=0)
      {
         document.getElementById(msg_id).innerHTML=msg;
         component.value="";
         component.style.backgroundColor="#eab1b1";
         component.style.border="thin solid #000000";
         component.focus();
         return false;
      }
      else
      {
         return true;
      }
   }
}
	function validation(thisform)
{
   with(thisform)
   {
      if(validateFileExtension(file, "infotable", "pdf/office/image files are only allowed!",
      new Array("jpg","pdf","jpeg","gif","png","doc","docx","xls","xlsx","ppt","txt")) == false)
      {
         return false;
      }
      if(validateFileSize(file,5000004, "infotable", "Document size should be less than 5MB !")==false)
      {
         return false;
      }
   }
}

	</script>
</head>
 

<body>


<div id="outer">
	<div id="upper_float">
		<div id="logo">
			<a href = "http://manipal.edu/mu.html"><img src="logo2.jpg"/></a>
                        </div>
                
                    <div class="container">
               <ul class="nav nav-tabs">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Info
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="afterlogin.jsp">Personal Info</a></li>
                        <li><a href="a2.jsp">Club</a></li>
                        <li><a href="a3.jsp">Startup</a></li> 
                        <li><a href="a4.jsp">Internship Information</a></li> 
                    </ul>
                </li>
               <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Competitions
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="b1.jsp">Club</a></li>
                        <li><a href="b2.jsp">Inter-Institute</a></li>
                        <li><a href="b3.jsp">Startup</a></li> 
                        <li><a href="b4.jsp">Others</a></li> 
                    </ul>
                </li>
                   <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Research
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="c1.jsp">Research Papers</a></li>
                        <li><a href="c2.jsp">Innovations</a></li>
                        <li><a href="c3.jsp">New Product Designs</a></li> 
                        <li><a href="c4.jsp">Publications</a></li>
                    </ul>
                </li>
               </ul>
               </div>
                     <div id="logout"><a href="logout.jsp">Logout</a></div>
	</div>
	<div id="mid_float">

		<div id="infotable">
		<form enctype="multipart/form-data" action="UploadImageServlet" method="post" onSubmit="return validation(this)">
		  <table id="tableid">
				<tr>
					<td id="t1">
					<img id="studimg" src="data/<%=rs.getString(10) %>" alt="Image can't be displayed"/>
					</td>
				</tr>	
				<tr>
					<td id="t2"><p><%=session.getAttribute("Name")%><br>
					  </br>
				      <input id="upload_button" type="file" name="upload_button">
					</p>
				    <p>
				      <input type="submit" name="Submit2" value="Submit">
</p></td>
				</tr>
			</table>
			
			<p>&nbsp&nbsp&nbsp&nbsp&nbsp(Max 5 MB) </p>
		</form>
		</div>

		<div id="formdiv">
			<form action="submitpersonal.jsp">
			  <table id="tableid1" width="488" height="480">
			  <caption><h3>Personal Information</h3></caption>
                <tr>
                  <td width="157" height="33px">Name</td>
                  <td width="275"><input name="f1" type="text" id="f1" value="<%=rs.getString(2) %>"></td>
                </tr>
                <tr>
                  <td height="33px">Registration Number </td>
                  <td><input name="f2" type="text" id="f2" value="<%=rs.getString(1)%>" ></td>
                </tr>
                <tr>
                  <td height="33px">Branch</td>
                  <td><input name="f3" type="text" id="f3" value="<%=rs.getString(4)%>"></td>
                </tr>
                <tr>
                  <td height="33px">Semester</td>
                  <td><input name="f4" type="text" id="f4" value="<%=rs.getString(5)%>"></td>
                </tr>
                <tr>
                  <td height="33px">Personal Mobile </td>
                  <td><input name="f5" type="text" id="f5" value="<%=rs.getString(6)%>"></td>
                </tr>
                <tr>
                  <td height="33px">Address</td>
                  <td><input name="f6" type="text" id="f6" value="<%=rs.getString(7)%>"></td>
                </tr>
                <tr>
                  <td height="33px">Email Address </td>
                  <td><input name="f7" type="text" id="f7" value="<%=rs.getString(8)%>"></td>
                </tr>
                <tr>
                  <td height="33px">Hostel</td>
                  <td><input name="f8" type="text" id="f8" value="<%=rs.getString(9)%>"></td>
                </tr>
                <tr>
                  <td height="33px">Date Of Birth </td>
                  <td><input name="f92" type="text" id="f92" value=<%=session.getAttribute("Bdate")%> disabled></td>
                </tr>
                <tr>
                  <td height="35px" colspan="2"> 
                    <div align="center">
                      <input type="submit" name="Submit" onClick="submit()" value="Submit">
                    </div></td>
                </tr>
              </table>
			</form>
		</div>
	</div>
</div>
</body>
</html>
<%
}
%>