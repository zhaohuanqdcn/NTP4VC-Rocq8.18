theory power_FastExponentiation_fast_expqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem fast_exp'vc:
  fixes n :: "int"
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "\<not>n = (0 :: int) \<longrightarrow> \<not>(2 :: int) = (0 :: int) \<and> (let o1 :: int = n cdiv (2 :: int) in (((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1) \<and> \<not>(2 :: int) = (0 :: int))"
  and "\<forall>(result :: int). (if n = (0 :: int) then result = (1 :: int) else let r :: int = x ^\<^sub>i (n cdiv (2 :: int)) in if n cmod (2 :: int) = (0 :: int) then result = r * r else result = r * r * x) \<longrightarrow> result = x ^\<^sub>i n"
  sorry
end
