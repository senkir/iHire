using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Contact.DataAccess;
using Contact.Service;

/// <summary>
/// A Detailed view of a Contact in the Database
/// </summary>
namespace Contact.Site.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class DetailController : ContactControllerBase
    {
        //
        // GET: /Detailed/
        public ActionResult Index(int id = 1)
        {
            try
            {
                // Form a request for contact info
                var contactRequest = new Request<int>
                {
                    Value = id
                };
                // View the contact
                return this.GetView(

                    // Get the contact from the web service.
                    this.ContactStore.GetContact(contactRequest)
                );
            }
            catch (Exception ex)
            {
                return this.HandleException(ex);
            }
        }
    }

}
