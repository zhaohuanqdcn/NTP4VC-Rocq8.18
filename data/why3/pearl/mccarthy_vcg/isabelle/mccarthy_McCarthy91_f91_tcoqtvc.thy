theory mccarthy_McCarthy91_f91_tcoqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
theorem f91_tco'vc:
  fixes n0 :: "int"
  shows "(100 :: int) < n0 \<or> n0 \<le> n0 \<and> n0 \<le> (101 :: int)"
  and "\<forall>(n :: int). n = n0 \<and> (100 :: int) < n0 \<or> n0 \<le> n \<and> n \<le> (101 :: int) \<longrightarrow> (if n \<le> (100 :: int) then let o1 :: int = n + (11 :: int) in ((0 :: int) \<le> (101 :: int) - n0 \<and> (101 :: int) - o1 < (101 :: int) - n0) \<and> ((0 :: int) \<le> (101 :: int) - n \<and> (101 :: int) - spec o1 < (101 :: int) - n) \<and> (spec o1 = n0 \<and> (100 :: int) < n0 \<or> n0 \<le> spec o1 \<and> spec o1 \<le> (101 :: int)) else n - (10 :: int) = spec n0)"
  sorry
end
