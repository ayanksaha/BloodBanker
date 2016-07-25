<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, org.bloodbanker.dto.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Blood Banker</title>
<style type="text/css">
  #sbmt2 {
  margin: 0;
  padding: 0;
  border: none;
  background-color: transparent;
  display: inline-block;
  cursor: pointer; }
  
  #sbmt1 {
  margin: 0;
  padding: 0;
  border: none;
  background-color: transparent;
  display: inline-block;
  border: 2px solid red;
  cursor: pointer; }
  
  #sbmt3 {
  margin: 0;
  padding: 0;
  border: none;
  background-color: transparent;
  display: inline-block;
  cursor: pointer; }
  
  body {
    background-image: url("img/unnamed.jpg");
    background-repeat: no-repeat;
    background-position: right bottom;
    background-color: #faebd7;
	}

#tbl1{
	background-color: #FFA07A;
	border: 2px solid red;
    border-radius: 5px;
	}
	
#tbl2{
	background-color: #FFA07A;
	border: 2px solid red;
    border-radius: 5px;
	}
	
#tbl3{
	background-color: #FFA07A;
	border: 2px solid red;
    border-radius: 5px;
	}
	
</style>
</head>
<body>
<% 

	Connection conn = (Connection) request.getServletContext().getAttribute("conn");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT LOC_ID,LOCATION_NAME FROM LOCATIONS");
	
%>
<div class="loginPanel">
	
		<table style="width:100%">
			<tr>
				<td>
					<table style="width:50%">
					<tr>
					<td colspan="5">
						<img src="img/Blood_Banker_Profile_pic_1__400x400.jpg" alt="Blood banker" height="450" width="450"/>
					</td>
					</tr>
					</table>
				</td>
				<td>
				<%
				
				User user = (User)session.getAttribute("User");
				Boolean bISLoggedIn = (Boolean)session.getAttribute("LoggedIn");
				
				if((bISLoggedIn instanceof Boolean) && (bISLoggedIn.booleanValue())){ %>
					<form method="post" action="login" name="logoutPnl">
						<table id="tbl3">
							<tr>
							<td><em>Hi&nbsp;&nbsp;&nbsp;<%=user.getUsername() %></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><button type="submit" name="SignOut" id="sbmt3"><pre><u>Sign Out</u></pre></button></td>
							</tr>
						</table>
					</form>
				<%}else{ 
				
					if("LoginFailed".equals(request.getParameter("q"))){%>
						<label><font color="Red"><strong><em>Enter Correct user details</em></strong></font></label>
					<% }%>
				<form method="post" action="login" name="loginPnl">
				   <table style="width:50%" id="tbl1">
				   
					<tr>
						<td colspan="2"><input type="text" id="defUsrId" value="Enter user id" onFocus="setUsrId();"/>
							<input type="text" id="userId"  name="unm" value="" onBlur="chkUsrId();" style="display: none;"/></td>
						<td><input type="text" id="placeholder" value="Enter password here" onFocus="setPass();"/>
							<input type="password" id="password" name="pwd" value="" onBlur="checkPass();" style="display: none;"/></td>
						<td colspan="2"><button type="submit" name="SignIn" id="sbmt1"><pre><font color="Red"><strong><em>Sign in</em></strong></font></pre></button></td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="ForgotPassword.jsp">Forgot Password</a>
						</td>
						<td colspan="2">
							<a href="Regn.jsp">Sign up</a>
						</td>
					</tr>
					<tr></tr>
					</table>
				</form>
				<%} %>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<% if("N".equals(request.getParameter("locChosen"))){ %>
					<label><font color="Red"><strong><em>Enter Location</em></strong></font></label>
				<%} %>
				<form method="post" action="search" name="SrchPnl">
					<table id="tbl2">
					  <tr>
						<td>
							<select name="srchLoc">
								<option value="" selected>Choose your Location</option>
								<%
								while(rs.next()){ 
								 String loc=rs.getString("LOCATION_NAME");
								 String locID=rs.getString("LOC_ID");%>
								<option value="<%=locID %>"><%=loc %></option>
				  				<%} %>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="bloodgroup">
								<option value="" selected>Choose Blood group</option>
								<option value="APos">A+</option>
								<option value="ANeg">A-</option>
								<option value="BPos">B+</option>
								<option value="BNeg">B-</option>
								<option value="OPos">O+</option>
								<option value="ONeg">O-</option>
							</select>
							<button type="submit" id="sbmt2"><img src="img/9cpxLaBcE.jpg" alt="submit" height="20" width="20"/></button>
						</td>
					  </tr>
					</table>
				</form>
			</td>
			</tr>
  		</table>
</div>

<script type="text/javascript">
function setPass() {
    document.getElementById('placeholder').style.display = 'none';
    document.getElementById('password').style.display = 'inline';
    document.getElementById('password').focus();
}
function checkPass() {
    if (document.getElementById('password').value.length == 0) {
        document.getElementById('placeholder').style.display = 'inline';
        document.getElementById('password').style.display = 'none';
    }
}
function setUsrId() {
    document.getElementById('defUsrId').style.display = 'none';
    document.getElementById('userId').style.display = 'inline';
    document.getElementById('userId').focus();
}
function chkUsrId() {
    if (document.getElementById('userId').value.length == 0) {
        document.getElementById('defUsrId').style.display = 'inline';
        document.getElementById('userId').style.display = 'none';
    }
}
</script>
</body>
</html>