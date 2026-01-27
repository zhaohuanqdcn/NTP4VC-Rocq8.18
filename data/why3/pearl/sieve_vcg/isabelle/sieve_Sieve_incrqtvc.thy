theory sieve_Sieve_incrqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition no_factor_lt :: "int \<Rightarrow> int \<Rightarrow> _"
  where "no_factor_lt bnd num \<longleftrightarrow> (1 :: int) < num \<and> (\<forall>(k :: int) (l :: int). ((1 :: int) < l \<and> l < bnd) \<and> (1 :: int) < k \<longrightarrow> \<not>num = k * l)" for bnd num
theorem incr'vc:
  shows "True"
  sorry
end
