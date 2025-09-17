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

import vn.iotstar.Entity.Video;
import vn.iotstar.Services.CategoryServices;
import vn.iotstar.Services.VideoServices;

@Controller
@RequestMapping("admin/videos")
public class VideoController {

    @Autowired
    VideoServices videoService;
    @Autowired
    CategoryServices categoryService; 

    @GetMapping("saveOrUpdate")
    public String add(ModelMap model) {
        model.addAttribute("video", new Video());

        // truyền danh sách categories xuống JSP
        model.addAttribute("categories", categoryService.findAll());

        return "admin/videos/add";
    }

    @PostMapping("saveOrUpdate")
    public ModelAndView saveOrUpdate(ModelMap model, @ModelAttribute("video") Video video) {
        videoService.save(video);
        model.addAttribute("message", "Video is saved successfully!");
        return new ModelAndView("redirect:/admin/videos/list", model);
    }

    // Danh sách Video
    @GetMapping("list")
    public String list(ModelMap model) {
        List<Video> list = videoService.findAll();
        model.addAttribute("videos", list);
        return "admin/videos/list"; // đúng thư mục admin/videos
    }

    // Edit Video
    @GetMapping("edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") String id) {
        Video video = videoService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Video Id: " + id));
        model.addAttribute("video", video);
        model.addAttribute("categories", categoryService.findAll());
        return new ModelAndView("admin/videos/add", model);
    }

    // Xóa Video
    @GetMapping("delete/{id}")
    public ModelAndView delete(ModelMap model, @PathVariable("id") String id) {
        videoService.deleteById(id);
        model.addAttribute("message", "Video is deleted!");
        return new ModelAndView("redirect:/admin/videos/list", model);
    }

    // Search Video
    @GetMapping("search")
    public String search(ModelMap model,
                         @RequestParam(name = "keyword", required = false) String keyword) {
        List<Video> list = null;

        if (StringUtils.hasText(keyword)) {
            list = videoService.findByTitleContaining(keyword); // giả sử tìm theo title
        }

        model.addAttribute("videos", list);
        model.addAttribute("keyword", keyword);
        return "admin/videos/search";
    }

    // Search Video có phân trang
    @GetMapping("searchpaginated")
    public String searchPaginated(ModelMap model,
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "3") int size) {

        Pageable pageable = PageRequest.of(page, size);
        Page<Video> resultPage;

        if (StringUtils.hasText(keyword)) {
            resultPage = videoService.findByTitleContaining(keyword, pageable);
            model.addAttribute("keyword", keyword);
        } else {
            resultPage = videoService.findByTitleContaining("", pageable);
        }

        model.addAttribute("videos", resultPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", resultPage.getTotalPages());

        return "admin/videos/searchpaginated";
    }
}
