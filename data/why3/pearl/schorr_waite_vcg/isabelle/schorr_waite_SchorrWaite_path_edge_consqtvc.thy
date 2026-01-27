theory schorr_waite_SchorrWaite_path_edge_consqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts null :: "loc"
typedecl  stacknodes
definition not_in_stack :: "loc \<Rightarrow> loc list \<Rightarrow> _"
  where "not_in_stack n s \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> \<not>n = s ! nat i)" for n s
definition last :: "loc list \<Rightarrow> loc"
  where "last s = s ! nat (int (length s) - (1 :: int))" for s
definition distinct :: "loc list \<Rightarrow> _"
  where "distinct s \<longleftrightarrow> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> (0 :: int) \<le> j \<and> j < int (length s) \<longrightarrow> \<not>i = j \<longrightarrow> \<not>s ! nat i = s ! nat j)" for s
definition edge :: "loc \<Rightarrow> loc \<Rightarrow> (loc \<Rightarrow> loc) \<Rightarrow> (loc \<Rightarrow> loc) \<Rightarrow> _"
  where "edge x y left1 right1 \<longleftrightarrow> \<not>x = null \<and> (left1 x = y \<or> right1 x = y)" for x y left1 right1
inductive path :: "(loc \<Rightarrow> loc) \<Rightarrow> (loc \<Rightarrow> loc) \<Rightarrow> loc \<Rightarrow> loc \<Rightarrow> loc list \<Rightarrow> bool" where
   path_nil: "path l r x x (Nil :: loc list)" for l :: "loc \<Rightarrow> loc" and r :: "loc \<Rightarrow> loc" and x :: "loc"
 | path_cons: "edge x z l r \<Longrightarrow> path l r z y p \<Longrightarrow> path l r x y (Cons x p)" for x :: "loc" and z :: "loc" and l :: "loc \<Rightarrow> loc" and r :: "loc \<Rightarrow> loc" and y :: "loc" and p :: "loc list"
theorem path_edge_cons'vc:
  fixes left1 :: "loc \<Rightarrow> loc"
  fixes right1 :: "loc \<Rightarrow> loc"
  fixes n :: "loc"
  fixes x :: "loc"
  fixes pth :: "loc list"
  fixes y :: "loc"
  assumes fact0: "path left1 right1 n x pth"
  assumes fact1: "edge x y left1 right1"
  shows "path left1 right1 n y (pth @ Cons x (Nil :: loc list))"
  sorry
end
