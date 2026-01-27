theory verifythis_2018_array_based_queuing_lock_2_ABQL_fetch_and_addqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
consts n :: "int"
axiomatization where N_val:   "(2 :: int) \<le> n"
consts k :: "int"
axiomatization where K_val:   "(2 :: int) \<le> k"
typedecl  tick
consts b :: "tick \<Rightarrow> int"
consts v :: "tick \<Rightarrow> int"
axiomatization where tick'invariant'0:   "(0 :: int) \<le> v self"
  for self :: "tick"
axiomatization where tick'invariant'1:   "(0 :: int) \<le> b self"
  for self :: "tick"
axiomatization where tick'invariant'2:   "b self < k * n"
  for self :: "tick"
axiomatization where tick'invariant'3:   "b self = v self emod (k * n)"
  for self :: "tick"
definition tick'eq :: "tick \<Rightarrow> tick \<Rightarrow> _"
  where "tick'eq a b1 \<longleftrightarrow> b a = b b1 \<and> v a = v b1" for a b1
axiomatization where tick'inj:   "a = b1"
 if "tick'eq a b1"
  for a :: "tick"
  and b1 :: "tick"
theorem fetch_and_add'vc:
  fixes r :: "tick"
  shows "let o1 :: int = v r + (1 :: int); o2 :: int = k * n in \<not>o2 = (0 :: int) \<and> (let o3 :: int = (b r + (1 :: int)) emod o2 in ((0 :: int) \<le> o1 \<and> ((0 :: int) \<le> o3 \<and> o3 < k * n) \<and> o3 = o1 emod (k * n)) \<and> (\<forall>(o4 :: tick). b o4 = o3 \<and> v o4 = o1 \<longrightarrow> v o4 = v r + (1 :: int)))"
  sorry
end
