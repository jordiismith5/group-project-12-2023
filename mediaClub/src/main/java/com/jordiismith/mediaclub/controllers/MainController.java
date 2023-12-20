package com.jordiismith.mediaclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jordiismith.mediaclub.models.LoginUser;
import com.jordiismith.mediaclub.models.Media;
import com.jordiismith.mediaclub.models.User;
import com.jordiismith.mediaclub.services.MediaService;
import com.jordiismith.mediaclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class MainController {
	@Autowired
	private UserService userServ;
	@Autowired 
	private MediaService mediaServ;
	
	
	
//-----root redirect
	@GetMapping("/")
	public String root(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	
	
//-----register user
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		userServ.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("userId", newUser.getId());
		return "redirect:/shows";
	}

	
	
//----------login user
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/shows";
	}
	
//------logout
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.setAttribute("userId", null);
	    return "redirect:/";
	}
	
	
	
//-------the main view/ dash board
	@GetMapping("/shows")
	public String dashboard(Model model, HttpSession session) {
	    Long userId = (Long) session.getAttribute("userId");

	    if (userId == null) {
	        return "redirect:/";
	    }

	    List<Media> medias = mediaServ.allMedia();
	    User user = userServ.findById(userId);

	    model.addAttribute("medias", medias);
	    model.addAttribute("user", user);

	    return "dashboard.jsp";
	}
	
	
	
//-----adding show get/post	
	@GetMapping("/shows/new")
	public String addingMedia(@ModelAttribute("media") Media media, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		User user = userServ.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
		return "addMedia.jsp";
	}
	
	@PostMapping("/shows/create")
	public String creatingMedia(@Valid @ModelAttribute("media") Media media, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "addMedia.jsp";
		}
		mediaServ.createMedia(media);
		
		return"redirect:/shows";
	}
	
	
	
//---------clicking on a show id to view more---
	@GetMapping("/shows/{id}")
	public String show(Model model, @PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/shows";
		}
		
		Media media = mediaServ.findMedia(id);
		model.addAttribute("media", media);
    	model.addAttribute("user", userServ.findById((Long)session.getAttribute("userId")));
    	
    	return "showMedia.jsp";
	}
	
	
	
//------------editing a show post---
	@GetMapping("/shows/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		model.addAttribute("media", mediaServ.findMedia(id));
		return "editMedia.jsp";
	}
	
	@PostMapping("/shows/{id}/edit")
	public String updateMedia(@PathVariable("id") Long id, Model model, @Valid @ModelAttribute("media") Media media, BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("media", mediaServ.findMedia(id));
			return "redirect:/shows/{id}/edit";
	}
		else {
			mediaServ.updateMedia(media);
			return"redirect:/shows";
		}
	}
	
	
	
//-----deleting a show----
	@RequestMapping("/shows/{id}/delete")
	public String deleteMedia(@PathVariable("id") Long id) {
		Media media = mediaServ.findMedia(id);
		mediaServ.deleteMedia(media);
		return "redirect:/shows";
	}
}



