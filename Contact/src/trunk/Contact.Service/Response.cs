using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Contact.Service {

    /// <summary>
    /// Provides a standard base class for all web service responses.
    /// </summary>
    [DataContract]
    public class Response : IValidationProvider {

        /// <summary>
        /// Gets the collection of validations.
        /// </summary>
        [DataMember]
        public ValidationMessageCollection Validations { get; internal set; }
    }

    /// <summary>
    /// Strongly typed response containing a value parameter.
    /// </summary>
    /// <typeparam name="T">Generic value type. For no specific type use Void.</typeparam>
    public class Response<T> : Response {
        
        /// <summary>
        /// Gets/sets the value of the response.
        /// </summary>
        [DataMember]
        public T Value { get; set; }
    }
}
