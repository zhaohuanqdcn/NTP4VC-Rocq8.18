theory blocking_semantics5_FreshVariables_append_nil_lqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/blocking_semantics5_Syntax" "../../lib/isabelle/blocking_semantics5_SemOp"
begin
theorem append_nil_l'vc:
  fixes l :: "'a list"
  shows "(Nil :: 'a list) @ l = l"
  sorry
end
