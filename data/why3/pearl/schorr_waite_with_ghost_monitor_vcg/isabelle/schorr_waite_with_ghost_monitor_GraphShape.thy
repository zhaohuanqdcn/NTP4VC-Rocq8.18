theory schorr_waite_with_ghost_monitor_GraphShape
  imports "NTP4Verif.NTP4Verif" "./schorr_waite_with_ghost_monitor_Memory"
begin
definition edge :: "memory \<Rightarrow> loc \<Rightarrow> loc \<Rightarrow> _"
  where "edge m x y \<longleftrightarrow> \<not>x = null \<and> (left1 m x = y \<or> right1 m x = y)" for m x y
inductive path :: "memory \<Rightarrow> loc \<Rightarrow> loc \<Rightarrow> bool" where
   path_nil: "path m x x" for m :: "memory" and x :: "loc"
 | path_cons: "edge m x y \<Longrightarrow> path m y z \<Longrightarrow> path m x z" for m :: "memory" and x :: "loc" and y :: "loc" and z :: "loc"
definition well_colored_on :: "loc fset \<Rightarrow> loc fset \<Rightarrow> memory \<Rightarrow> (loc \<Rightarrow> bool) \<Rightarrow> _"
  where "well_colored_on graph gray m mark \<longleftrightarrow> gray |\<subseteq>| graph \<and> (\<forall>(x :: loc). x |\<in>| gray \<longrightarrow> mark x = True) \<and> (\<forall>(x :: loc) (y :: loc). x |\<in>| graph \<and> edge m x y \<and> \<not>y = null \<and> mark x = True \<longrightarrow> x |\<in>| gray \<or> mark y = True)" for graph gray m mark
definition unchanged_structure :: "memory \<Rightarrow> memory \<Rightarrow> _"
  where "unchanged_structure m1 m2 \<longleftrightarrow> (\<forall>(x :: loc). \<not>x = null \<longrightarrow> left1 m2 x = left1 m1 x \<and> right1 m2 x = right1 m1 x)" for m1 m2
end
