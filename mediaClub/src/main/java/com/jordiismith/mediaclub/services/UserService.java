package com.jordiismith.mediaclub.services;


import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jordiismith.mediaclub.models.LoginUser;
import com.jordiismith.mediaclub.models.User;
import com.jordiismith.mediaclub.repositories.UserRepository;



@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;

	public User findById(Long id) {
		return userRepo.findById(id).orElse(null);
	}

	public User register(User newUser, BindingResult result) {
		
		if (userRepo.findByUsername(newUser.getUsername()).isPresent()) {
			result.rejectValue("username", "Matches", "This name is already taken");
			return null;
		}
		
		if (userRepo.findByEmail(newUser.getEmail()).isPresent()) {
			result.rejectValue("email", "Matches", "This account already exists");
			return null;
		}
		

		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "Passwords must match");
			return null;
		}

		if (result.hasErrors()) {
			return null;
		}

		String hashedPassword = hashPassword(newUser.getPassword());
		newUser.setPassword(hashedPassword);
		return userRepo.save(newUser);
	}

	public User login(LoginUser newLoginUser, BindingResult result) {
		Optional<User> checkUser = userRepo.findByEmail(newLoginUser.getEmail());

		if (!checkUser.isPresent()) {
			result.rejectValue("email", "Matches", "User does not exist");
			return null;
		}

		User user = checkUser.get();
		if (!checkPassword(newLoginUser.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Wrong Password");
			return null;
		}

		if (result.hasErrors()) {
			return null;
		}

		return user;
	}

	private String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}

	private boolean checkPassword(String rawPassword, String hashedPassword) {
		return BCrypt.checkpw(rawPassword, hashedPassword);
	}

}