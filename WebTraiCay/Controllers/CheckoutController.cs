using API_NganLuong;
using WebTraiCay.Models;
using WebTraiCay.nganluonAPI;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using PayPal.Api;
using ShopCayCanh.Paypal;
using WebTraiCay.Common;

namespace WebTraiCay.Controllers
{
    public class CheckoutController : BaseController
    {
        private Payment payment;
        private const string SessionCart = "SessionCart";
        private readonly double VND = 23000;
        WebTraiCayDbContext db = new WebTraiCayDbContext();
        public ActionResult Index()
        {
            var cart = Session[SessionCart];
            var list = new List<Cart_item>();
            if (cart != null)
            {
                list = (List<Cart_item>)cart;
            }
            return View(list);

        }
        [HttpPost]
        public ActionResult Index(Morder order)
        {
            Random rand = new Random((int)DateTime.Now.Ticks);
            int numIterations = 0;
            numIterations = rand.Next(1, 100000);
            DateTime time = DateTime.Now;

            string orderCode = numIterations + "" + time;
            string sumOrder = Request["sumOrder"];
            string payment_method = Request["option_payment"];
            // Neu Ship COde
            if (payment_method.Equals("COD"))
            {
                // cap nhat thong tin sau khi dat hang thanh cong

                saveOrder(order, "COD", 2, orderCode);
                var cart = Session[SessionCart];
                var list = new List<Cart_item>();
                ViewBag.cart = (List<Cart_item>)cart;
                Session["SessionCart"] = null;
                var listProductOrder = db.Orderdetails.Where(m => m.orderid == order.ID);
                return View("payment");
            }
            //Neu Thanh toan Ngan Luong
            else if (payment_method.Equals("NL"))
            {
                string str_bankcode = Request["bankcode"];
                RequestInfo info = new RequestInfo();
                info.Merchant_id = nganluongInfo.Merchant_id;
                info.Merchant_password = nganluongInfo.Merchant_password;
                info.Receiver_email = WebTraiCay.nganluonAPI.nganluongInfo.Receiver_email;
                info.cur_code = "vnd";
                info.bank_code = str_bankcode;
                info.Order_code = orderCode;
                info.Total_amount = sumOrder;
                info.fee_shipping = "0";
                info.Discount_amount = "0";
                info.order_description = "Thanh toán ngân lượng cho đơn hàng";
                info.return_url = nganluongInfo.return_url;
                info.cancel_url = nganluongInfo.cancel_url;
                info.Buyer_fullname = order.deliveryname;
                info.Buyer_email = order.deliveryemail;
                info.Buyer_mobile = order.deliveryphone;
                APICheckoutV3 objNLChecout = new APICheckoutV3();
                ResponseInfo result = objNLChecout.GetUrlCheckout(info, payment_method);
                // neu khong gap loi gi
                if (result.Error_code == "00")
                {
                    saveOrder(order, "Cổng thanh toán Ngân Lượng", 2, orderCode);
                    // chuyen sang trang ngan luong
                    return Redirect(result.Checkout_url);
                }
                else
                {
                    ViewBag.errorPaymentOnline = result.Description;
                    return View("payment");
                }

            }
            else if (payment_method.Equals("PAYAPAL"))
            {
                APIContext apiContext = PaypalConfig.GetAPIContext();
                try
                {
                    string payerId = Request.Params["PayerID"];
                    if (string.IsNullOrEmpty(payerId))
                    {
                        string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/Checkout/CallBackOrderPaypal?";
                        var guid = Convert.ToString((new Random()).Next(100000));
                        var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid, Math.Round((double.Parse(sumOrder) / VND), 2).ToString());
                        var links = createdPayment.links.GetEnumerator();
                        string paypalRedirectUrl = null;
                        while (links.MoveNext())
                        {
                            Links lnk = links.Current;
                            if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                            {
                                paypalRedirectUrl = lnk.href;
                            }
                        }
                        Session.Add(guid, createdPayment.id);
                        saveOrder(order, "Cổng thanh toán Paypal", 2, orderCode);
                        return Redirect(paypalRedirectUrl);
                    }
                    else
                    {
                        var guid = Request.Params["guid"];
                        var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                        if (executedPayment.state.ToLower() != "approved")
                        {
                            return View("FailureView");
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw;
                }
                return View("payment");
            }
            //Neu Thanh Toán ATM online
            else if (payment_method.Equals("ATM_ONLINE"))
            {
                string str_bankcode = Request["bankcode"];
                RequestInfo info = new RequestInfo();
                info.Merchant_id = nganluongInfo.Merchant_id;
                info.Merchant_password = nganluongInfo.Merchant_password;
                info.Receiver_email = nganluongInfo.Receiver_email;
                info.cur_code = "vnd";
                info.bank_code = str_bankcode;
                info.Order_code = orderCode;
                info.Total_amount = sumOrder;
                info.fee_shipping = "0";
                info.Discount_amount = "0";
                info.order_description = "Thanh toán ngân lượng cho đơn hàng";
                info.return_url = nganluongInfo.return_url;
                info.cancel_url = nganluongInfo.cancel_url;
                info.Buyer_fullname = order.deliveryname;
                info.Buyer_email = order.deliveryemail;
                info.Buyer_mobile = order.deliveryphone;
                APICheckoutV3 objNLChecout = new APICheckoutV3();
                ResponseInfo result = objNLChecout.GetUrlCheckout(info, payment_method);
                // neu khong gap loi gi
                if (result.Error_code == "00")
                {
                    saveOrder(order, "ATM Online qua ngân lượng", 2, orderCode);
                    return Redirect(result.Checkout_url);
                }
                else
                {
                    ViewBag.errorPaymentOnline = result.Description;
                    return View("payment");
                }
            }
            return View("payment");
        }
        //Khi huy thanh toán Ngan Luong
        public ActionResult cancel_order()
        {
            return View("cancel_order");
        }
        public ActionResult CallBackOrderPaypal()
        {
            var Cancelorder = Request.Params["Cancel"];
            if (Cancelorder != null && Cancelorder.ToLower() == "true")
            {
                return View("FailureView");
            }
            var cart = Session[SessionCart];
            var list = new List<Cart_item>();
            ViewBag.cart = (List<Cart_item>)cart;
            Session["SessionCart"] = null;
            var OrderInfo = db.Orders.OrderByDescending(m => m.ID).FirstOrDefault();
            ViewBag.name = OrderInfo.deliveryname;
            ViewBag.email = OrderInfo.deliveryemail;
            ViewBag.address = OrderInfo.deliveryaddress;
            ViewBag.code = OrderInfo.code;
            ViewBag.phone = OrderInfo.deliveryphone;
            OrderInfo.StatusPayment = 1;
            db.Entry(OrderInfo).State = EntityState.Modified;
            db.SaveChanges();
            ViewBag.paymentStatus = OrderInfo.StatusPayment;
            ViewBag.Methodpayment = OrderInfo.deliveryPaymentMethod;
            return View("payment");
        }

        //Khi thanh toán Ngan Luong XOng
        public ActionResult confirm_orderPaymentOnline()
        {

            String Token = Request["token"];
            RequestCheckOrder info = new RequestCheckOrder();
            info.Merchant_id = nganluongInfo.Merchant_id;
            info.Merchant_password = nganluongInfo.Merchant_password;
            info.Token = Token;
            APICheckoutV3 objNLChecout = new APICheckoutV3();
            ResponseCheckOrder result = objNLChecout.GetTransactionDetail(info);
            if (result.errorCode == "00")
            {
                var cart = Session[SessionCart];
                var list = new List<Cart_item>();
                ViewBag.cart = (List<Cart_item>)cart;
                Session["SessionCart"] = null;
                var OrderInfo = db.Orders.OrderByDescending(m => m.ID).FirstOrDefault();
                ViewBag.name = OrderInfo.deliveryname;
                ViewBag.email = OrderInfo.deliveryemail;
                ViewBag.address = OrderInfo.deliveryaddress;
                ViewBag.code = OrderInfo.code;
                ViewBag.phone = OrderInfo.deliveryphone;
                OrderInfo.StatusPayment = 1;
                db.Entry(OrderInfo).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.paymentStatus = OrderInfo.StatusPayment;
                ViewBag.Methodpayment = OrderInfo.deliveryPaymentMethod;
                return View("payment");
            }
            else
            {
                ViewBag.status = false;
            }

            return View("confirm_orderPaymentOnline");
        }

        //function ssave order when order success!
        public void saveOrder(Morder order, string paymentMethod, int StatusPayment, string ordercode)
        {
            var cart = Session[SessionCart];
            var list = new List<Cart_item>();
            if (cart != null)
            {
                list = (List<Cart_item>)cart;
            }
           
            if (ModelState.IsValid)
            {

                order.code = ordercode;
                order.userid = int.Parse(Session["id"].ToString());
                order.deliveryPaymentMethod = paymentMethod;
                order.StatusPayment = StatusPayment;
                order.created_ate = DateTime.Now;
                order.updated_by = 1;
                order.updated_at = DateTime.Now;
                order.updated_by = 1;
                order.status = 2;
                order.exportdate = DateTime.Now;
                db.Orders.Add(order);
                db.SaveChanges();
                ViewBag.name = order.deliveryname;
                ViewBag.email = order.deliveryemail;
                ViewBag.address = order.deliveryaddress;
                ViewBag.code = order.code;
                ViewBag.phone = order.deliveryphone;
                Mordersdetail orderdetail = new Mordersdetail();

                foreach (var item in list)
                {
                    float price = 0;
                    int sale = (int)item.product.pricesale;
                    if (sale > 0)
                    {
                        price = (float)item.product.price - (int)item.product.price / 100 * (int)sale * item.quantity;
                    }
                    else
                    {
                        price = (float)item.product.price * (int)item.quantity;
                    }
                    orderdetail.orderid = order.ID;
                    orderdetail.productid = item.product.ID;
                    orderdetail.priceSale = (int)item.product.pricesale;
                    orderdetail.price = item.product.price;
                    orderdetail.quantity = item.quantity;
                    orderdetail.amount = price;

                    db.Orderdetails.Add(orderdetail);
                    db.SaveChanges();
                    var updatedProduct = db.Products.Find(item.product.ID);
                    updatedProduct.number = (int)updatedProduct.number - (int)item.quantity;
                    db.Products.Attach(updatedProduct);
                    db.Entry(updatedProduct).State = EntityState.Modified;
                    db.SaveChanges();
                }

            }
        }
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            this.payment = new Payment()
            {
                id = paymentId
            };
            return this.payment.Execute(apiContext, paymentExecution);
        }

        private Payment CreatePayment(APIContext apiContext, string redirectUrl, string total)
        {
            var cart = Session[SessionCart];
            var list = new List<Cart_item>();
            if (cart != null)
            {
                list = (List<Cart_item>)cart;
            }
            //create itemlist and add item objects to it  
            var itemList = new ItemList()
            {
                items = new List<Item>()
            };
            //Adding Item Details like name, currency, price etc  
            itemList.items.AddRange(
                list.Select(x => new Item()
                {
                    name = x.product.name,
                    currency = "USD",
                    price = Math.Round(((((int)x.product.price - (int)x.product.price / 100 * (int)x.product.pricesale) / VND)* x.quantity),2).ToString(),
                    quantity = "1",
                    sku = "sku"
                }).ToList()

                );
            var payer = new Payer()
            {
                payment_method = "paypal"
            };
            // Configure Redirect Urls here with RedirectUrls object  
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };
            // Adding Tax, shipping and Subtotal details  
            var details = new Details()
            {
                tax = "0",
                shipping = "0",
                subtotal = total.ToString()
            };
            //Final amount with details  
            var amount = new Amount()
            {
                currency = "USD",
                total = total.ToString(), // Total must be equal to sum of tax, shipping and subtotal.  
                details = details
            };
            var transactionList = new List<Transaction>();
            // Adding description about the transaction  
            transactionList.Add(new Transaction()
            {
                description = "Transaction description",
                invoice_number = "your generated invoice number", //Generate an Invoice No  
                amount = amount,
                item_list = itemList
            });
            this.payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };
            // Create a payment using a APIContext  
            return this.payment.Create(apiContext);
        }
    }
}