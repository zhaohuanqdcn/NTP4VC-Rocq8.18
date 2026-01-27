theory verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_valid_restrictqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  color = Red | Black
typedecl  coloring
definition tworedneighbors :: "color list \<Rightarrow> int \<Rightarrow> _"
  where "tworedneighbors c i \<longleftrightarrow> c ! nat (i - (2 :: int)) = Red \<and> c ! nat (i - (1 :: int)) = Red \<and> (2 :: int) \<le> i \<or> c ! nat (i - (1 :: int)) = Red \<and> c ! nat (i + (1 :: int)) = Red \<and> (1 :: int) \<le> i \<and> i \<le> int (length c) - (2 :: int) \<or> c ! nat (i + (1 :: int)) = Red \<and> c ! nat (i + (2 :: int)) = Red \<and> i \<le> int (length c) - (3 :: int)" for c i
definition valid :: "color list \<Rightarrow> _"
  where "valid c \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length c) \<longrightarrow> c ! nat i = Red \<longrightarrow> tworedneighbors c i)" for c
theorem valid_restrict'vc:
  fixes c :: "color list"
  fixes k :: "int"
  assumes fact0: "valid c"
  assumes fact1: "(0 :: int) \<le> k"
  assumes fact2: "k < int (length c)"
  assumes fact3: "c ! nat k = Black"
  shows "valid (drop (nat (k + (1 :: int))) c)"
  sorry
end
