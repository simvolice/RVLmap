using System;

namespace MyPress.Client.Model
{
    public class DataService : IDataService
    {
        
       
        public void GetData(Action<DataDemo, Exception> callback)
        {


            var item = new DataDemo();
            callback(item, null);


            
        }
    }
}