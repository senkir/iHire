using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Contact.Service {

    /// <summary>
    /// Interface for a providing a collection of validation messages.
    /// </summary>
    internal interface IValidationProvider {

        /// <summary>
        /// Gets the collection of validations.
        /// </summary>
        ValidationMessageCollection Validations { get; }
    }
}
