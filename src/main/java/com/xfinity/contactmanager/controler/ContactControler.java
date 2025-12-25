package com.xfinity.contactmanager.controler;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.xfinity.contactmanager.models.Contact;
import com.xfinity.contactmanager.models.User;
import com.xfinity.contactmanager.repositories.ContactRepositorie;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/contact")
public class ContactControler {
    // private final ContactService contactService;
    private final ContactRepositorie contactRepositorie;

    public ContactControler(ContactRepositorie contactRepositorie) {
        this.contactRepositorie = contactRepositorie;
    }

    @GetMapping
    public String getById(
            @SessionAttribute(name = "user") User user,
            @RequestParam(value = "id", required = false) Integer id,
            @RequestParam(value = "mode", defaultValue = "readonly") String mode,
            Model model) {

        if (id == null) {
            return "redirect:/add";
        } else if (!(user.getIsAdmin() || user.getCanView())) {
            String Msg = "You Dont Have Permision to View Contact";
            return "redirect:/error?Msg=" + Msg;
        } else if (!contactRepositorie.existsById(id)) {
            String Msg = "No Respective Data Found For Given Search Id";
            return "redirect:/error?Msg=" + Msg;
        }
        if (user.getCanUpdate() || user.getIsAdmin())
            mode = "";
        Contact searchContact = contactRepositorie.getReferenceById(id);
        model.addAttribute("contact", searchContact);
        model.addAttribute("mode", mode);
        return "update-contact";
    }

    @PostMapping
    public String saveContact(
            @SessionAttribute(name = "user") User user,
            @ModelAttribute("contact") Contact contact) {

        if (!(user.getIsAdmin() || user.getCanAdd())) {
            String Msg = "You Dont Have Permision to Add New Contact";
            return "redirect:/error?Msg=" + Msg;
        }
        contactRepositorie.save(contact);
        return "redirect:/home";
    }

    @GetMapping("search")
    public String getMethodName(
            @SessionAttribute(name = "user") User user,
            @RequestParam(value = "attribute") String attribute,
            @RequestParam(value = "value") String value,
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "size", defaultValue = "50") Integer size,
            @RequestParam(value = "sortBy", required = false) Integer sortBy,
            Model model) {

        if (!(user.getIsAdmin() || user.getCanView())) {
            String Msg = "You Dont Have Permision to View Contact";
            return "redirect:/error?Msg=" + Msg;
        }
        if ((page < 1) || (size < 1)) {
            String Msg = "Please Enter Valid Page Number. Value must be greter than 0.";
            return "redirect:/error?Msg=" + Msg;
        }
        Pageable pageable = PageRequest.of(page - 1, size);
        Page<Contact> contacts;
        if (attribute.equals("byName"))
            contacts = contactRepositorie.findByNameContaining(value, pageable);
        else if (attribute.equals("byContactNo"))
            contacts = contactRepositorie.findByContactNoContaining(value, pageable);
        else if (attribute.equals("byPinCode"))
            contacts = contactRepositorie.findByPinCodeContaining(value, pageable);
        else if (attribute.equals("byDealerType"))
            contacts = contactRepositorie.findByDealerTypeContaining(value, pageable);
        else if (attribute.equals("byDesignation"))
            contacts = contactRepositorie.findByDesignationContaining(value, pageable);
        else
            contacts = contactRepositorie.findAll(pageable);

        model.addAttribute("contacts", contacts.getContent());

        return "search-contact";
    }

    @GetMapping("display")
    public String getMethodName(
            @SessionAttribute(name = "user") User user,
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "size", defaultValue = "1000") Integer size,
            Model model) {
        if (!(user.getIsAdmin() || user.getCanView())) {
            String Msg = "You Don't Have Permision to View Contact";
            return "redirect:/error?Msg=" + Msg;
        }
        if ((page < 1) || (size < 1)) {
            String Msg = "Please Enter Valid Page Number. Value must be greter than 0.";
            return "redirect:/error?Msg=" + Msg;
        }
        Page<Contact> contacts = contactRepositorie.findAll(PageRequest.of(page-1, size));
        
        model.addAttribute("contacts", contacts.getContent());
        return "display-contact";
    }


    @PostMapping("update")
    public String updateContact(
            @SessionAttribute(name = "user") User user,
            @ModelAttribute("contact") Contact contact, Model model) {

        if (!(user.getIsAdmin() || user.getCanUpdate())) {
            String Msg = "You Dont Have Permision to Update Contact";
            return "redirect:/error?Msg=" + Msg;
        } else if (contact.getId() == null) {
            String Msg = "Empty search Id for Contact";
            return "redirect:/error?Msg=" + Msg;
        } else if (!contactRepositorie.existsById(contact.getId())) {
            String Msg = "Invalid Page Number Or Page Size";
            return "redirect:/error?Msg=" + Msg;
        }
        Contact updatedContact = contactRepositorie.save(contact);
        model.addAttribute("contact", updatedContact);
        return "update-contact";
    }

    @PostMapping("delete")
    public String deleteContect(
            @SessionAttribute(name = "user") User user,
            @RequestParam(value = "id") Integer id) {
        if (user.getIsAdmin() || user.getCanDelete()) {
            Contact contact = contactRepositorie.getReferenceById(id);
            if (contact.getId() != null) {
                contactRepositorie.delete(contact);
                return "redirect:/home";
            } else {
                String Msg = "No Contact Found For The Given Search Id Please Verify It.";
                return "redirect:/error?Msg=" + Msg;
            }
        } else {
            String Msg = "You Dont Have Permision to Delete Contact";
            return "redirect:/error?Msg=" + Msg;
        }
    }
}
