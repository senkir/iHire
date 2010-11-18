using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Contact.DataAccess;

namespace Contact.Service {
    
    /// <summary>
    /// Web service interface to the contact database.
    /// </summary>
    public class ContactStore : ServiceBase, IContactStore {

        /// <summary>
        /// Gets a sample record from the database by index.
        /// </summary>
        public Response<Sample> GetSample(Request<int> request) {

            try {
                // Connect to the database context.
                using (ContactContext context = this.GetDatabaseContext()) {

                    // Find the sample record in the database by Id.
                    Sample sample = context.Samples
                        .FirstOrDefault(s => s.Id == request.Value);

                    ValidationMessageCollection validations = null;

                    // If there is no sample found create a validation message.
                    if (sample == null) {

                        validations = new ValidationMessageCollection();
                        validations.Add(
                            new ValidationMessage {
                                ModelName = "request",
                                Type = ValidationType.SystemError,
                                Message = string.Format(
                                    "Unable to find Sample with Id: {0}",
                                    request.Value
                                )
                            }
                        );

                    }

                    // Return the sample/validation message.
                    return this.GetResponse<Sample>(
                        sample,
                        validations
                    );
                }
            }
            catch (Exception ex) {
                return this.HandleException<Sample>(ex);
            }
        }

        /// <summary>
        /// Gets all samples from the database.
        /// </summary>
        public Response<SampleCollection> GetSamples(Request<NoValue> request) {
            try {
                // Connect to the database context.
                using (ContactContext context = this.GetDatabaseContext()) {
                    
                    // Return the samples from the database.
                    return this.GetResponse<SampleCollection>(
                        new SampleCollection(

                            // Query the database for all samples.
                            context.Samples
                                .Select(s => s)
                                .ToArray()
                        )
                    );
                }
            }
            catch (Exception ex) {
                return this.HandleException<SampleCollection>(ex);
            }
        }

        /// <summary>
        /// Sets a sample to the database.
        /// </summary>
        public Response<NoValue> SetSample(Request<ModelCriteria<Sample>> request) {
            try {
                Sample sample = request.Value.Model;
                if (sample == null) {
                    throw new ArgumentNullException("request.Value");
                }

                // Connect to the database context.
                using (ContactContext context = this.GetDatabaseContext()) {

                    ValidationMessageCollection validations = new ValidationMessageCollection();

                    // Validate that there are no conflicts within the database.
                    var existing = context.Samples
                        .FirstOrDefault(s => s.String == sample.String && s.Integer == sample.Integer);

                    if (null != existing) {
                        validations.Add(
                            new ValidationMessage {
                                Property = "String",
                                ModelName = "request",
                                Type = ValidationType.SystemError,
                                Message = string.Format(
                                    "Sample record already exists with String: {0}",
                                    sample.String
                                )
                            }
                        );
                        validations.Add(
                            new ValidationMessage {
                                Property = "Integer",
                                ModelName = "request",
                                Type = ValidationType.SystemError,
                                Message = string.Format(
                                    "Sample record already exists with Integer: {0}",
                                    sample.Integer
                                )
                            }
                        );
                    }

                    // Save the changes to the database if there are no validation errors.
                    if (validations.Count == 0) {

                        // Attach the record to the context and update the state to be based upon the request.
                        context.Samples.Attach(sample);
                        context.ObjectStateManager.ChangeObjectState(sample, request.Value.State);

                        // Perform the update to the database.
                        // There should only ever be one record changed in the database.
                        if (1 != context.SaveChanges()) {
                            validations.Add(
                                new ValidationMessage {
                                    ModelName = "request",
                                    Type = ValidationType.SystemError,
                                    Message = "Sample failed to save to database"
                                }
                            );
                        }
                    }

                    return this.GetResponse<NoValue>(
                        validations:
                            validations
                    );

                }
            }
            catch (Exception ex) {
                return this.HandleException<NoValue>(ex);
            }
        }

    }
}
