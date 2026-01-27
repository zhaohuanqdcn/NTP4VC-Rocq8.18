theory arm_InsertionSortExample_path_l2_exitqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./arm_ARM"
begin
consts a :: "int"
definition separation :: "int \<Rightarrow> _"
  where "separation fp \<longleftrightarrow> a + (10 :: int) < fp - (24 :: int)" for fp
definition inv :: "(int \<Rightarrow> int) \<Rightarrow> _"
  where "inv mem \<longleftrightarrow> mem a = (0 :: int) \<and> (\<forall>(k :: int). (1 :: int) \<le> k \<and> k \<le> (10 :: int) \<longrightarrow> (0 :: int) < mem (a + k))" for mem
definition inv_l2 :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "inv_l2 mem fp l4 \<longleftrightarrow> ((2 :: int) \<le> mem (fp - (16 :: int)) \<and> mem (fp - (16 :: int)) \<le> (11 :: int)) \<and> l4 = mem (fp - (16 :: int)) - (2 :: int) \<and> inv mem" for mem fp l4
theorem path_l2_exit'vc:
  fixes fp :: "int"
  fixes mem :: "int \<Rightarrow> int"
  fixes l4 :: "int"
  assumes fact0: "separation fp"
  assumes fact1: "inv_l2 mem fp l4"
  assumes fact2: "False = True \<longleftrightarrow> mem (fp - (16 :: int)) \<le> (10 :: int)"
  shows "l4 = (9 :: int)"
  sorry
end
