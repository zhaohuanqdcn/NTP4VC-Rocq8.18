theory proper_cuts_ProperCut_mapqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition injective :: "('a \<Rightarrow> 'b) \<Rightarrow> _"
  where "injective f \<longleftrightarrow> (\<forall>(x :: 'a) (x' :: 'a). \<not>x = x' \<longrightarrow> \<not>f x = f x')" for f
theorem map'vc:
  fixes l :: "'a list"
  fixes f :: "'a \<Rightarrow> 'b"
  shows "case l of (Nil :: 'a list) \<Rightarrow> True | Cons x s \<Rightarrow> (case l of (Nil :: 'a list) \<Rightarrow> False | Cons _ f \<Rightarrow> f = s)"
  and "\<forall>(r :: 'b list). (case l of (Nil :: 'a list) \<Rightarrow> r = (Nil :: 'b list) | Cons x s \<Rightarrow> (\<exists>(o1 :: 'b list). ((\<forall>(y :: 'b). y \<in> set o1 \<longleftrightarrow> (\<exists>(x1 :: 'a). x1 \<in> set s \<and> y = f x1)) \<and> (distinct s \<longrightarrow> injective f \<longrightarrow> distinct o1)) \<and> r = Cons (f x) o1)) \<longrightarrow> (\<forall>(y :: 'b). y \<in> set r \<longleftrightarrow> (\<exists>(x :: 'a). x \<in> set l \<and> y = f x)) \<and> (distinct l \<longrightarrow> injective f \<longrightarrow> distinct r)"
  sorry
end
