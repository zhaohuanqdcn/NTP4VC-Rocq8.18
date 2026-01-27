theory schorr_waite_via_recursion_GraphShape
  imports "NTP4Verif.NTP4Verif" "./schorr_waite_via_recursion_Memory"
begin
definition black :: "color \<Rightarrow> _"
  where "black c \<longleftrightarrow> \<not>c = White" for c
definition edge :: "memory \<Rightarrow> loc \<Rightarrow> loc \<Rightarrow> _"
  where "edge m x y \<longleftrightarrow> \<not>x = null \<and> (\<exists>(n :: int). ((0 :: int) \<le> n \<and> n < block_size m x) \<and> accessor m x n = y)" for m x y
inductive path :: "memory \<Rightarrow> loc \<Rightarrow> loc \<Rightarrow> bool" where
   path_nil: "path m x x" for m :: "memory" and x :: "loc"
 | path_cons: "edge m x y \<Longrightarrow> path m y z \<Longrightarrow> path m x z" for m :: "memory" and x :: "loc" and y :: "loc" and z :: "loc"
definition well_colored_on :: "loc fset \<Rightarrow> loc fset \<Rightarrow> memory \<Rightarrow> (loc \<Rightarrow> color) \<Rightarrow> _"
  where "well_colored_on graph gray m cl \<longleftrightarrow> gray |\<subseteq>| graph \<and> (\<forall>(x :: loc) (y :: loc). x |\<in>| graph \<and> edge m x y \<and> \<not>y = null \<and> black (cl x) \<longrightarrow> x |\<in>| gray \<or> black (cl y)) \<and> (\<forall>(x :: loc). x |\<in>| gray \<longrightarrow> black (cl x))" for graph gray m cl
definition unchanged :: "memory \<Rightarrow> memory \<Rightarrow> _"
  where "unchanged m1 m2 \<longleftrightarrow> (\<forall>(x :: loc) (n :: int). \<not>x = null \<and> (0 :: int) \<le> n \<and> n < block_size m1 x \<longrightarrow> accessor m2 x n = accessor m1 x n)" for m1 m2
end
