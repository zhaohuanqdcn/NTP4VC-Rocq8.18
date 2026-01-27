theory verifythis_2018_register_allocation_Top_eqqtrefnqtvc1
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  var
typedecl  set
consts to_fset :: "set \<Rightarrow> var fset"
consts mk :: "var fset \<Rightarrow> set"
axiomatization where mk'spec:   "to_fset (mk s) = s"
  for s :: "var fset"
consts choose1 :: "set \<Rightarrow> var"
axiomatization where choose'spec:   "choose1 s |\<in>| to_fset s"
 if "\<not>to_fset s = fempty"
  for s :: "set"
theorem eq'refn'vc:
  shows "True"
  sorry
end
