using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Contact.DataAccess;

namespace Contact.Service {

    /// <summary>
    /// Base class for all web services.
    /// </summary>
    public class ServiceBase {

        /// <summary>
        /// Gets a response to deliver to the client.
        /// </summary>
        /// <typeparam name="T">Response value type</typeparam>
        /// <param name="value">(Optional) Response value</param>
        /// <param name="validations">(Optional) Validation messages</param>
        protected Response<T> GetResponse<T>(T value = default(T), ValidationMessageCollection validations = null) {
            return new Response<T> {
                Value = value,

                // Only deliver the validations if there is a count on the collection.
                Validations = (validations != null && validations.Count == 0 ? null : validations)
            };
        }

        /// <summary>
        /// Gets the appropriate database context for the session.
        /// </summary>
        protected ContactContext GetDatabaseContext() {
            // Connect to the local database.
            return new ContactContext("name=ContactContext");
        }

        /// <summary>
        /// Handles an exception during a service call.
        /// </summary>
        /// <typeparam name="T">Expected response value type</typeparam>
        /// <param name="ex">Exception thrown</param>
        protected Response<T> HandleException<T>(Exception ex) {
            ValidationMessageCollection validations = new ValidationMessageCollection();

            // Add all of the exceptions (including inner exceptions) to the validation messages.
            do {
                validations.Add(
                    new ValidationMessage {
                        Type = ValidationType.SystemError,
                        Message = ex.Message
                    }
                );
                ex = ex.InnerException;
            } while (ex != null);

            return this.GetResponse<T>(
                validations:
                    validations
            );
        }
    }
}