package com.jordiismith.mediaclub.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jordiismith.mediaclub.models.Media;

@Repository
public interface MediaRepository extends CrudRepository<Media, Long> {
	
	List<Media> findAll();
	
}