package com.jordiismith.mediaclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jordiismith.mediaclub.models.Media;
import com.jordiismith.mediaclub.repositories.MediaRepository;

@Service
public class MediaService {
	
	@Autowired
	private MediaRepository mediaRepo;
	
	//all
	public List<Media> allMedia(){
		return mediaRepo.findAll();
	}
	
	//Create
	public Media createMedia(Media newTeam) {
		return mediaRepo.save(newTeam);
	}
	
	//retrieve
	public Media findMedia(Long id) {
        Optional<Media> optionalMedia = mediaRepo.findById(id);
        if(optionalMedia.isPresent()) {
            return optionalMedia.get();
        } else {
            return null;
        }
    }
	
	//UPDATE
	public Media updateMedia(Media media) {
		return mediaRepo.save(media);
	}
	
	//DELETE
	public void deleteMedia(Media media) {
		mediaRepo.delete(media);
	}
}
