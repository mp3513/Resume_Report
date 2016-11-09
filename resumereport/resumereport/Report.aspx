<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="resumereport.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">
       function openWindow(code,width,height) {

           var center_left = (screen.width / 2) - (width / 2);
           var center_top = (screen.height / 2) - (height / 2);
           window.open('..\\Resume\\viewresume.asp?email=' + code, 'open_window', " width=" + width + ", height=" + height + ", left=" + center_left + ", top=" + center_top);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
     
   
        <table>
		<tr>
		<td colspan="2" >
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go Back" />         
			</td>
			</tr>
         
        <tr>
		<td align="left">
            Total Records:<% Response.Write(totalRecords);%>       
			</td>
           <td align="right">     
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save as CSV" />
             </td>
			</tr>   
        
          <tr>
		<td colspan="2" >  
            <asp:GridView ID="GridView1" runat="server"   OnPageIndexChanging="OnPaging" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Font-Size="11pt" GridLines="None" PageSize="50" style="margin-top: 3px" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                     
                    <asp:TemplateField  HeaderText="Name">
                    <ItemTemplate >
                        <asp:Hyperlink ID="hyperlink1" Runat="server" NavigateUrl='<%#Eval("EMAIL","..\\Resume\\viewresume.asp?email={0}")%>' onclick="window.open(this.href, 'popupwindow', 'width=400,height=300,scrollbars,resizable'); return false;" Text='<%# Eval("LASTNAME") + " " + Eval("FIRSTNAME") %>'></asp:Hyperlink >                     
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:BoundField DataField="EMAIL" HeaderText="Email Address" />
                    <asp:BoundField DataField="STATE" HeaderText="City" />
                    <asp:BoundField DataField="ADDRESS2" HeaderText="State" />
                    <asp:BoundField DataField="ZIP" HeaderText="Zip" />
                    <asp:BoundField DataField="COUNTRYFIELD" HeaderText="Country" />
                    <asp:BoundField DataField="submitted_on" HeaderText="Registered On" />
                    <asp:BoundField DataField="UPDATED" HeaderText="Updated" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               
            </asp:GridView>
 </td>
			</tr>
			</table>
     
    </form>
    </body>
</html>
