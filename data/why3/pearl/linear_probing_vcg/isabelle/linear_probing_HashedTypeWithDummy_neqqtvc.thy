theory linear_probing_HashedTypeWithDummy_neqqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  key
typedecl  keym
consts keym1 :: "key \<Rightarrow> keym"
consts eq :: "key \<Rightarrow> key \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> keym1 x = keym1 y"
  for x :: "key"
  and y :: "key"
theorem neq'vc:
  fixes x :: "key"
  fixes y :: "key"
  assumes fact0: "eq x y \<longleftrightarrow> keym1 x = keym1 y"
  shows "\<not>eq x y \<longleftrightarrow> \<not>keym1 x = keym1 y"
  sorry
end
