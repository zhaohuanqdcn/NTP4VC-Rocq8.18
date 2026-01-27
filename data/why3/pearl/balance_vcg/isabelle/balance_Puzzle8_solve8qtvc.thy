theory balance_Puzzle8_solve8qtvc
  imports "NTP4Verif.NTP4Verif" "./balance_Roberval"
begin
definition spec :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "spec balls lo hi lb w \<longleftrightarrow> ((0 :: int) \<le> lo \<and> lo \<le> lb \<and> lb < hi \<and> hi \<le> int (length balls)) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> \<not>i = lb \<longrightarrow> balls ! nat i = w) \<and> balls ! nat lb < w" for balls lo hi lb w
theorem solve8'vc:
  fixes counter :: "counter"
  fixes balls :: "int list"
  fixes lb :: "int"
  fixes w :: "int"
  assumes fact0: "v counter = (2 :: int)"
  assumes fact1: "spec balls (0 :: int) (8 :: int) lb w"
  shows "(0 :: int) \<le> (5 :: int)"
  and "(5 :: int) < int (length balls)"
  and "(0 :: int) \<le> (4 :: int)"
  and "(4 :: int) < int (length balls)"
  and "(0 :: int) \<le> (3 :: int)"
  and "(3 :: int) < int (length balls)"
  and "let o1 :: int = balls ! (3 :: nat) + balls ! (4 :: nat) + balls ! (5 :: nat) in ((0 :: int) \<le> (2 :: int) \<and> (2 :: int) < int (length balls)) \<and> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) < int (length balls)) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < int (length balls)) \<and> (let o2 :: int = balls ! (0 :: nat) + balls ! (1 :: nat) + balls ! (2 :: nat) in (0 :: int) < v counter \<and> (\<forall>(counter1 :: counter) (o3 :: outcome). (case o3 of Left \<Rightarrow> o1 < o2 | Equal \<Rightarrow> o2 = o1 | Right \<Rightarrow> o2 < o1) \<and> v counter1 = v counter - (1 :: int) \<longrightarrow> (case o3 of Right \<Rightarrow> (1 :: int) \<le> v counter1 \<and> spec balls (0 :: int) ((0 :: int) + (3 :: int)) lb w | Left \<Rightarrow> (1 :: int) \<le> v counter1 \<and> spec balls (3 :: int) ((3 :: int) + (3 :: int)) lb w | Equal \<Rightarrow> ((0 :: int) \<le> (7 :: int) \<and> (7 :: int) < int (length balls)) \<and> (let o4 :: int = balls ! (7 :: nat) in ((0 :: int) \<le> (6 :: int) \<and> (6 :: int) < int (length balls)) \<and> (let o5 :: int = balls ! (6 :: nat) in (0 :: int) < v counter1 \<and> (\<forall>(counter2 :: counter) (o6 :: outcome). (case o6 of Left \<Rightarrow> o4 < o5 | Equal \<Rightarrow> o5 = o4 | Right \<Rightarrow> o5 < o4) \<and> v counter2 = v counter1 - (1 :: int) \<longrightarrow> (case o6 of Right \<Rightarrow> True | Left \<Rightarrow> True | Equal \<Rightarrow> False) \<and> (\<forall>(result :: int). (case o6 of Right \<Rightarrow> result = (6 :: int) | Left \<Rightarrow> result = (7 :: int) | Equal \<Rightarrow> False) \<longrightarrow> result = lb)))))))"
  sorry
end
