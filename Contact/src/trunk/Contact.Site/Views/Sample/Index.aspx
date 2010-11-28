<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Contact.DataAccess.SampleCollection>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
</head>
<body>
    <div>
        <%=this.Html.ActionLink("Create New", "Details") %>
        <table>
            <tr>
                <th>Id</th>
                <th>String</th>
                <th>Integer</th>
            </tr>
            <%
                foreach (var sample in this.Model) {
                    
                    // controller
                                // action
                                // id
                                // http://localhost/Controller/Action/Id
                                // http://localhost/Sample/
                                // http://localhost/Sample/Index/
                    // http://localhost/Sample/Index/?var=test&foo=bar
            %>
            <tr>
                <td>
                    <%= this.Html.ActionLink(
                            this.Html.Encode(sample.Id),
                            "Details",
                            new
                            {
                                id = sample.Id
                            },
                            new
                            {
                                target = "_new",
                                style = "font-weight: bold:",
                                @class = "my_link"
                            }
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
