package vn.iotstar.Entity;

import java.io.Serializable;

import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Category")
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	

	public Integer getId() {
	    return id;
	}

	public void setId(Integer id) {
	    this.id = id;
	}
	@Column(name = "categoryCode")
	private String categoryCode;
	public String getCategoryCode() {
	    return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
	    this.categoryCode = categoryCode;
	}
	
	@Column(name="categoryName", columnDefinition = "NVARCHAR(MAX)")
	private String categoryName;
	
	@Column(name="Images")
	private String images;
	@Column(name="Status")
	private boolean status;
	
	//Ket noi one to many
	@OneToMany(mappedBy="category", cascade = CascadeType.ALL)
	private Set<Video> videos;
	public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getImages() { return images; }
    public void setImages(String images) { this.images = images; }

    public Boolean getStatus() { return status; }
    public void setStatus(Boolean status) { this.status = status; }
	
}
