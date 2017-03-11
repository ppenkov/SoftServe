namespace HRManagement.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Project
    {
        public Project()
        {
            Intermediates = new HashSet<Intermediate>();
            Juniors = new HashSet<Junior>();
            Seniors = new HashSet<Senior>();
            TeamLeaders = new HashSet<TeamLeader>();
            Trainees = new HashSet<Trainee>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Name")]
        public string ProjectName { get; set; }

        [DisplayName("Manager")]
        public int? ManagerID { get; set; }

        public virtual ICollection<Intermediate> Intermediates { get; set; }

        public virtual ICollection<Junior> Juniors { get; set; }

        public virtual ProjectManager ProjectManager { get; set; }

        public virtual ICollection<Senior> Seniors { get; set; }

        public virtual ICollection<TeamLeader> TeamLeaders { get; set; }

        public virtual ICollection<Trainee> Trainees { get; set; }
    }
}
