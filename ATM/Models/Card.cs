using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ATM.Models
{
    public class Card
    {
        public int Id { get; set; }
        public string CardNumber { get; set; }
        public double Balance { get; set; }
        public string PINCode { get; set; }
        public bool IsBlocked { get; set; }
        public int AttemptCounter { get; set; }
        

        public int UserId { get; set; } // внешний ключ
        public User User { get; set; }  // навигационное свойство


        public List<Operation> Operations { get; set; }
    }
}
