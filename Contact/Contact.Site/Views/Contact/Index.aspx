<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Contact.DataAccess.ContactCollection>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Index</title>
</head>
<body>
    <div>
        <%=this.Html.ActionLink("Create New", "Create") %>
        <table border="1">
            <tr>
                <th>Contact ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Nickname</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zip</th>
                <th>Home Phone</th>
                <th>Cell Phone</th>
                <th>Work Phone</th>
                <th>E-Mail</th>
            </tr>
            <%
                foreach (var contact in this.Model) {
                    //
                
            %>
            <tr>
                <td><%=contact.ContactID %></td>
                <td><%=contact.FirstName %></td>
                <td><%=contact.LastName %></td>
                <td><%=contact.Nickname %></td>
                <td><%=contact.Address %></td>
                <td><%=contact.City %></td>
                <td><%=contact.State %></td>
                <td><%=contact.Zip %></td>
                <td><%=contact.HomePhone %></td>
                <td><%=contact.CellPhone %></td>
                <td><%=contact.WorkPhone %></td>
                <td><%=contact.Email %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
