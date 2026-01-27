theory binary_multiplication_BinaryMultiplication_binary_multqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem binary_mult'vc:
  fixes b :: "int"
  fixes a :: "int"
  assumes fact0: "(0 :: int) \<le> b"
  shows "(0 :: int) \<le> b"
  and "(0 :: int) + a * b = a * b"
  and "\<forall>(z :: int) (y :: int) (x :: int). (0 :: int) \<le> y \<and> z + x * y = a * b \<longrightarrow> (if \<not>y = (0 :: int) then \<not>(2 :: int) = (0 :: int) \<and> (if y cmod (2 :: int) = (1 :: int) then \<not>(2 :: int) = (0 :: int) \<and> ((0 :: int) \<le> y \<and> y cdiv (2 :: int) < y) \<and> (0 :: int) \<le> y cdiv (2 :: int) \<and> z + x + (2 :: int) * x * (y cdiv (2 :: int)) = a * b else \<not>(2 :: int) = (0 :: int) \<and> ((0 :: int) \<le> y \<and> y cdiv (2 :: int) < y) \<and> (0 :: int) \<le> y cdiv (2 :: int) \<and> z + (2 :: int) * x * (y cdiv (2 :: int)) = a * b) else z = a * b)"
  sorry
end
