namespace A_HexToBin
axiom l_hex_to_bin : ℤ -> ℤ
axiom Q_A0 : l_hex_to_bin (48 : ℤ) = (0 : ℤ)
axiom Q_A1 : l_hex_to_bin (49 : ℤ) = (1 : ℤ)
axiom Q_A2 : l_hex_to_bin (50 : ℤ) = (2 : ℤ)
axiom Q_A3 : l_hex_to_bin (51 : ℤ) = (3 : ℤ)
axiom Q_A4 : l_hex_to_bin (52 : ℤ) = (4 : ℤ)
axiom Q_A5 : l_hex_to_bin (53 : ℤ) = (5 : ℤ)
axiom Q_A6 : l_hex_to_bin (54 : ℤ) = (6 : ℤ)
axiom Q_A7 : l_hex_to_bin (55 : ℤ) = (7 : ℤ)
axiom Q_A8 : l_hex_to_bin (56 : ℤ) = (8 : ℤ)
axiom Q_A9 : l_hex_to_bin (57 : ℤ) = (9 : ℤ)
axiom Q_AA : l_hex_to_bin (65 : ℤ) = (10 : ℤ) ∧ l_hex_to_bin (97 : ℤ) = l_hex_to_bin (65 : ℤ)
axiom Q_AB : l_hex_to_bin (66 : ℤ) = (11 : ℤ) ∧ l_hex_to_bin (98 : ℤ) = l_hex_to_bin (66 : ℤ)
axiom Q_AC : l_hex_to_bin (67 : ℤ) = (12 : ℤ) ∧ l_hex_to_bin (99 : ℤ) = l_hex_to_bin (67 : ℤ)
axiom Q_AD : l_hex_to_bin (68 : ℤ) = (13 : ℤ) ∧ l_hex_to_bin (100 : ℤ) = l_hex_to_bin (68 : ℤ)
axiom Q_AE : l_hex_to_bin (69 : ℤ) = (14 : ℤ) ∧ l_hex_to_bin (101 : ℤ) = l_hex_to_bin (69 : ℤ)
axiom Q_AF : l_hex_to_bin (70 : ℤ) = (15 : ℤ) ∧ l_hex_to_bin (102 : ℤ) = l_hex_to_bin (70 : ℤ)
end A_HexToBin
