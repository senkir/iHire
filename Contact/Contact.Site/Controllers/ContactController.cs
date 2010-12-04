using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Contact.Service;

namespace Contact.Site.Controllers
{
    public class ContactController : ContactControllerBase
    {
        //
        // GET: /Contact/

        public ActionResult Index()
        {
            var result = this.ContactStore.GetContacts(this.GetRequest<NoValue>());
            return View(result.Value);
        }

        public ActionResult Create()
        {
            //
            return View();
        }
        [HttpPost]
        public ActionResult Create(DataAccess.Contact contact)
        {
            this.ContactStore.CreateContact(this.GetRequest<DataAccess.Contact>(contact));

            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id) {

            //formulate a request for the contact
            var contactRequest = new Request<int> {
                Value = id
            };

            //Delete the contact info
            this.ContactStore.DeleteContact(contactRequest);

            return this.RedirectToAction("Index");
        }

    }
}
