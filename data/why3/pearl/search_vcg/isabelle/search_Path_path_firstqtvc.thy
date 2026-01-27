theory search_Path_path_firstqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  state
consts moves :: "state \<Rightarrow> state list"
consts start :: "state"
consts success :: "state \<Rightarrow> bool"
inductive path :: "state \<Rightarrow> state \<Rightarrow> int \<Rightarrow> bool" where
   Path0: "path s s (0 :: int)" for s :: "state"
 | Path1: "(0 :: int) \<le> i \<Longrightarrow> i < int (length (moves s)) \<Longrightarrow> path s (moves s ! nat i) (1 :: int)" for i :: "int" and s :: "state"
 | Patht: "path s t n \<Longrightarrow> path t u m \<Longrightarrow> path s u (n + m)" for s :: "state" and t :: "state" and n :: "int" and u :: "state" and m :: "int"
definition move :: "state \<Rightarrow> state \<Rightarrow> _"
  where "move s t \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < int (length (moves s))) \<and> t = moves s ! nat i)" for s t
theorem path_first'vc:
  fixes s :: "state"
  fixes t :: "state"
  fixes n :: "int"
  assumes fact0: "path s t n"
  assumes fact1: "(0 :: int) < n"
  shows "let o1 :: int = int (length (moves s)) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>path (moves s ! nat j) t (n - (1 :: int))) \<and> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>path (moves s ! nat j) t (n - (1 :: int))) \<longrightarrow> (let s' :: state = moves s ! nat i in if path s' t (n - (1 :: int)) then move s s' \<and> path s' t (n - (1 :: int)) else \<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> \<not>path (moves s ! nat j) t (n - (1 :: int)))) \<and> \<not>(\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> \<not>path (moves s ! nat j) t (n - (1 :: int)))) \<and> \<not>o1 + (1 :: int) < (0 :: int)"
  sorry
end
