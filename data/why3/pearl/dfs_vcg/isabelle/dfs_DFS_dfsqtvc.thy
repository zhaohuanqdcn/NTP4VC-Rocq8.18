theory dfs_DFS_dfsqtvc
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
theorem dfs'vc:
  fixes marked :: "loc \<Rightarrow> bool"
  fixes busy :: "loc \<Rightarrow> bool"
  fixes c :: "loc"
  fixes o1 :: "bool"
  assumes fact0: "well_colored marked busy"
  assumes fact1: "only_descendants_are_marked marked"
  assumes fact2: "path root c"
  assumes fact3: "if \<not>c = null then o1 = (if marked c = True then False else True) else o1 = False"
  shows "if o1 = True then let o2 :: loc = left1 c in (well_colored (marked(c := True)) (busy(c := True)) \<and> only_descendants_are_marked (marked(c := True)) \<and> path root o2) \<and> (\<forall>(busy1 :: loc \<Rightarrow> bool) (marked1 :: loc \<Rightarrow> bool). well_colored marked1 busy1 \<and> (\<forall>(x :: loc). (marked(c := True)) x = True \<longrightarrow> marked1 x = True) \<and> (\<not>o2 = null \<longrightarrow> marked1 o2 = True) \<and> (\<forall>(x :: loc). busy1 x = True \<longrightarrow> (busy(c := True)) x = True) \<and> only_descendants_are_marked marked1 \<longrightarrow> (let o3 :: loc = right1 c in (well_colored marked1 busy1 \<and> only_descendants_are_marked marked1 \<and> path root o3) \<and> (\<forall>(busy2 :: loc \<Rightarrow> bool) (marked2 :: loc \<Rightarrow> bool). well_colored marked2 busy2 \<and> (\<forall>(x :: loc). marked1 x = True \<longrightarrow> marked2 x = True) \<and> (\<not>o3 = null \<longrightarrow> marked2 o3 = True) \<and> (\<forall>(x :: loc). busy2 x = True \<longrightarrow> busy1 x = True) \<and> only_descendants_are_marked marked2 \<longrightarrow> well_colored marked2 (busy2(c := False)) \<and> (\<forall>(x :: loc). marked x = True \<longrightarrow> marked2 x = True) \<and> (\<not>c = null \<longrightarrow> marked2 c = True) \<and> (\<forall>(x :: loc). (busy2(c := False)) x = True \<longrightarrow> busy x = True) \<and> only_descendants_are_marked marked2))) else well_colored marked busy \<and> (\<not>c = null \<longrightarrow> marked c = True) \<and> only_descendants_are_marked marked"
  sorry
end
