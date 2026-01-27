theory patience_PatienceCode_testqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  card
fun wf_stacks :: "int list list \<Rightarrow> _"
  where "wf_stacks (Nil :: int list list) = True"
      | "wf_stacks (Cons (Nil :: int list) x) = False" for x
      | "wf_stacks (Cons (Cons x x0) rem) = wf_stacks rem" for x x0 rem
theorem test'vc:
  shows "True"
  sorry
end
