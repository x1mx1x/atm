using Microsoft.EntityFrameworkCore;

namespace ATM.Models
{
    public class ATMContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Card> Cards { get; set; }
        public DbSet<Operation> Operations { get; set; }
        public DbSet<Operation> OperationCodes { get; set; }

        public ATMContext(DbContextOptions<ATMContext> options)
                : base(options)
        {
            Database.EnsureCreated();
        }
    }
}
