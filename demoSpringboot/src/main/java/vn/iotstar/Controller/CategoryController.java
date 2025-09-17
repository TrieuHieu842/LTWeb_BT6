package vn.iotstar.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.Entity.Category;
import vn.iotstar.Services.CategoryServices;

@Controller
@RequestMapping("admin/categories")
public class CategoryController {

    @Autowired
    CategoryServices categoryService;

    // Hiển thị form thêm
    @GetMapping("saveOrUpdate")
    public String add(ModelMap model) {
        model.addAttribute("category", new Category());
        return "admin/categories/add";
    }

    // Lưu hoặc cập nhật Category
    @PostMapping("saveOrUpdate")
    public ModelAndView saveOrUpdate(ModelMap model, Category category) {
        categoryService.save(category);
        model.addAttribute("message", "Category is saved successfully!");
        return new ModelAndView("redirect:/admin/categories/list", model);
    }

    // Danh sách Category
    @GetMapping("list")
    public String list(ModelMap model) {
        List<Category> list = categoryService.findAll();
        model.addAttribute("categories", list);
        return "admin/categories/list";
    }

    // Edit Category
    @GetMapping("edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") int id) {
        Category category = categoryService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Category Id: " + id));
        model.addAttribute("category", category);
        return new ModelAndView("admin/categories/add", model);
    }

    // Xóa Category
    @GetMapping("delete/{categoryId}")
    public ModelAndView delete(ModelMap model, @PathVariable("categoryId") int categoryId) {
        categoryService.deleteById(categoryId);
        model.addAttribute("message", "Category is deleted!");
        return new ModelAndView("redirect:/admin/categories/list", model);
    }

    @GetMapping("search")
    public String search(ModelMap model,
                         @RequestParam(name = "keyword", required = false) String keyword) {
        List<Category> list = null;

        if (StringUtils.hasText(keyword)) {
            list = categoryService.findByCategoryNameContaining(keyword);
        }

        model.addAttribute("categories", list);
        model.addAttribute("keyword", keyword);
        return "admin/categories/search";
    }


    // Search có phân trang
    @GetMapping("searchpaginated")
    public String searchPaginated(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "3") int size) {

        Pageable pageable = PageRequest.of(page, size);
        Page<Category> resultPage;

        if (StringUtils.hasText(name)) {
            resultPage = categoryService.findByCategoryNameContaining(name, pageable);
            model.addAttribute("name", name);
        } else {
            resultPage = categoryService.findByCategoryNameContaining("", pageable);
        }

        model.addAttribute("categories", resultPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", resultPage.getTotalPages());

        return "admin/categories/searchpaginated";
    }
}
