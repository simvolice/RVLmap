﻿using System;
using System.Collections.ObjectModel;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using GalaSoft.MvvmLight.Messaging;
using MyPress.Client.Model;
using MyPress.Client.View;



namespace MyPress.Client.ViewModel
{


public class TestClass
    {
        public string Category { get; set; }

        public int Number  { get; set; }

    public string Name { get; set; }



    }
    public class MainViewModel : ViewModelBase

    {

       

private object selectedItem = null;
        public object SelectedItem
        {
            get
            {
                return selectedItem;
            }
            set
            {
                // selected item has changed
                selectedItem = value;                
            }
        }


       
public ObservableCollection<TestClass> Errors { get; private set; }

      
        public MainViewModel()
        {
            

Errors = new ObservableCollection<TestClass>();
            Errors.Add(new TestClass() { Category = "Область", Number = 50 });
            Errors.Add(new TestClass() { Category = "Район", Number = 50 });
          
        
        
        
        
        
        
        }

     
        
        


       



        
        ////public override void Cleanup()
        ////{
        ////    // Clean up if needed

        ////    base.Cleanup();
        ////}



    
    
    }
}