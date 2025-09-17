package vn.iotstar.Services;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import vn.iotstar.Entity.Category;

public interface CategoryServices {

	void deleteById(Integer id);

	Optional<Category> findById(Integer id);

	List<Category> findAll();

	<S extends Category> S save(S entity);

	Page<Category> findByCategoryNameContaining(String name, Pageable pageable);

	List<Category> findByCategoryNameContaining(String name);

}
