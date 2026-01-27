theory verifythis_2018_mind_the_gap_2_GapBuffer_bufferqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
consts dummy_char :: "char"
theorem buffer'vc:
  shows "(0 :: int) \<le> (1 :: int)"
  and "\<forall>(o1 :: char list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (1 :: int) \<longrightarrow> o1 ! nat i = dummy_char) \<and> int (length o1) = (1 :: int) \<longrightarrow> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o1)"
  sorry
end
