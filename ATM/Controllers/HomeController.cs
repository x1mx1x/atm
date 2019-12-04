using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ATM.Models;
using Microsoft.EntityFrameworkCore;

namespace ATM.Controllers
{

    public class HomeController : Controller
    {

        public ActionResult StartPage()
        {
            db.Users.Add(new User() {Name = "Anastasia", Surname = "Pribytkova", Patronymic = "Andreevna"});
            db.SaveChanges();

            return View("StartPage");
        }
        public ActionResult PINCode()
        {
            return View();
        }
        public ActionResult ErrorMessage()
        {
            return View();
        }
        public ActionResult Operations()
        {
            return View();
        }
        public ActionResult Balance()
        {
            return View();
        }
        public ActionResult WithdrawalResult()
        {
            return View();
        }
        public ActionResult CashWithdrawal()
        {
            return View();
        }

        private ATMContext db;
        public HomeController(ATMContext context)
        {
            db = context;
        }
        public static string messErr;
        public static int AttemptCounter;
        public static string CurrentCardNumber;
        public static double CurrentCardBalance;
        public static double WasWithdrawn;



        [HttpPost]
        public IActionResult SearchCard(Card card)
        {
            
            List<Card> cards = db.Cards.Where(a => a.CardNumber == (card.CardNumber)).ToList();
            
            if (cards.Count <= 0)
            {
                messErr = "Данная карта не существует или была удалена";
                return PartialView("ErrorMessage");
            }
            else {
                CurrentCardNumber = card.CardNumber;
                 return PartialView("PINCode");
            }
        }


        [HttpPost]
        public IActionResult WithdrawCash(Card card)
        {

            Card card1 = (from c in db.Cards
                          where c.CardNumber == CurrentCardNumber
                          select c).Single();

            if (card.Balance>card1.Balance)
            {
                messErr = "На вашем счету недостаточно средств =(";
                return PartialView("ErrorMessage");
            }
            else
            {
                //добавить сюда добавление операции в таблицу операций
                WasWithdrawn = card.Balance;
                card1.Balance -= card.Balance;
                CurrentCardBalance = card1.Balance;

                Operation op = new Operation
                {
                    CardId = card1.Id,
                    OperationCodeId = 2,
                    Time = DateTime.Now
                };
                db.Operations.Add(op);
                db.SaveChanges();
                return PartialView("WithdrawalResult");
            }
        }


        [HttpPost]
        public IActionResult GetAccess(Card card)
        {

            Card card1 = (from c in db.Cards
                          where c.CardNumber == CurrentCardNumber
                          select c).Single();


            if (card.PINCode == card1.PINCode && !card1.IsBlocked)
            {
                card1.AttemptCounter = 0;
                db.SaveChanges();
                return View("Operations");
            }
            else {

                card1.AttemptCounter++;
                if (card1.AttemptCounter == 4||card.IsBlocked) {
                    card1.IsBlocked = true;
                    
                    messErr = "Введен неправильный пин-код: Карта заблокирована!";
                }
                else messErr = "Введен неправильный пин-код. После 4-ой попытки карта будет заблокирована!";

                db.SaveChanges();
                return PartialView("ErrorMessage");
            }
        }


        [HttpGet]
        public IActionResult GetBalancePage()
        {
            Card card1 = (from c in db.Cards
                          where c.CardNumber == CurrentCardNumber
                          select c).Single();
            Operation op = new Operation
            {
                CardId = card1.Id,
                OperationCodeId = 1,
                Time = DateTime.Now
            };
            db.Operations.Add(op);
            db.SaveChanges();

            CurrentCardBalance = card1.Balance;
            return PartialView("Balance");
        }

        [HttpGet]
        public IActionResult GetOperationPage()
        {
            return PartialView("Operations");
        }
        [HttpGet]
        public IActionResult GetWithdrawalPage()
        {
            return PartialView("CashWithdrawal");
        }
        



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
