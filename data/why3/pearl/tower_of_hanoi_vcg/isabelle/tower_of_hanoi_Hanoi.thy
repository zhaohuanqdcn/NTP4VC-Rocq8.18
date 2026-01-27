theory tower_of_hanoi_Hanoi
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  tower
consts rod :: "tower \<Rightarrow> int list"
axiomatization where tower'invariant:   "sorted (rod self)"
  for self :: "tower"
definition tower'eq :: "tower \<Rightarrow> tower \<Rightarrow> _"
  where "tower'eq a b \<longleftrightarrow> rod a = rod b" for a b
axiomatization where tower'inj:   "a = b"
 if "tower'eq a b"
  for a :: "tower"
  and b :: "tower"
consts prepend :: "int \<Rightarrow> int list \<Rightarrow> int list"
axiomatization where prepend_def_zero:   "prepend n s = s"
 if "n \<le> (0 :: int)"
  for n :: "int"
  and s :: "int list"
axiomatization where prepend_def_succ:   "prepend n s = prepend (n - (1 :: int)) (Cons n s)"
 if "(0 :: int) < n"
  for n :: "int"
  and s :: "int list"
end
