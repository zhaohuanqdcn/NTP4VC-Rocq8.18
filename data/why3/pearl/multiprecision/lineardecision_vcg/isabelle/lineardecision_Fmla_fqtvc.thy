theory lineardecision_Fmla_fqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  "value"
consts dummy :: "value"
consts foo :: "value \<Rightarrow> bool"
consts add :: "value \<Rightarrow> value \<Rightarrow> value"
datatype  "term" = Val "int" | Add "term" "term"
datatype  fmla = Forall "fmla" | Foo "term"
fun interp_term :: "term \<Rightarrow> (int \<Rightarrow> value) \<Rightarrow> value"
  where "interp_term (Val n) b = b n" for n b
      | "interp_term (Add t1 t2) b = add (interp_term t1 b) (interp_term t2 b)" for t1 t2 b
fun interp_fmla :: "fmla \<Rightarrow> int \<Rightarrow> (int \<Rightarrow> value) \<Rightarrow> bool"
  where "interp_fmla f l b = (if case f of Foo t \<Rightarrow> foo (interp_term t b) | Forall f1 \<Rightarrow> (\<forall>(v :: value). interp_fmla f1 (l - (1 :: int)) (b(l := v)) = True) then True else False)" for f l b
theorem f'vc:
  shows "True"
  sorry
end
