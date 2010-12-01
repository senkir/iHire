<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Contact.DataAccess.Contact>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Detailed Contact View</title>
</head>
<body>
    <div>
    <table>
        <tr>
            <td>Last Name</td>
            <td>First Name</td>
            <td>Nickname</td>
            <td>Address</td>
            <td>City</td>
            <td>State</td>
            <td>Zip</td>
            <td>Home Phone</td>
            <td>Cell Phone</td>
            <td>Work Phone</td>
        </tr>
        <tr>
        <td> <%=Model.LastName %></td>
        <td> <%=Model.FirstName %></td>
        <td> <%=Model.Nickname %></td>
        <td> <%=Model.Address%></td>
        <td> <%=Model.City%></td>
        <td> <%=Model.State%></td>
        <td> <%=Model.Zip%></td>
        <td> <%=Model.HomePhone%></td>
        <td> <%=Model.CellPhone%></td>
        <td> <%=Model.WorkPhone%></td>
        </tr>
    </table>
    </div>
        <div>
    <%=Html.ActionLink("Delete", "DeleteContact",
        new { id = Model.ContactID }
            )%>
        </div>
</body>
</html>
