<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Register with us</title>
<style type="">
body {
    background-image: url("img/unnamed.jpg");
    background-repeat: no-repeat;
    background-position: right bottom;
    background-color: #faebd7;
	}
	
#tbl2{
	background-color: transparent;
	border: 2px solid red;
    border-radius: 5px;
	}
#tbl1{
	background-color: #FFA07A;
	border: 2px solid red;
    border-radius: 5px;
	}
	
#sbmt1 {
  margin: 0;
  padding: 0;
  border: none;
  background-color: transparent;
  display: inline-block;
  border: 2px solid red;
  cursor: pointer; 
  padding: 5px;
  }

</style>
</head>
<body>
	<div class="regnPanel">
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
						if("registered".equals(request.getParameter("q"))){
					%>
						<label><font color="Red"><strong><em>User is already registered with us</em></strong></font></label>					
					<% 
						}
					%>
					<form method="post" action="Register" name="regnPnl">
						<table id="tbl1" align="left">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
								<table id="tbl2" align="left">
									<tr>
									<td>
										<input type="text" id="defUsrId" value="Enter user id" onFocus="setUsrId();"/>
										<input type="text" id="usrId"  name="unm" value="" onBlur="chkUsrId();" style="display: none;"/>
									</td>
									<td>
									<label><%
									%></label>
									</td>
									</tr>
									<tr>
									<td>
										<input type="text" id="placeholder" value="Enter password" onFocus="setPass();"/>
										<input type="text" id="password" name="pwd" value="" onBlur="checkPass();" style="display: none;"/>
									</td>
									<td></td>
									</tr>
									<tr>
									<td>
										<input type="text" id="defConfPass" value="Confirm password" onFocus="setConfPass();"/>
										<input type="text" id="confPass" name="confPwd" value="" onBlur="checkConfPass();" style="display: none;"/>
									</td>
									<td></td>
									</tr>
									<tr>
									<td>
										<input type="text" id="defPhnNo" value="Enter Phone Number" onFocus="setPhnNo();"/>
										<input type="text" id="phnNo" name="phnNo" value="" onBlur="checkPhnNo();" style="display: none;"/>
									</td>
									<td></td>
									</tr>
									<tr>
									<td>
										<input type="text" id="defMailId" value="Enter Email ID" onFocus="setMailId();"/>
										<input type="text" id="mailId" name="mailId" value="" onBlur="checkMailId();" style="display: none;"/>
									</td>
									<td></td>
									</tr>
									<tr>
									<td>
										<select name="idCrdtTyp">
											<option value="" selected>Select ID proof Type</option>
											<option value="VoterId" >Voter ID</option>
											<option value="PAN" >PAN Card</option>
											<option value="Adhaar" >Aaddhaar Card</option>
										</select>
									</td>
									<td></td>
									</tr>
									<tr>
									<td>
										<input type="text" id="defIdCrd" value="Enter ID Number" onFocus="setIdCrd();"/>
										<input type="text" id="idCrd" name="idNo" value="" onBlur="checkIdCrd();" style="display: none;"/>
									</td>
									<td></td>
									</tr>
									<tr>
									<td>
										<button type="submit" id="sbmt1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="Red" ><em>Sign Up</em></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
									</td>
									<td></td>
									</tr>
								</table>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
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
    document.getElementById('usrId').style.display = 'inline';
    document.getElementById('usrId').focus();
}
function chkUsrId() {
    if (document.getElementById('usrId').value.length == 0) {
        document.getElementById('defUsrId').style.display = 'inline';
        document.getElementById('usrId').style.display = 'none';
    }
}
function setConfPass() {
    document.getElementById('defConfPass').style.display = 'none';
    document.getElementById('confPass').style.display = 'inline';
    document.getElementById('confPass').focus();
}
function checkConfPass() {
    if (document.getElementById('confPass').value.length == 0) {
        document.getElementById('defConfPass').style.display = 'inline';
        document.getElementById('confPass').style.display = 'none';
    }
}
function setPhnNo() {
    document.getElementById('defPhnNo').style.display = 'none';
    document.getElementById('phnNo').style.display = 'inline';
    document.getElementById('phnNo').focus();
}
function checkPhnNo() {
    if (document.getElementById('phnNo').value.length == 0) {
        document.getElementById('defPhnNo').style.display = 'inline';
        document.getElementById('phnNo').style.display = 'none';
    }
}
function setMailId() {
    document.getElementById('defMailId').style.display = 'none';
    document.getElementById('mailId').style.display = 'inline';
    document.getElementById('mailId').focus();
}
function checkMailId() {
    if (document.getElementById('mailId').value.length == 0) {
        document.getElementById('defMailId').style.display = 'inline';
        document.getElementById('mailId').style.display = 'none';
    }
}
function setIdCrd() {
    document.getElementById('defIdCrd').style.display = 'none';
    document.getElementById('idCrd').style.display = 'inline';
    document.getElementById('idCrd').focus();
}
function checkIdCrd() {
    if (document.getElementById('idCrd').value.length == 0) {
        document.getElementById('defIdCrd').style.display = 'inline';
        document.getElementById('idCrd').style.display = 'none';
    }
}
</script>
</body>
</html>