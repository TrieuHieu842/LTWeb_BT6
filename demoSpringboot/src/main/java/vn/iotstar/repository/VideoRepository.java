package vn.iotstar.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import vn.iotstar.Entity.Video;

public interface VideoRepository extends JpaRepository<Video, String> {
	List<Video> findByTitleContaining(String name);
	Page<Video> findByTitleContaining(String name, Pageable pageable);

}
