theory hashtbl_impl_HashtblImpl_bucketqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_Const"
begin
typedecl  key
consts hash :: "key \<Rightarrow> int"
axiomatization where hash'spec:   "(0 :: int) \<le> hash x"
  for x :: "key"
theorem bucket'vc:
  fixes n :: "int"
  fixes k :: "key"
  assumes fact0: "(0 :: int) < n"
  shows "let o1 :: int = hash k in (0 :: int) \<le> o1 \<longrightarrow> \<not>n = (0 :: int) \<and> (let result :: int = o1 cmod n in (0 :: int) \<le> result \<and> result < n)"
  sorry
end
