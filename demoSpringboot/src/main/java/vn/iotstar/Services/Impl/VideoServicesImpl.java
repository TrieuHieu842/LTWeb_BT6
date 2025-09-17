package vn.iotstar.Services.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.Entity.Video;
import vn.iotstar.Services.VideoServices;
import vn.iotstar.repository.VideoRepository;

@Service
public class VideoServicesImpl implements VideoServices{
	@Autowired
	VideoRepository videoRepository;

	public VideoServicesImpl(VideoRepository videoRepository) {
		super();
		this.videoRepository = videoRepository;
	}

	@Override
	public List<Video> findByTitleContaining(String name) {
		return videoRepository.findByTitleContaining(name);
	}

	@Override
	public Page<Video> findByTitleContaining(String name, Pageable pageable) {
		return videoRepository.findByTitleContaining(name, pageable);
	}

	@Override
	public List<Video> findAll(Sort sort) {
		return videoRepository.findAll(sort);
	}

	@Override
	public <S extends Video> S save(S entity) {
		return videoRepository.save(entity);
	}

	@Override
	public Page<Video> findAll(Pageable pageable) {
		return videoRepository.findAll(pageable);
	}

	@Override
	public List<Video> findAll() {
		return videoRepository.findAll();
	}

	@Override
	public List<Video> findAllById(Iterable<String> ids) {
		return videoRepository.findAllById(ids);
	}

	@Override
	public Optional<Video> findById(String id) {
		return videoRepository.findById(id);
	}

	@Override
	public long count() {
		return videoRepository.count();
	}

	@Override
	public void deleteById(String id) {
		videoRepository.deleteById(id);
	}

	@Override
	public void delete(Video entity) {
		videoRepository.delete(entity);
	}

	@Override
	public void deleteAll() {
		videoRepository.deleteAll();
	}
	
	
}
