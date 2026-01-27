theory BacktrackArray_Impl_stampqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/BacktrackArray_Types" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/Predicates_Pred" "../../lib/isabelle/BacktrackArray_Logic" "../../lib/isabelle/Choice_Choice"
begin
theorem stamp'vc:
  fixes tb :: "'a t"
  assumes fact0: "correct tb"
  shows "timestamp'mk (current_time tb) (int (length (buffer tb))) (func_of_array (buffer tb) (Nil :: 'a list)) = current_timestamp tb"
  sorry
end
