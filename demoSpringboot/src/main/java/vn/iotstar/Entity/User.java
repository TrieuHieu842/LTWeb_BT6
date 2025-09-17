package vn.iotstar.Entity;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="Username", nullable=false, unique=true)
	private String username;

	@Column(name="Password")
	private String password;

	@Column(name="Role")
	private String role;

	@Column(name="Active")
	private boolean active;
}
