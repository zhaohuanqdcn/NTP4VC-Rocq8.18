theory verifythis_2018_register_allocation_Top_remqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.ocaml_Exceptions"
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
typedecl 'v t
consts to_fmap :: "'v t \<Rightarrow> (var, 'v) fmap"
theorem rem'vc:
  fixes v :: "var"
  fixes g :: "set t"
  fixes remv :: "set t"
  fixes result :: "set t"
  assumes fact0: "v |\<in>| fmdom (to_fmap g)"
  assumes fact1: "to_fmap remv = fmdrop v (to_fmap g)"
  assumes fact2: "\<forall>(k :: var). k |\<in>| fmdom (to_fmap result) \<longleftrightarrow> k |\<in>| fmdom (to_fmap remv)"
  assumes fact3: "\<forall>(k :: var). k |\<in>| fmdom (to_fmap result) \<longrightarrow> to_fset (the (fmlookup (to_fmap result) k)) = fset_remove v (to_fset (the (fmlookup (to_fmap remv) k)))"
  assumes fact4: "fcard (fset_of_fmap (to_fmap result)) = fcard (fset_of_fmap (to_fmap remv))"
  shows "\<not>v |\<in>| fmdom (to_fmap result)"
  and "\<forall>(k :: var). k |\<in>| fmdom (to_fmap result) \<longleftrightarrow> \<not>k = v \<and> k |\<in>| fmdom (to_fmap g)"
  and "\<forall>(k :: var). k |\<in>| fmdom (to_fmap result) \<longrightarrow> to_fset (the (fmlookup (to_fmap result) k)) = fset_remove v (to_fset (the (fmlookup (to_fmap g) k)))"
  and "int (fcard (fset_of_fmap (to_fmap result))) = int (fcard (fset_of_fmap (to_fmap g))) - (1 :: int)"
  sorry
end
