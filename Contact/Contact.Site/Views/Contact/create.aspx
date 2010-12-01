<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Contact.DataAccess.Contact>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>create</title>
</head>
<body>
    <div>
        <% using (this.Html.BeginForm("Create", "Contact")) { %>

        <%=this.Html.ValidationSummary() %>

        <%=this.Html.Hidden("contactID", 0) %>
        <table>
            <tr>
                <td>First Name:</td>
                <td><%=this.Html.EditorFor(model => model.FirstName)%></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><%=this.Html.EditorFor(model => model.LastName)%></td>
            </tr>
            <tr>
                <td>Nickname:</td>
                <td><%=this.Html.EditorFor(model => model.Nickname)%></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><%=this.Html.EditorFor(model => model.Address)%></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><%=this.Html.EditorFor(model => model.City)%></td>
            </tr>
            <tr>
                <td>State:</td>
                <td><%=this.Html.EditorFor(model => model.State)%></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td><%=this.Html.EditorFor(model => model.Zip)%></td>
            </tr>
            <tr>
                <td>Home Phone:</td>
                <td><%=this.Html.EditorFor(model => model.HomePhone)%></td>
            </tr>
            <tr>
                <td>Cell Phone:</td>
                <td><%=this.Html.EditorFor(model => model.CellPhone)%></td>
            </tr>
            <tr>
                <td>Work Phone:</td>
                <td><%=this.Html.EditorFor(model => model.WorkPhone)%></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%=this.Html.EditorFor(model => model.Email)%></td>
            </tr>
        </table>

        <%=this.Html.Submit("Submit") %>

        <% } %>
    </div>
</body>
</html>
