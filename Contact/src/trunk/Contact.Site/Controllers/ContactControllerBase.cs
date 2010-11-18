using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Contact.Service;

namespace Contact.Site.Controllers
{
    /// <summary>
    /// Base controller for all controllers within the project.
    /// </summary>
    public class ContactControllerBase : Controller
    {
        protected ContactControllerBase() {

            // Connect to the contact store service.
            this.ContactStore = new ContactStore();
        }

        /// <summary>
        /// Gets the interface to the contact store service.
        /// </summary>
        protected IContactStore ContactStore { get; private set; }

        /// <summary>
        /// Gets a request to submit to the service.
        /// </summary>
        /// <typeparam name="T">Request value type</typeparam>
        /// <param name="value">(Optional) Request value</param>
        /// <param name="validations">(Optional) Validation messages</param>
        protected Request<T> GetRequest<T>(T value = default(T), ValidationMessageCollection validations = null) {
            return new Request<T> {
                Value = value,

                // Only deliver the validations if there is a count on the collection.
                Validations = (null != validations && 0 == validations.Count ? null : validations)
            };
        }

        /// <summary>
        /// Gets a view based upon a response.  Automatically handles any web exceptions.
        /// </summary>
        /// <typeparam name="T">Response type value</typeparam>
        /// <param name="response">Web response</param>
        /// <param name="viewName">(Optional) View name</param>
        protected ActionResult GetView<T>(Response<T> response, string viewName = null) {

            // Handle any web exceptions as necessary.
            var result = this.HandleWebExceptions(response);
            if (null != result) {
                return result;
            }

            return this.View(viewName, response.Value);
        }

        /// <summary>
        /// Handle web exceptions.
        /// </summary>
        /// <param name="response">Web response</param>
        protected ActionResult HandleWebExceptions(Response response) {

            // If there are any system errors then redirect to the error page.
            if (null != response && null != response.Validations && response.Validations.ContainsMessageType(ValidationType.SystemError)) {

                // TODO Handle web exceptions.
                throw new NotImplementedException();
            }
            
            return null;
        }

        /// <summary>
        /// Handles an exception during a web request.
        /// </summary>
        /// <param name="ex">Exception thrown</param>
        protected ActionResult HandleException(Exception ex) {

            // TODO Handle unexpected exceptions.
            throw new NotImplementedException();
        }
    }
}
