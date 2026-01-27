theory binary_multiplication_BinaryMultiplication63_binary_multqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem binary_mult'vc:
  fixes a :: "63 word"
  fixes b :: "63 word"
  assumes fact0: "sint int'63_min < sint a * sint b"
  assumes fact1: "sint a * sint b \<le> sint int'63_max"
  shows "if (0 :: int) \<le> sint a * sint b then (0 :: int) \<le> sint a * sint b \<and> (0 :: int) \<le> (0 :: int) else sint a * sint b \<le> (0 :: int) \<and> (0 :: int) \<le> (0 :: int)"
  and "(0 :: int) + sint a * sint b = sint a * sint b"
  and "\<forall>(z :: 63 word) (y :: 63 word) (x :: 63 word). (if (0 :: int) \<le> sint a * sint b then (0 :: int) \<le> sint x * sint y \<and> (0 :: int) \<le> sint z else sint x * sint y \<le> (0 :: int) \<and> sint z \<le> (0 :: int)) \<and> sint z + sint x * sint y = sint a * sint b \<longrightarrow> (sint y = (0 :: int) \<longrightarrow> y = (0 :: 63 word)) \<longrightarrow> (if \<not>y = (0 :: 63 word) then (\<not>(2 :: int) = (0 :: int) \<and> int'63_in_bounds (sint y cmod (2 :: int))) \<and> (\<forall>(o1 :: 63 word). sint o1 = sint y cmod (2 :: int) \<longrightarrow> int'63_in_bounds (sint x * sint o1) \<and> (\<forall>(o2 :: 63 word). sint o2 = sint x * sint o1 \<longrightarrow> int'63_in_bounds (sint z + sint o2) \<and> (\<forall>(o3 :: 63 word). sint o3 = sint z + sint o2 \<longrightarrow> (\<not>(2 :: int) = (0 :: int) \<and> int'63_in_bounds (sint y cdiv (2 :: int))) \<and> (\<forall>(o4 :: 63 word). sint o4 = sint y cdiv (2 :: int) \<longrightarrow> (sint o4 = (0 :: int) \<longrightarrow> o4 = (0 :: 63 word)) \<longrightarrow> (if \<not>o4 = (0 :: 63 word) then int'63_in_bounds ((2 :: int) * sint x) \<and> (\<forall>(o5 :: 63 word). sint o5 = (2 :: int) * sint x \<longrightarrow> ((0 :: int) \<le> abs (sint y) \<and> abs (sint o4) < abs (sint y)) \<and> (if (0 :: int) \<le> sint a * sint b then (0 :: int) \<le> sint o5 * sint o4 \<and> (0 :: int) \<le> sint o3 else sint o5 * sint o4 \<le> (0 :: int) \<and> sint o3 \<le> (0 :: int)) \<and> sint o3 + sint o5 * sint o4 = sint a * sint b) else ((0 :: int) \<le> abs (sint y) \<and> abs (sint o4) < abs (sint y)) \<and> (if (0 :: int) \<le> sint a * sint b then (0 :: int) \<le> sint x * sint o4 \<and> (0 :: int) \<le> sint o3 else sint x * sint o4 \<le> (0 :: int) \<and> sint o3 \<le> (0 :: int)) \<and> sint o3 + sint x * sint o4 = sint a * sint b))))) else sint z = sint a * sint b)"
  sorry
end
