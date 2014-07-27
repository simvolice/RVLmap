
namespace MyPress.Web
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    using System.ServiceModel.DomainServices.Hosting;
    using System.ServiceModel.DomainServices.Server;


    // Атрибут MetadataTypeAttribute идентифицирует TaskMetadata как класс,
    // который содержит дополнительные метаданные для класса Task.
    [MetadataTypeAttribute(typeof(Task.TaskMetadata))]
    public partial class Task
    {

        // Этот класс позволяет добавлять настраиваемые атрибуты к свойствам
        // класса Task.
        //
        // Например, далее свойство Xyz помечено как
        // обязательное и указан формат допустимых значений:
        //    [Required]
        //    [RegularExpression("[A-Z][A-Za-z0-9]*")]
        //    [StringLength(32)]
        //    public string Xyz { get; set; }
        internal sealed class TaskMetadata
        {

            // Классы метаданных не предназначены для создания экземпляров.
            private TaskMetadata()
            {
            }

            public Customer Customer { get; set; }

            public Nullable<int> CustomerId { get; set; }

            public string Description { get; set; }

            public Nullable<DateTime> EndDate { get; set; }

            public Project Project { get; set; }

            public Nullable<int> ProjectId { get; set; }

            public Nullable<DateTime> StartDate { get; set; }

            public int TaskId { get; set; }

            public string TaskName { get; set; }

            public EntityCollection<TimeEntry> TimeEntries { get; set; }

            public Nullable<int> UserId { get; set; }

            public EntityCollection<User> Users { get; set; }
        }
    }
}
