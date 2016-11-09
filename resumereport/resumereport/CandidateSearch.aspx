<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CandidateSearch.aspx.cs" Inherits="resumereport.CandidateSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>   Resume Builder Report  </title>
   <link rel="stylesheet" href="datepicker/jquery.ui.all.css">
	<link rel="stylesheet" href="css/main_style.css">
	<script src="datepicker/jquery-1.4.4.js"></script>
	<script src="datepicker/jquery.ui.core.js"></script>
	<script src="datepicker/jquery.ui.widget.js"></script>
	<script src="datepicker/jquery.ui.datepicker.js"></script>
    <link rel="stylesheet" href="datepicker/demos.css">
	
  <script>	
	$(function(){
	var pickerOpts = {
		dateFormat:'mm/dd/yy'
	};  
	$("#txtDate").datepicker(pickerOpts);
	$("#TextBox2").datepicker(pickerOpts);
	$("#TextBox3").datepicker(pickerOpts);
	$("#TextBox4").datepicker(pickerOpts);
});
</script>
</head>
<body>
       <form id="form1" runat="server" >
    <div>
  
        <table width="90%" style="display:block">

            <tr>
                <td  align="left">
                    <asp:Label ID="Label2" runat="server"  Font-Bold="True" Font-Size="Medium"  Text="Search By:" ForeColor="Black"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td width="25%">
                       <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Registration Date Range"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="25%">
                       <asp:Label ID="Label1" runat="server" Text="Start Date :"></asp:Label>
                </td>
                <td width="25%">
                     <asp:TextBox ID="txtDate" class="datepicker" runat="server" type="date" style="margin-right: 0px" ></asp:TextBox>
                </td>
                <td width="25%">
                     <asp:Label ID="Label3" runat="server" Text="End Date:"></asp:Label>
                </td>
                <td align="right" width="25%">
                    <asp:TextBox ID="TextBox2" class="datepicker" runat="server" type="date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="25%">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Updated Date Range"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="25%">
                    <asp:Label ID="Label5" runat="server" Text="Start Date:"></asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox ID="TextBox3" type="date" class="datepicker" runat="server"></asp:TextBox>
                </td>
                <td width="25%">
                    <asp:Label ID="Label6" runat="server" Text="End Date:"></asp:Label>
                </td>
                <td width="25%" align="right">
                    <asp:TextBox ID="TextBox4" type="date" class="datepicker" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="25%">
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Name:"></asp:Label>
                </td width="25%">
                <td width="25%">
                    <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td align="right"><asp:Button ID="Button1" runat="server" type="button"  Text="Show Report" Width="92px" OnClick="Button1_Click" /></td>
            </tr>
        </table>  
                 
     </div>      
                                                                         
                                                                         
    </form>
</body>
</html>
  
                 

          


  

  

   
                             
   
        
   
   
   
   
               
   
   
                                                                  

        
        
