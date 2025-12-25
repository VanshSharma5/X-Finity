package com.xfinity.contactmanager.controler;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xfinity.contactmanager.models.Contact;
import com.xfinity.contactmanager.models.User;
import com.xfinity.contactmanager.repositories.UserRepositorie;
import com.xfinity.contactmanager.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/")
public class UserControler {

    private final UserRepositorie userRepositorie;
    private UserService userService;

    public UserControler(
            UserService userService, UserRepositorie userRepositorie) {
        this.userService = userService;
        this.userRepositorie = userRepositorie;
    }

    @GetMapping
    public String loginPage(
            Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("user") != null) {
            return "redirect:/home";
        }
        model.addAttribute("user", new User());

        return "index";
    }

    @GetMapping("home")
    public String homePage(
            @SessionAttribute(name = "user") User user) {
        return "home";
    }

    @PostMapping("login")
    public String loginUser(
            @ModelAttribute("user") User user, HttpSession httpSession,
            RedirectAttributes redirectAttributes) {
        User resultuser = userService.login(user);
        if (resultuser != null) {
            httpSession.setAttribute("user", resultuser);
            return "redirect:/home";
        } else {
            redirectAttributes.addFlashAttribute("Msg", "UserName or Password is incorrect ");
            return "redirect:/";
        }
    }

    @GetMapping("add")
    public String addPage(
            @SessionAttribute(name = "user") User user, Model model) {
        if (user.getIsAdmin() || user.getCanAdd()) {
            model.addAttribute("contact", new Contact());
            return "add-contact";
        } else {
            String Msg = "You Dont Have Permision to Add New Contact";

            return "redirect:/error?Msg=" + Msg;
        }
    }

    @GetMapping("update")
    public String searchPage(
            @SessionAttribute(name = "user") User user) {
        if (user.getIsAdmin() || user.getCanUpdate()) {
            return "update-contact";
        } else {
            String Msg = "You Dont Have Permision to Update Contact";

            return "redirect:/error?Msg=" + Msg;
        }
    }

    @GetMapping("delete")
    public String deletePage(
            @SessionAttribute(name = "user") User user) {
        if (user.getIsAdmin() || user.getCanDelete()) {
            return "delete-contact";
        } else {
            String Msg = "You Dont Have Permision to Delete Contact";

            return "redirect:/error?Msg=" + Msg;
        }
    }

    // @GetMapping("view")
    // public String viewPage(@SessionAttribute(name = "user") User user) {
    // if(user.getIsAdmin() || user.getCanView()) {
    // return "view-contact";
    // } else {
    // String Msg = "You Dont Have Permision to Delete Contact";;
    // return "redirect:/error?Msg="+Msg;
    // }
    // }

    @GetMapping("search")
    public String updatePage(
            @SessionAttribute(name = "user") User user) {
        if (user.getIsAdmin() || user.getCanView()) {
            return "search-contact";
        } else {
            String Msg = "You Dont Have Permision to Delete Contact";

            return "redirect:/error?Msg=" + Msg;
        }
    }

    @GetMapping("display")
    public String displayePage(
            @SessionAttribute(name = "user") User user) {
        return "redirect:/contact/display?page=1";
    }

    @GetMapping("logout")
    public String logout(
            @SessionAttribute(name = "user") User user, HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:/";
    }

    @GetMapping("error")
    public String getMethodName(
            HttpSession httpSession) {
        String Msg = "Oops Something Unexpected Happend Please Go Home or Try Login Again";
        return "error?Msg=" + Msg;
    }

    @PostMapping("change")
    public String changePasswordp(
            @SessionAttribute(name = "user") User user,
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpSession httpSession) {
        if (user.getId() != null && newPassword.equals(confirmPassword)) {
            user.setPassword(confirmPassword);
            userRepositorie.save(user);
            httpSession.setAttribute("msg", "New Password and Confirm Password did not match");
            return "redirect:/";
        }
        return "redirect:/change";
    }

    @GetMapping("change")
    public String chagePassword(
            @SessionAttribute(name = "user") User user) {
        return "change-password";
    }

}
