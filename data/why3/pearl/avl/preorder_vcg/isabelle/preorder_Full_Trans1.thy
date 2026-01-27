theory preorder_Full_Trans1
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  t
consts le :: "t \<Rightarrow> t \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "t"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "t"
  and y :: "t"
  and z :: "t"
consts eq :: "t \<Rightarrow> t \<Rightarrow> bool"
axiomatization where eq_def:   "eq x y \<longleftrightarrow> le x y \<and> le y x"
  for x :: "t"
  and y :: "t"
consts lt :: "t \<Rightarrow> t \<Rightarrow> bool"
axiomatization where lt_def:   "lt x y \<longleftrightarrow> le x y \<and> \<not>le y x"
  for x :: "t"
  and y :: "t"
theorem Trans1:
  fixes x :: "t"
  fixes y :: "t"
  fixes z :: "t"
  assumes fact0: "lt x y"
  assumes fact1: "lt y z"
  shows "lt x z"
  sorry
end
