package com.effective_mobile.domain;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "users")
public class User {

	private static final String SEQ_NAME = "user_seq";

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = SEQ_NAME)
	@SequenceGenerator(name = SEQ_NAME, sequenceName = SEQ_NAME, allocationSize = 1)
	private Long id;
	private String name;
	private String password;
	private String email;
	private BigDecimal balance;
	@Enumerated(EnumType.STRING)
	private Role role;
	@OneToOne(mappedBy = "user", cascade = CascadeType.REMOVE)
	private Bucket bucket;

}
