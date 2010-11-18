<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Contact.DataAccess.SampleCollection>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
</head>
<body>
    <div>
        <table>
            <tr>
                <th>Id</th>
                <th>String</th>
                <th>Integer</th>
            </tr>
            <%
                foreach (var sample in this.Model) {
            %>
            <tr>
                <td>
                    <%= this.Html.ActionLink(
                            this.Html.Encode(sample.Id),
                            "Details",
                            new { id = sample.Id }
                        )
                    %>
                </td>
                <td><%=sample.String %></td>
                <td><%=sample.Integer %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
