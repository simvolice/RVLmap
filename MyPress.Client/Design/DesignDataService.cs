using System;
using MyPress.Client.Model;

namespace MyPress.Client.Design
{
    public class DesignDataService : IDataService
    {
        public void GetData(Action<DataDemo, Exception> callback)
        {
          




            var item = new DataDemo();
            callback(item, null);
        }
    }
}