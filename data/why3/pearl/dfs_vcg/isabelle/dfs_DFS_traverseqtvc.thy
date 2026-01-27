theory dfs_DFS_traverseqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts null :: "loc"
consts root :: "loc"
consts left1 :: "loc \<Rightarrow> loc"
consts right1 :: "loc \<Rightarrow> loc"
typedecl  marks
definition edge :: "loc \<Rightarrow> loc \<Rightarrow> _"
  where "edge x y \<longleftrightarrow> \<not>x = null \<and> (left1 x = y \<or> right1 x = y)" for x y
inductive path :: "loc \<Rightarrow> loc \<Rightarrow> bool" where
   path_nil: "path x x" for x :: "loc"
 | path_cons: "path x y \<Longrightarrow> edge y z \<Longrightarrow> path x z" for x :: "loc" and y :: "loc" and z :: "loc"
definition only_descendants_are_marked :: "(loc \<Rightarrow> bool) \<Rightarrow> _"
  where "only_descendants_are_marked marked \<longleftrightarrow> (\<forall>(x :: loc). \<not>x = null \<and> marked x = True \<longrightarrow> path root x)" for marked
definition well_colored :: "(loc \<Rightarrow> bool) \<Rightarrow> (loc \<Rightarrow> bool) \<Rightarrow> _"
  where "well_colored marked busy \<longleftrightarrow> (\<forall>(x :: loc) (y :: loc). edge x y \<longrightarrow> \<not>y = null \<longrightarrow> busy x = True \<or> (marked x = True \<longrightarrow> marked y = True))" for marked busy
definition all_descendants_are_marked :: "(loc \<Rightarrow> bool) \<Rightarrow> _"
  where "all_descendants_are_marked marked \<longleftrightarrow> \<not>root = null \<longrightarrow> marked root = True \<and> (\<forall>(x :: loc) (y :: loc). edge x y \<longrightarrow> marked x = True \<longrightarrow> \<not>y = null \<longrightarrow> marked y = True)" for marked
theorem traverse'vc:
  fixes marked :: "loc \<Rightarrow> bool"
  fixes busy :: "loc \<Rightarrow> bool"
  assumes fact0: "\<forall>(x :: loc). \<not>x = null \<longrightarrow> marked x = False \<and> busy x = False"
  shows "let o1 :: loc = root in (well_colored marked busy \<and> only_descendants_are_marked marked \<and> path root o1) \<and> (\<forall>(busy1 :: loc \<Rightarrow> bool) (marked1 :: loc \<Rightarrow> bool). well_colored marked1 busy1 \<and> (\<forall>(x :: loc). marked x = True \<longrightarrow> marked1 x = True) \<and> (\<not>o1 = null \<longrightarrow> marked1 o1 = True) \<and> (\<forall>(x :: loc). busy1 x = True \<longrightarrow> busy x = True) \<and> only_descendants_are_marked marked1 \<longrightarrow> only_descendants_are_marked marked1 \<and> all_descendants_are_marked marked1 \<and> (\<forall>(x :: loc). \<not>x = null \<longrightarrow> busy1 x = False))"
  sorry
end
