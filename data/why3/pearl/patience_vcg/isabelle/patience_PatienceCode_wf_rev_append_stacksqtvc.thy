theory patience_PatienceCode_wf_rev_append_stacksqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  card
fun wf_stacks :: "int list list \<Rightarrow> _"
  where "wf_stacks (Nil :: int list list) = True"
      | "wf_stacks (Cons (Nil :: int list) x) = False" for x
      | "wf_stacks (Cons (Cons x x0) rem) = wf_stacks rem" for x x0 rem
theorem wf_rev_append_stacks'vc:
  fixes s1 :: "int list list"
  fixes s2 :: "int list list"
  assumes fact0: "wf_stacks s1"
  assumes fact1: "wf_stacks s2"
  shows "wf_stacks (rev s1 @ s2)"
  sorry
end
