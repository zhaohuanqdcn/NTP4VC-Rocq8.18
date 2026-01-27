theory verifythis_2017_tree_buffer_RealTime_rtqtvc
  imports "NTP4Verif.NTP4Verif" "./verifythis_2017_tree_buffer_Spec"
begin
typedecl  elt
theorem rt'vc:
  shows "let o1 :: elt buf = buf'mk (1 :: int) (Nil :: elt list); xs :: elt list = (Nil :: elt list) in h o1 = (1 :: int) \<and> ((0 :: int) = int (length xs) \<and> int (length xs) < (1 :: int)) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> (1 :: int) \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (xs @ (Nil :: elt list)) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o1))"
  sorry
end
