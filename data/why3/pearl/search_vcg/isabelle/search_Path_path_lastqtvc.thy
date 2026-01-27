theory search_Path_path_lastqtvc
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
theorem path_last'vc:
  fixes s :: "state"
  fixes t :: "state"
  fixes n :: "int"
  assumes fact0: "path s t n"
  assumes fact1: "(0 :: int) < n"
  shows "\<not>n = (1 :: int) \<longrightarrow> (let o1 :: int = n - (1 :: int) in (path s t n \<and> (0 :: int) < n) \<and> (\<forall>(o2 :: state). move s o2 \<and> path o2 t (n - (1 :: int)) \<longrightarrow> ((0 :: int) \<le> n \<and> o1 < n) \<and> path o2 t o1 \<and> (0 :: int) < o1))"
  and "\<forall>(t' :: state). (if n = (1 :: int) then t' = s else \<exists>(o1 :: state). (move s o1 \<and> path o1 t (n - (1 :: int))) \<and> path o1 t' (n - (1 :: int) - (1 :: int)) \<and> move t' t) \<longrightarrow> path s t' (n - (1 :: int)) \<and> move t' t"
  sorry
end
