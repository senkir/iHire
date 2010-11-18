using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Contact.Site.Extenders {
    public static class HtmlHelperExtender {
        public static MvcHtmlString Submit(this HtmlHelper html, string value, object attributes = null) {
            TagBuilder input = new TagBuilder("input");
            input.MergeAttribute("type", "submit");
            input.MergeAttribute("value", value);
            input.MergeAttribute("name", "submit");
            input.MergeAttributes(new RouteValueDictionary(attributes));

            return MvcHtmlString.Create(
                input.ToString(TagRenderMode.SelfClosing)
            );
        }
    }
}