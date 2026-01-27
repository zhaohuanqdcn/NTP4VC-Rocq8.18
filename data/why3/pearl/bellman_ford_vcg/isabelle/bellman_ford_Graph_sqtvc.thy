theory bellman_ford_Graph_sqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  vertex
consts vertices :: "vertex fset"
consts edges :: "(vertex \<times> vertex) fset"
definition edge :: "vertex \<Rightarrow> vertex \<Rightarrow> _"
  where "edge x y \<longleftrightarrow> (x, y) |\<in>| edges" for x y
axiomatization where edges_def'0:   "x |\<in>| vertices"
 if "(x, y) |\<in>| edges"
  for x :: "vertex"
  and y :: "vertex"
axiomatization where edges_def'1:   "y |\<in>| vertices"
 if "(x, y) |\<in>| edges"
  for x :: "vertex"
  and y :: "vertex"
theorem s'vc:
  shows "True"
  sorry
end
