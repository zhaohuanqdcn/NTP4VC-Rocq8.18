namespace A_Ctype
noncomputable def p_islower (c : ℤ) := (97 : ℤ) ≤ c ∧ c ≤ (122 : ℤ)
noncomputable def p_isupper (c : ℤ) := (65 : ℤ) ≤ c ∧ c ≤ (90 : ℤ)
noncomputable def p_isalpha (c : ℤ) := p_islower c ∨ p_isupper c
noncomputable def p_isdigit (c : ℤ) := (48 : ℤ) ≤ c ∧ c ≤ (57 : ℤ)
noncomputable def p_isodigit (c : ℤ) := (48 : ℤ) ≤ c ∧ c ≤ (55 : ℤ)
noncomputable def p_isalnum (c : ℤ) := p_isalpha c ∨ p_isdigit c
noncomputable def p_isspace (c : ℤ) := c = (9 : ℤ) ∨ c = (10 : ℤ) ∨ c = (12 : ℤ) ∨ c = (13 : ℤ) ∨ c = (32 : ℤ)
noncomputable def p_isxdigit (c : ℤ) := p_isdigit c ∨ (65 : ℤ) ≤ c ∧ c ≤ (70 : ℤ) ∨ (97 : ℤ) ≤ c ∧ c ≤ (102 : ℤ)
axiom l_tolower : ℤ -> ℤ
axiom l_toupper : ℤ -> ℤ
axiom Q_a : l_tolower (65 : ℤ) = (97 : ℤ)
axiom Q_b : l_tolower (66 : ℤ) = (98 : ℤ)
axiom Q_c : l_tolower (67 : ℤ) = (99 : ℤ)
axiom Q_d : l_tolower (68 : ℤ) = (100 : ℤ)
axiom Q_e : l_tolower (69 : ℤ) = (101 : ℤ)
axiom Q_f : l_tolower (70 : ℤ) = (102 : ℤ)
axiom Q_g : l_tolower (71 : ℤ) = (103 : ℤ)
axiom Q_h : l_tolower (72 : ℤ) = (104 : ℤ)
axiom Q_i : l_tolower (73 : ℤ) = (105 : ℤ)
axiom Q_j : l_tolower (74 : ℤ) = (106 : ℤ)
axiom Q_k : l_tolower (75 : ℤ) = (107 : ℤ)
axiom Q_l : l_tolower (76 : ℤ) = (108 : ℤ)
axiom Q_m : l_tolower (77 : ℤ) = (109 : ℤ)
axiom Q_n : l_tolower (78 : ℤ) = (110 : ℤ)
axiom Q_o : l_tolower (79 : ℤ) = (111 : ℤ)
axiom Q_p : l_tolower (80 : ℤ) = (112 : ℤ)
axiom Q_q : l_tolower (81 : ℤ) = (113 : ℤ)
axiom Q_r : l_tolower (82 : ℤ) = (114 : ℤ)
axiom Q_s : l_tolower (83 : ℤ) = (115 : ℤ)
axiom Q_t : l_tolower (84 : ℤ) = (116 : ℤ)
axiom Q_u : l_tolower (85 : ℤ) = (117 : ℤ)
axiom Q_v : l_tolower (86 : ℤ) = (118 : ℤ)
axiom Q_w : l_tolower (87 : ℤ) = (119 : ℤ)
axiom Q_x : l_tolower (88 : ℤ) = (120 : ℤ)
axiom Q_y : l_tolower (89 : ℤ) = (121 : ℤ)
axiom Q_z : l_tolower (90 : ℤ) = (122 : ℤ)
axiom Q_pl (c : ℤ) (fact0 : ¬p_isupper c) : l_tolower c = c
axiom Q_pu (c : ℤ) (fact0 : ¬p_islower c) : l_toupper c = c
axiom Q_tl (c : ℤ) (fact0 : ¬p_islower c) : l_toupper (l_tolower c) = c
axiom Q_tu (c : ℤ) (fact0 : ¬p_isupper c) : l_tolower (l_toupper c) = c
end A_Ctype
