package vn.iotstar.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.Entity.Video;

public interface VideoServices {

	void deleteAll();

	void delete(Video entity);

	void deleteById(String id);

	long count();

	Optional<Video> findById(String id);

	List<Video> findAllById(Iterable<String> ids);

	List<Video> findAll();

	Page<Video> findAll(Pageable pageable);

	<S extends Video> S save(S entity);

	List<Video> findAll(Sort sort);

	Page<Video> findByTitleContaining(String name, Pageable pageable);

	List<Video> findByTitleContaining(String name);

}
