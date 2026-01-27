theory my_bag_Bag_addqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a bag
definition infix_eqeq :: "('a \<Rightarrow> int) \<Rightarrow> ('a \<Rightarrow> int) \<Rightarrow> _"
  where "infix_eqeq b1 b2 \<longleftrightarrow> (\<forall>(x :: 'a). b1 x = b2 x)" for b1 b2
theorem add'vc:
  shows "True"
  sorry
end
