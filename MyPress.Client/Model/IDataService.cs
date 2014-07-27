using System;

namespace MyPress.Client.Model
{
    public interface IDataService
    {
        void GetData(Action<DataDemo, Exception> callback);
    }
}
