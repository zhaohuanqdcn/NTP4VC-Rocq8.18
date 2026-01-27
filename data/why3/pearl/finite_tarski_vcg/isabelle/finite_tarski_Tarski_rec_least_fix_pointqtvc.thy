theory finite_tarski_Tarski_rec_least_fix_pointqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  t
consts rel :: "t \<Rightarrow> t \<Rightarrow> bool"
axiomatization where Refl:   "rel x x"
  for x :: "t"
axiomatization where Trans:   "rel x z"
 if "rel x y"
 and "rel y z"
  for x :: "t"
  and y :: "t"
  and z :: "t"
axiomatization where Antisymm:   "x = y"
 if "rel x y"
 and "rel y x"
  for x :: "t"
  and y :: "t"
consts a :: "t fset"
consts e :: "t"
axiomatization where minimality'0:   "e |\<in>| a"
axiomatization where minimality'1:   "\<forall>(x :: t). x |\<in>| a \<longrightarrow> rel e x"
consts f :: "t \<Rightarrow> t"
axiomatization where range:   "f x |\<in>| a"
 if "x |\<in>| a"
  for x :: "t"
axiomatization where monotone:   "rel (f x) (f y)"
 if "x |\<in>| a"
 and "y |\<in>| a"
 and "rel x y"
  for x :: "t"
  and y :: "t"
definition fixpoint :: "t \<Rightarrow> _"
  where "fixpoint x \<longleftrightarrow> x |\<in>| a \<and> f x = x" for x
theorem least_fix_point'vc:
  shows "\<exists>(mu :: t). fixpoint mu \<and> (\<forall>(x :: t). fixpoint x \<longrightarrow> rel mu x)"
  sorry
end
