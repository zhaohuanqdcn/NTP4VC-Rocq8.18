theory search_Path_shorter_pathqtvc
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
theorem shorter_path'vc:
  fixes s :: "state"
  fixes t :: "state"
  fixes n :: "int"
  fixes m :: "int"
  fixes o1 :: "bool"
  assumes fact0: "path s t n"
  assumes fact1: "(0 :: int) \<le> m"
  assumes fact2: "m \<le> n"
  assumes fact3: "if n = (0 :: int) then o1 = True else o1 = (if m = (0 :: int) then True else False)"
  shows "\<not>o1 = True \<longrightarrow> (let o2 :: int = m - (1 :: int); o3 :: int = n - (1 :: int) in (path s t n \<and> (0 :: int) < n) \<and> (\<forall>(o4 :: state). move s o4 \<and> path o4 t (n - (1 :: int)) \<longrightarrow> ((0 :: int) \<le> n \<and> o3 < n) \<and> path o4 t o3 \<and> (0 :: int) \<le> o2 \<and> o2 \<le> o3))"
  and "\<forall>(r :: state). (if o1 = True then r = s else \<exists>(o2 :: state). (move s o2 \<and> path o2 t (n - (1 :: int))) \<and> path o2 r (m - (1 :: int))) \<longrightarrow> path s r m"
  sorry
end
