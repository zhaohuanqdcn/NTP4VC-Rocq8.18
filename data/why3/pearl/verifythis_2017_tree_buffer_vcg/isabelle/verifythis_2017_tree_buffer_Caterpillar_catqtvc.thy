theory verifythis_2017_tree_buffer_Caterpillar_catqtvc
  imports "NTP4Verif.NTP4Verif" "./verifythis_2017_tree_buffer_Spec"
begin
theorem cat'vc:
  shows "let o1 :: 'a buf = buf'mk (1 :: int) (Nil :: 'a list); xs :: 'a list = (Nil :: 'a list) in h o1 = (1 :: int) \<and> ((0 :: int) = int (length xs) \<and> int (length xs) < (1 :: int)) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> (1 :: int) \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (xs @ (Nil :: 'a list)) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o1))"
  sorry
end
