<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, org.bloodbanker.dto.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Blood Available</title>
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
	String sql;
	String locId = request.getParameter("srchLoc");
	String bldGrp = request.getParameter("bloodgroup");

	User user = (User)session.getAttribute("User");
	Boolean bISLoggedIn = (Boolean)session.getAttribute("LoggedIn");
	boolean loginFailed = false;
	if(bISLoggedIn instanceof Boolean && !bISLoggedIn.booleanValue())
		loginFailed = "LoginFailed".equals(request.getParameter("q"));
	
	if(locId==null || locId.isEmpty()){
		response.sendRedirect("index.jsp?locChosen=N");
		return;
	}
	
	session.setAttribute("srchLoc", locId);
	
	if(bldGrp==null || bldGrp.isEmpty()){
		session.setAttribute("bloodgroup","");
		//SELECT INST_NM,ADDRESS,BLOOD_GRP,AVAILABLITY,UOM FROM INSTITS JOIN SUPPLY ON SUPPLY.INSTIT_ID = INSTITS.INSTIT_ID AND SUPPLY.LOC_ID = INSTITS.LOC_ID
		sql = "SELECT INST_NM,ADDRESS,BLOOD_GRP,AVAILABLITY,UOM FROM INSTITS JOIN SUPPLY ON SUPPLY.INSTIT_ID = INSTITS.INSTIT_ID AND SUPPLY.LOC_ID = INSTITS.LOC_ID WHERE INSTITS.LOC_ID='"+locId+"'";
	}else{
		session.setAttribute("bloodgroup", bldGrp);
		sql = "SELECT INST_NM,ADDRESS,AVAILABLITY,UOM FROM INSTITS JOIN SUPPLY ON SUPPLY.INSTIT_ID = INSTITS.INSTIT_ID AND SUPPLY.LOC_ID = INSTITS.LOC_ID WHERE INSTITS.LOC_ID='"+locId+"' AND SUPPLY.BLOOD_GRP='"+bldGrp+"'";
	}
	
	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	
	%>
	<div class="SearchPnl">
	<h1></h1>
	
		<table style="width:100%">
			<tr>
				<td style="width:50%">
					<table>
						<tr>
							<td colspan="5">
								<img src="img/Blood_Banker_Profile_pic_1__400x400.jpg" alt="Blood banker" height="450" width="450"/>
							</td>
						</tr>
					</table>
				</td>
				<td style="width:50%">
					<%
				
				
				if((bISLoggedIn instanceof Boolean) && (bISLoggedIn.booleanValue())){ %>
					<form method="post" action="login" name="logoutPnl">
						<table id="tbl3">
							<tr>
							<td><em>Hi&nbsp;&nbsp;&nbsp;<%=user.getUsername() %></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><button type="submit" value="Search" name="SignOut" id="sbmt3"><pre><u>Sign Out</u></pre></button></td>
							</tr>
						</table>
					</form>
				<%}else{ 
				
					if(loginFailed){%>
						<label><font color="Red"><strong><em>Enter Correct user details</em></strong></font></label>
					<% }%>
				<form method="post" action="login" name="loginPnl">
				   <table style="width:50%" id="tbl1">
				   
					<tr>
						<td colspan="2"><input type="text" id="defUsrId" value="Enter user id" onFocus="setUsrId();"/>
							<input type="text" id="userId"  name="unm" value="" onBlur="chkUsrId();" style="display: none;"/></td>
						<td><input type="text" id="placeholder" value="Enter password here" onFocus="setPass();"/>
							<input type="password" id="password" name="pwd" value="" onBlur="checkPass();" style="display: none;"/></td>
						<td colspan="2"><button type="submit" value="Search" name="SignIn" id="sbmt1"><pre><font color="Red"><strong><em>Sign in</em></strong></font></pre></button></td>
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
				<form action="Search" method="post">
						<table id="tbl2">
							<tbody>
								<%
								int i=0;
								while(rs.next()){ 
									if(i++==0){%>
										<tr>
											<th align="center"><font color="Red">Institution</font></th>
											<th><font color="Red">Address</font></th>
											<th><font color="Red">Availability</font></th>
										</tr>
										<tr>
											<td colspan="3"><font color="Red">----------------------------------------------------------------------------------</font></td>
										</tr>
									<% }
								%>
								<tr>
									<td><font color="Red"><%=rs.getString("INST_NM") %></font></td>
									<td><font color="Red"><%=rs.getString("ADDRESS") %></font></td>
									<td><font color="Red"><%
										if(bldGrp==null || bldGrp.isEmpty()){
											String strbldgrp = rs.getString("BLOOD_GRP");
											strbldgrp = strbldgrp.replace("Pos", "+");
											strbldgrp = strbldgrp.replace("Neg", "-");
											%>
											
											<label><%=strbldgrp %></label>
										<%} %>
										<%=rs.getString("AVAILABLITY") %> <%=rs.getString("UOM") %></font>
									</td>
								</tr>
								<%} %>
								<% if(i==0){ %>
								<tr>
									<td><label><font color="Red">Sorry, we don't have any information about your blood group :(</font></label></td>
								</tr>
								<%} %>
							</tbody>
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