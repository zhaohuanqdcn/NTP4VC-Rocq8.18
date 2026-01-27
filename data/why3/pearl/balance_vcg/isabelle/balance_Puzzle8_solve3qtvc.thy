theory balance_Puzzle8_solve3qtvc
  imports "NTP4Verif.NTP4Verif" "./balance_Roberval"
begin
definition spec :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "spec balls lo hi lb w \<longleftrightarrow> ((0 :: int) \<le> lo \<and> lo \<le> lb \<and> lb < hi \<and> hi \<le> int (length balls)) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> \<not>i = lb \<longrightarrow> balls ! nat i = w) \<and> balls ! nat lb < w" for balls lo hi lb w
theorem solve3'vc:
  fixes counter :: "counter"
  fixes balls :: "int list"
  fixes lo :: "int"
  fixes lb :: "int"
  fixes w :: "int"
  assumes fact0: "(1 :: int) \<le> v counter"
  assumes fact1: "spec balls lo (lo + (3 :: int)) lb w"
  shows "let o1 :: int = lo + (1 :: int) in ((0 :: int) \<le> o1 \<and> o1 < int (length balls)) \<and> (let o2 :: int = balls ! nat o1 in ((0 :: int) \<le> lo \<and> lo < int (length balls)) \<and> (let o3 :: int = balls ! nat lo in (0 :: int) < v counter \<and> (\<forall>(counter1 :: counter) (o4 :: outcome). (case o4 of Left \<Rightarrow> o2 < o3 | Equal \<Rightarrow> o3 = o2 | Right \<Rightarrow> o3 < o2) \<and> v counter1 = v counter - (1 :: int) \<longrightarrow> (case o4 of Right \<Rightarrow> True | Left \<Rightarrow> True | Equal \<Rightarrow> True) \<and> (\<forall>(result :: int). (case o4 of Right \<Rightarrow> result = lo | Left \<Rightarrow> result = lo + (1 :: int) | Equal \<Rightarrow> result = lo + (2 :: int)) \<longrightarrow> result = lb \<and> v counter1 = v counter - (1 :: int)))))"
  sorry
end
