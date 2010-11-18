using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Contact.DataAccess {

    public partial class Sample {
    }

    [CollectionDataContract]
    public sealed class SampleCollection : Collection<Sample> {

        public SampleCollection() {
        }

        public SampleCollection(IList<Sample> list)
            : base(list) {
        }
    }
}
