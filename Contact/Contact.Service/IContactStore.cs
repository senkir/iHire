using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Contact.DataAccess;

namespace Contact.Service {

    /// <summary>
    /// Provides an interface to the contact store.
    /// </summary>
    [ServiceContract]
    public interface IContactStore {

        /// <summary>
        /// Gets a sample record from the database by index.
        /// </summary>
        [OperationContract]
        Response<Sample> GetSample(Request<int> request);

        ///<summary>
        /// Get contact information from the database by index.
        ///</summary>
        [OperationContract]
        Response<DataAccess.Contact> GetContact(Request<int> request);

        /// <summary>
        /// Gets all samples from the database.
        /// </summary>
        [OperationContract]
        Response<SampleCollection> GetSamples(Request<NoValue> request);

        /// <summary>
        /// Sets a sample to the database.
        /// </summary>
        [OperationContract]
        Response<NoValue> SetSample(Request<ModelCriteria<Sample>> request);

        [OperationContract]
        Response<NoValue> DeleteContact(Request<int> request);

        /// <summary>
        /// Creates contact information to the database.
        /// </summary>
        [OperationContract]
        Response<NoValue> CreateContact(Request<DataAccess.Contact> request);

        /// <summary>
        /// Gets all contacts from the database.
        /// </summary>
        [OperationContract]
        Response<ContactCollection> GetContacts(Request<NoValue> request);
    }
}
