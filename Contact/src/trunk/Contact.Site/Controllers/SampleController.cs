using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Contact.DataAccess;
using Contact.Service;

namespace Contact.Site.Controllers
{
    /// <summary>
    /// Sample controller for maintaining and viewing sample records.
    /// </summary>
    public class SampleController : ContactControllerBase
    {
        /// <summary>
        /// Display a list of samples.
        /// </summary>
        public ActionResult Index()
        {
            try {
                // View the samples collection.
                return this.GetView(

                    // Get the samples from the web service.
                    this.ContactStore.GetSamples(
                        this.GetRequest<NoValue>()
                    )
                );
            }
            catch (Exception ex) {
                return this.HandleException(ex);
            }
        }

        /// <summary>
        /// Display the editable details of a specific sample.
        /// </summary>
        /// <param name="id">Unique identifier</param>
        public ActionResult Details(int? id) {
            try {

                // If there is no ID then this will be a new record.
                if (!id.HasValue) {
                    this.ViewData["EntityState"] = EntityState.Added;
                    return this.View();
                }

                // Default to modified.
                this.ViewData["EntityState"] = EntityState.Modified;

                // View the individual sample record.
                return this.GetView(

                    // Get the sample from the web service.
                    this.ContactStore.GetSample(
                        this.GetRequest<int>(id.Value)
                    )
                );
            }
            catch (Exception ex) {
                return this.HandleException(ex);
            }
        }

        /// <summary>
        /// Saves a model to the web services.
        /// </summary>
        /// <param name="model">Model values</param>
        /// <param name="state">State to update the model to</param>
        /// <param name="submit">Button that was pressed</param>
        [HttpPost]
        public ActionResult Save(Sample model, EntityState state, string submit) {
            try {

                // If the model is not valid then do not continue and display the model again.
                if (this.ModelState.IsValid) {
                    return this.View("Details", model);
                }

                // Update the state to be deleted.
                if ("Delete" == submit) {
                    state = EntityState.Deleted;
                }

                // Request that the sample is deleted.
                var response = this.ContactStore.SetSample(

                    // Get the request populated with the input model and state.
                    this.GetRequest<ModelCriteria<Sample>>(
                        new ModelCriteria<Sample> {
                            Model = model,
                            State = state
                        }
                    )
                );

                // Handle any system errors as necessary.
                var result = this.HandleWebExceptions(response);
                if (null != result) {
                    return result;
                }

                // Redirect to the home page.
                return this.RedirectToAction("Index");
            }
            catch (Exception ex) {
                return this.HandleException(ex);
            }
        }

    }
}
