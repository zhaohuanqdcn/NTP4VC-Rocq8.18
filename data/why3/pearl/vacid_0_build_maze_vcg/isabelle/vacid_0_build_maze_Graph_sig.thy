theory vacid_0_build_maze_Graph_sig
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  graph
inductive path :: "graph \<Rightarrow> int \<Rightarrow> int \<Rightarrow> bool" where
   Path_refl: "path g x x" for g :: "graph" and x :: "int"
 | Path_sym: "path g x y \<Longrightarrow> path g y x" for g :: "graph" and x :: "int" and y :: "int"
 | Path_trans: "path g x y \<Longrightarrow> path g y z \<Longrightarrow> path g x z" for g :: "graph" and x :: "int" and y :: "int" and z :: "int"
end
