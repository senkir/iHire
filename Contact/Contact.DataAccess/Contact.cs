using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Contact.DataAccess
{
    public partial class Contact
    {
    }

    [CollectionDataContract]
    public sealed class ContactCollection : Collection<Contact>
    {

        public ContactCollection()
        {
        }

        public ContactCollection(IList<Contact> list)
            : base(list)
        {
        }
    }
}
