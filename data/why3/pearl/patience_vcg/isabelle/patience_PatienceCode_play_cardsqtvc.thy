theory patience_PatienceCode_play_cardsqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  card
fun wf_stacks :: "int list list \<Rightarrow> _"
  where "wf_stacks (Nil :: int list list) = True"
      | "wf_stacks (Cons (Nil :: int list) x) = False" for x
      | "wf_stacks (Cons (Cons x x0) rem) = wf_stacks rem" for x x0 rem
theorem play_cards'vc:
  fixes stacks1 :: "int list list"
  fixes input :: "int list"
  assumes fact0: "wf_stacks stacks1"
  shows "case input of Nil \<Rightarrow> True | Cons c rem \<Rightarrow> (wf_stacks stacks1 \<and> wf_stacks (Nil :: int list list)) \<and> (\<forall>(stacks' :: int list list). wf_stacks stacks' \<longrightarrow> (case input of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = rem) \<and> wf_stacks stacks')"
  and "\<forall>(result :: int list list). (case input of Nil \<Rightarrow> result = stacks1 | Cons c rem \<Rightarrow> (\<exists>(stacks' :: int list list). wf_stacks stacks' \<and> wf_stacks result)) \<longrightarrow> wf_stacks result"
  sorry
end
