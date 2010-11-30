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
        <td> <%=Html.EditorFor(model => model.LastName) %></td>
        <td> <%=Html.EditorFor(model => model.FirstName) %></td>
        <td> <%=Html.EditorFor(model => model.Nickname) %></td>
        <td> <%=Html.EditorFor(model => model.Address)%></td>
        <td> <%=Html.EditorFor(model => model.City)%></td>
        <td> <%=Html.EditorFor(model => model.State)%></td>
        <td> <%=Html.EditorFor(model => model.Zip)%></td>
        <td> <%=Html.EditorFor(model => model.HomePhone)%></td>
        <td> <%=Html.EditorFor(model => model.CellPhone)%></td>
        <td> <%=Html.EditorFor(model => model.WorkPhone)%></td>
        </tr>
    </table>
    </div>
</body>
</html>
