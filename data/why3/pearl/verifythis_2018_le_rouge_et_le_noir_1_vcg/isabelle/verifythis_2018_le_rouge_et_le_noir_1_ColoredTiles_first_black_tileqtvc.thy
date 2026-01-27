theory verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_first_black_tileqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  color = Red | Black
typedecl  coloring
definition tworedneighbors :: "color list \<Rightarrow> int \<Rightarrow> _"
  where "tworedneighbors c i \<longleftrightarrow> c ! nat (i - (2 :: int)) = Red \<and> c ! nat (i - (1 :: int)) = Red \<and> (2 :: int) \<le> i \<or> c ! nat (i - (1 :: int)) = Red \<and> c ! nat (i + (1 :: int)) = Red \<and> (1 :: int) \<le> i \<and> i \<le> int (length c) - (2 :: int) \<or> c ! nat (i + (1 :: int)) = Red \<and> c ! nat (i + (2 :: int)) = Red \<and> i \<le> int (length c) - (3 :: int)" for c i
definition valid :: "color list \<Rightarrow> _"
  where "valid c \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length c) \<longrightarrow> c ! nat i = Red \<longrightarrow> tworedneighbors c i)" for c
theorem first_black_tile'vc:
  fixes c :: "color list"
  shows "let o1 :: int = int (length c) in (\<not>o1 = (0 :: int) \<longrightarrow> (case c ! (0 :: nat) of Black \<Rightarrow> True | Red \<Rightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) \<le> int (length c)) \<and> (0 :: int) \<le> int (length c) \<and> length (drop (1 :: nat) c) < length c)) \<and> (\<forall>(result :: int). (if o1 = (0 :: int) then result = (0 :: int) else (case c ! (0 :: nat) of Black \<Rightarrow> result = (0 :: int) | Red \<Rightarrow> (let o2 :: color list = drop (1 :: nat) c in \<exists>(r :: int). (((0 :: int) \<le> r \<and> r \<le> int (length o2)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < r \<and> r \<le> int (length o2) \<longrightarrow> o2 ! nat j = Red) \<and> (r < int (length o2) \<longrightarrow> o2 ! nat r = Black) \<and> (valid o2 \<longrightarrow> r = (0 :: int) \<or> (3 :: int) \<le> r)) \<and> result = (1 :: int) + r))) \<longrightarrow> ((0 :: int) \<le> result \<and> result \<le> int (length c)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < result \<and> result \<le> int (length c) \<longrightarrow> c ! nat j = Red) \<and> (result < int (length c) \<longrightarrow> c ! nat result = Black) \<and> (valid c \<longrightarrow> result = (0 :: int) \<or> (3 :: int) \<le> result))"
  sorry
end
