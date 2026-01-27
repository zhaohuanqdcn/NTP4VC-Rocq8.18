theory verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_valid_split_fbqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  color = Red | Black
typedecl  coloring
definition tworedneighbors :: "color list \<Rightarrow> int \<Rightarrow> _"
  where "tworedneighbors c i \<longleftrightarrow> c ! nat (i - (2 :: int)) = Red \<and> c ! nat (i - (1 :: int)) = Red \<and> (2 :: int) \<le> i \<or> c ! nat (i - (1 :: int)) = Red \<and> c ! nat (i + (1 :: int)) = Red \<and> (1 :: int) \<le> i \<and> i \<le> int (length c) - (2 :: int) \<or> c ! nat (i + (1 :: int)) = Red \<and> c ! nat (i + (2 :: int)) = Red \<and> i \<le> int (length c) - (3 :: int)" for c i
definition valid :: "color list \<Rightarrow> _"
  where "valid c \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length c) \<longrightarrow> c ! nat i = Red \<longrightarrow> tworedneighbors c i)" for c
theorem valid_split_fb'vc:
  fixes k :: "int"
  fixes c :: "color list"
  assumes fact0: "(3 :: int) \<le> k"
  assumes fact1: "k < int (length c)"
  assumes fact2: "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < k \<longrightarrow> c ! nat i = Red"
  assumes fact3: "valid (drop (nat (k + (1 :: int))) c)"
  shows "valid c"
  sorry
end
