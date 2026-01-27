theory string_search_BadShiftTable_bad_shift_tableqtvc
  imports "NTP4Verif.NTP4Verif" "./string_search_Spec" "./string_search_Occurs" "Why3STD.ocaml_Exceptions"
begin
typedecl 'v t
consts to_fmap :: "'v t \<Rightarrow> (char, 'v) fmap"
theorem bad_shift_table'vc:
  fixes o1 :: "63 word t"
  assumes fact0: "to_fmap o1 = fmempty"
  shows "\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length '''') \<longrightarrow> '''' ! nat j |\<in>| fmdom (to_fmap o1)"
  and "(\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length '''') \<longrightarrow> '''' ! nat j |\<in>| fmdom (to_fmap o1)) \<longrightarrow> (\<forall>(c :: char). c |\<in>| fmdom (to_fmap o1) \<longrightarrow> (1 :: int) \<le> sint (fm_contents (to_fmap o1) c) \<and> sint (fm_contents (to_fmap o1) c) \<le> int (length '''') + (1 :: int)) \<and> ((\<forall>(c :: char). c |\<in>| fmdom (to_fmap o1) \<longrightarrow> (1 :: int) \<le> sint (fm_contents (to_fmap o1) c) \<and> sint (fm_contents (to_fmap o1) c) \<le> int (length '''') + (1 :: int)) \<longrightarrow> (\<forall>(c :: char). c |\<in>| fmdom (to_fmap o1) \<longrightarrow> (\<forall>(j :: int). (1 :: int) \<le> j \<and> j < sint (fm_contents (to_fmap o1) c) \<longrightarrow> \<not>'''' ! nat (int (length '''') - j) = c)))"
  sorry
end
