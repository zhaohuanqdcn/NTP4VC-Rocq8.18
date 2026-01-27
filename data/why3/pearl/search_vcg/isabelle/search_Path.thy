theory search_Path
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
datatype  outcome = NoSolution | Solution "state" "int"
end
