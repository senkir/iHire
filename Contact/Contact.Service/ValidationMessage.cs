using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Contact.Service {

    /// <summary>
    /// Describes the type of validation message.
    /// </summary>
    [DataContract]
    public enum ValidationType {

        /// <summary>
        /// Describes a hard system failure.  This is usually due to an exception in the service or data access layer.
        /// </summary>
        [EnumMember]
        SystemError,

        /// <summary>
        /// Describes an invalid input that needs to be corrected.
        /// </summary>
        [EnumMember]
        Error,

        /// <summary>
        /// Describes an input that is suggested against.
        /// </summary>
        [EnumMember]
        Warning
    }

    /// <summary>
    /// Stores necessary information to determine what is incorrect.
    /// </summary>
    [DataContract]
    public sealed class ValidationMessage {

        /// <summary>
        /// Gets the type of validation message.
        /// </summary>
        [DataMember]
        public ValidationType Type { get; internal set; }

        /// <summary>
        /// Gets the association between a model name and this message.
        /// </summary>
        [DataMember]
        public string ModelName { get; internal set; }

        /// <summary>
        /// Gets the data type of the associated model.
        /// </summary>
        [DataMember]
        public string DataType { get; internal set; }

        /// <summary>
        /// Gets the property name that caused this message.  If this
        /// is null then the message is associated with a combination
        /// of properties or the entire model.
        /// </summary>
        [DataMember]
        public string Property { get; internal set; }

        /// <summary>
        /// Gets the index of the associated collection that associats to a specific model.
        /// </summary>
        [DataMember]
        public int Index { get; set; }

        /// <summary>
        /// Gets the message content.
        /// </summary>
        [DataMember]
        public string Message { get; internal set; }

        /// <summary>
        /// Gets/sets whether or not the validation has been accepted.
        /// This only affects validation messages that are warnings.
        /// </summary>
        [DataMember]
        public bool Accepted { get; set; }

    }

    /// <summary>
    /// Strongly typed collection of validation messages.
    /// </summary>
    [CollectionDataContract]
    public class ValidationMessageCollection : Collection<ValidationMessage> {

        /// <summary>
        /// Gets whether or not the collection contains a message of a specific type.
        /// </summary>
        public bool ContainsMessageType(ValidationType type) {
            return (this.FirstOrDefault(v => (type == v.Type)) != null);
        }
    }
}
