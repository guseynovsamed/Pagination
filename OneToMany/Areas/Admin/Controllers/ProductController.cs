using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using OneToMany.Services.Interface;
using OneToMany.ViewModels.Products;

namespace OneToMany.Areas.Admin.Controllers
{
    [Area(nameof(Admin))]
    public class ProductController : Controller
    {
        private readonly IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }

        [HttpGet]
        public async Task<IActionResult> Index(int page = 1)
        {
            var paginateDatas = await _productService.GetAllPaginateAsync(page);

            var dbProducts = await _productService.GetAllAsync();
            List<ProductVM> mappeDatas = _productService.GetMappedDatas(paginateDatas);
            int pageCount = await GetPageCountAsync(4);
            ViewBag.pageCount = pageCount;
            ViewBag.currentPage = page;
            return View(mappeDatas);
        }

        private async Task<int> GetPageCountAsync(int take)
        {
            var count = await _productService.GetCountAsync();

            return (int)Math.Ceiling((decimal)count / take);
        }
    }
}