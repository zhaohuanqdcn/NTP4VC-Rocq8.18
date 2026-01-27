theory verifythis_2018_mind_the_gap_1_Top_gap_bufferqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
consts any_char :: "char"
theorem gap_buffer'vc:
  shows "(0 :: int) \<le> (0 :: int)"
  and "\<forall>(o1 :: char list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o1 ! nat i = any_char) \<and> int (length o1) = (0 :: int) \<longrightarrow> (let content :: char list = [] in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o1)) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o1) \<longrightarrow> int (length o1) = int (length content) + (0 :: int) - (0 :: int) \<and> (int (length o1) = int (length content) + (0 :: int) - (0 :: int) \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> content ! nat i = (nth o1 o nat) i) \<and> ((\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> content ! nat i = (nth o1 o nat) i) \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length content) \<longrightarrow> content ! nat i = (nth o1 o nat) (i + (0 :: int) - (0 :: int)))))))"
  sorry
end
