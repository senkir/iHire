using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Contact.Service {

    /// <summary>
    /// Standard criteria for performing updates to models.
    /// </summary>
    /// <typeparam name="T">Model type</typeparam>
    [DataContract]
    public class ModelCriteria<T>
        where T : EntityObject {

        /// <summary>
        /// Gets/sets the model value.
        /// </summary>
        [DataMember]
        public T Model { get; set; }

        /// <summary>
        /// Gets/sets the state to set the model to when updating.
        /// </summary>
        [DataMember]
        public EntityState State { get; set; }
    }
}