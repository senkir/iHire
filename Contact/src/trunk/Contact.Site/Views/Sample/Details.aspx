<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Contact.DataAccess.Sample>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Details</title>
</head>
<body>
    <div>
        <% using (this.Html.BeginForm("Save", "Sample")) { %>
        <%=this.Html.Hidden("state", this.ViewData["EntityState"]) %>
        <%=this.Html.HiddenFor(model => model.Id) %>
        <table>
            <tr>
                <td>String:</td>
                <td><%=this.Html.EditorFor(model => model.String)%></td>
            </tr>
            <tr>
                <td>Integer:</td>
                <td><%=this.Html.EditorFor(model => model.Integer)%></td>
            </tr>
        </table>

        <%=this.Html.Submit("Submit") %>
        <%=this.Html.Submit("Delete") %>

        <% } %>
    </div>
</body>
</html>
