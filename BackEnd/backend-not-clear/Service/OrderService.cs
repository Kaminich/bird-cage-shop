using backend_not_clear.DTO.OrderDTO;
using backend_not_clear.DTO.OrderDTO.CreateOrder;
using backend_not_clear.DTO.OrderDTO.CreateOrderCustom;
using backend_not_clear.DTO.OrderDTO.ReturnOrdersByMonth;
using backend_not_clear.DTO.OrderDTO.SearchOrder;
using backend_not_clear.DTO.OrderDTO.UpdateOrder;
using backend_not_clear.Interface;
using backend_not_clear.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;
using static System.Reflection.Metadata.BlobBuilder;

namespace backend_not_clear.Service
{
    public class OrderService : IOrder
    {
        private readonly BCS_ShopContext _context;

        const string patternOrder = @"O(?!CT)\w*(\d+)";
        const string patternCustomOrder = @"OCT\w*(\d+)";

        public OrderService(BCS_ShopContext context)
        {
            _context = context;
        }

        public async Task<List<Order>> GetOrderNotFinishedForUser(SearchOrder search)
        {
            try
            {
                var orders = await this._context.Order.Where(x => x.UserId.Equals(search.UserID) && !x.Status )
                                .Include(x => x.OrderDetail.Where(x => !x.Status || !x.IsCustom))
                                    .ThenInclude(x => x.Product)
                                    .ThenInclude(x => x.Image)
                                .ToListAsync();
                var list = new List<Order>();
                foreach (var order in orders)
                {
                    if(Regex.IsMatch(order.OrderId, patternOrder)) 
                        list.Add(order);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public async Task<List<Order>> GetOrderFinishedForUser(SearchOrder search)
        {
            try
            {
                var orders = await this._context.Order.Where(x => x.UserId.Equals(search.UserID) && x.Status)
                                .Include(x => x.OrderDetail.Where(x => x.Status))
                                    .ThenInclude(x => x.Product)
                                .ToListAsync();
                var list = new List<Order>();
                foreach (var order in orders)
                {
                    if (Regex.IsMatch(order.OrderId, patternOrder))
                        list.Add(order);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<List<Order>> GetCustomOrder(SearchOrder search)
        {
            try
            {
                var orders = await this._context.Order.Where(x => x.UserId.Equals(search.UserID) && !x.Status)
                                .Include(x => x.OrderDetail.Where(x => !x.Status || !x.IsCustom))
                                    .ThenInclude(x => x.Product)
                                    .ThenInclude(x => x.Image)
                                .ToListAsync();
                var list = new List<Order>();
                foreach (var order in orders)
                {
                    if (Regex.IsMatch(order.OrderId, patternCustomOrder))
                        list.Add(order);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<Order> CreateNew(CreateOrder order)
        {
            try
            {
                var add = new Order();
                add.OrderId = "O" + Guid.NewGuid().ToString().Substring(0, 8);
                add.UserId = order.UserID;
                add.Note = order.Note;
                add.CreateDate = order.CreateDate;
                add.Status = false;
                await this._context.Order.AddAsync(add);
                await this._context.SaveChangesAsync();
                return add;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<Order> CreateNewCustomOrder(CreateCustomOrder order)
        {
            try
            {
                var add = new Order();
                add.OrderId = "OCT" + Guid.NewGuid().ToString().Substring(0, 6);
                add.UserId = order.UserID;
                add.Note = order.Note;
                add.CreateDate = order.CreateDate;
                add.Total = order.Total;
                add.Status = false;
                await this._context.Order.AddAsync(add);
                await this._context.SaveChangesAsync();
                return add;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<Order> FinishPayment(string OrderID)
        {
            try
            {
                var found = await this._context.Order.Where(x => x.OrderId.Equals(OrderID))
                                    .Include(x => x.OrderDetail.Where(x => x.Status || x.IsCustom))
                                    .FirstOrDefaultAsync();
                if (found != null)
                {
                    found.Status = true;
                    this._context.Order.Update(found);
                    await this._context.SaveChangesAsync();
                    foreach (var item in found.OrderDetail)
                    {
                        item.Status = true;
                        this._context.OrderDetail.Update(item);
                        await this._context.SaveChangesAsync();
                    }
                    return found;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<Order> UpdateOrder(UpdateOrder order)
        {
            try
            {
                var update = await this._context.Order.Where(x => x.OrderId.Equals(order.OrderId)
                                                               && x.UserId.Equals(order.UserId))
                                                       .Include(x => x.OrderDetail)
                                                       .FirstOrDefaultAsync();
                if (update != null)
                {
                    update.Note = order.Note ?? update.Note;
                    update.Total = order.price;
                    update.Status = false;
                    this._context.Order.Update(update);
                    await this._context.SaveChangesAsync();
                    return update;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<List<Order>> GetAll()
        {
            try
            {
                var list = await this._context.Order
                                     .OrderBy(x => x.CreateDate.Month)
                                     .ToListAsync();
                return list;
            } catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public async Task<List<ReturnOrdersByMonth>> getOrdersByMonth()
        {
            try
            {
                var list = await this._context.Order.Where(x => x.Status)
                                                    .OrderBy(x => x.CreateDate.Month)
                                                    .ToListAsync();
                var count = 0;
                double sum = 0;
                string month = "";
                var products = 0 ;
                List<ReturnOrdersByMonth> result = new List<ReturnOrdersByMonth>();
                for(int i = 1; i <= 12; i++)
                {
                    foreach(var items in list)
                    {
                        if (Convert.ToInt32(items.CreateDate.Month) == i)
                        {
                            count++;
                            sum += Convert.ToDouble(items.Total);
                            var product = await this._context.OrderDetail.Where(x => x.OrderId.Equals(items.OrderId)).ToListAsync();
                            products += product.Count();
                        }
                    }
                    //if (count != 0)
                    //{
                    //    ReturnOrdersByMonth returnOrdersByMonth = new ReturnOrdersByMonth()
                    //    {
                    //        month = i.ToString(),
                    //        sum = sum,
                    //        num = count,
                    //    };
                    //    result.Add(returnOrdersByMonth);
                    //    count = 0;
                    //}
                    //switch (i)
                    //{
                    //    case 1:
                    //        {
                    //            month = "January";
                    //            break;
                    //        }
                    //    case 2:
                    //        {
                    //            month = "February";
                    //            break;
                    //        }
                    //    case 3:
                    //        {
                    //            month = "March";
                    //            break;
                    //        }
                    //    case 4:
                    //        {
                    //            month = "April";
                    //            break;
                    //        }
                    //    case 5:
                    //        {
                    //            month = "May";
                    //            break;
                    //        }
                    //    case 6:
                    //        {
                    //            month = "June";
                    //            break;
                    //        }
                    //    case 7:
                    //        {
                    //            month = "July";
                    //            break;
                    //        }
                    //    case 8:
                    //        {
                    //            month = "August";
                    //            break;
                    //        }
                    //    case 9:
                    //        {
                    //            month = "September";
                    //            break;
                    //        }
                    //    case 10:
                    //        {
                    //            month = "October";
                    //            break;
                    //        }
                    //    case 11:
                    //        {
                    //            month = "November";
                    //            break;
                    //        }
                    //    case 12:
                    //        {
                    //            month = "December";
                    //            break;
                    //        }
                    //}
                    ReturnOrdersByMonth returnOrdersByMonth = new ReturnOrdersByMonth()
                    {
                        month = Convert.ToString(i),
                        sum = sum,
                        num = count,
                        products = products
                    };
                    result.Add(returnOrdersByMonth);
                    count = 0;
                    sum = 0;
                }
                return result;
            }catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public async Task<Int32> countAllOrder()
        {
            try
            {
                var list = await this._context.Order.Where(x => x.Status).ToListAsync();
                return list.Count();
            }catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
