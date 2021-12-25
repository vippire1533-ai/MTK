using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebTraiCay.Models;


namespace WebTraiCay.Models
{
    public interface IIterator
    {
        Cart_item First();
        Cart_item Next();
        bool IsDone { get; }
        Cart_item CurrentItem { get; }
    }
    public class SelectListItemIterator : IIterator
    {
        List<Cart_item> _listselectitems;
        int current = 0;
        int step = 1;

        public SelectListItemIterator(List<Cart_item> listselectitems)
        {
            _listselectitems = listselectitems;
        }

        public bool IsDone
        {
            get { return current >= _listselectitems.Count; }
        }

        public Cart_item CurrentItem => _listselectitems[current];

        public Cart_item First()
        {
            current = 0;
            if(_listselectitems.Count>0)
            return _listselectitems[current];
            return null;
        }
        Cart_item IIterator.Next()
        {
            current += step;
            if (!IsDone)
                return _listselectitems[current];
            else
                return null;
        }
    }
}