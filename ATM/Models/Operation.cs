using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ATM.Models
{
    public class Operation
    {
        public int Id { get; set; }
        public DateTime Time { get; set; }

        public int OperationCodeId { get; set; }
        public OperationCode OperationCode { get; set; }
        public int CardId { get; set; } // внешний ключ
        public Card Card { get; set; }  // навигационное свойство
    }
}
