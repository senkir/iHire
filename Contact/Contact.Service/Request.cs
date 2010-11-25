using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Contact.Service {

    /// <summary>
    /// Provides a standard base class for all web service requests.
    /// </summary>
    [DataContract]
    public class Request : IValidationProvider {

        /// <summary>
        /// Gets the collection of validations.
        /// </summary>
        [DataMember]
        public ValidationMessageCollection Validations { get; set; }

    }

    /// <summary>
    /// Strongly typed request containing a value parameter.
    /// </summary>
    /// <typeparam name="T">Generic value type. For no specific type use Void.</typeparam>
    public class Request<T> : Request {

        /// <summary>
        /// Gets/sets the value of the request.
        /// </summary>
        [DataMember]
        public T Value { get; set; }
    }
}
