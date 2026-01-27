theory remove_duplicate_RemoveDuplicateQuadratic_test_appearsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./remove_duplicate_Spec"
begin
typedecl  t
consts eq :: "t \<Rightarrow> t \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> x = y"
  for x :: "t"
  and y :: "t"
theorem test_appears'vc:
  fixes s :: "int"
  fixes a :: "t list"
  fixes v :: "t"
  assumes fact0: "(0 :: int) \<le> s"
  assumes fact1: "s \<le> int (length a)"
  shows "if (0 :: int) < s then let o1 :: int = s - (1 :: int) in ((0 :: int) \<le> o1 \<and> o1 < int (length a)) \<and> (let o2 :: t = a ! nat o1 in (eq o2 v \<longleftrightarrow> o2 = v) \<longrightarrow> (if eq o2 v then appears v a s \<and> ((0 :: int) \<le> s - (1 :: int) \<and> s - (1 :: int) < s) \<and> a ! nat (s - (1 :: int)) = v else let o3 :: int = s - (1 :: int) in (((0 :: int) \<le> s \<and> o3 < s) \<and> (0 :: int) \<le> o3 \<and> o3 \<le> int (length a)) \<and> (\<forall>(w :: int). (appears v a o3 \<longrightarrow> ((0 :: int) \<le> w \<and> w < o3) \<and> a ! nat w = v) \<longrightarrow> (appears v a o3 \<longleftrightarrow> appears v a s) \<and> (appears v a o3 \<longrightarrow> ((0 :: int) \<le> w \<and> w < s) \<and> a ! nat w = v)))) else \<not>appears v a s"
  sorry
end
