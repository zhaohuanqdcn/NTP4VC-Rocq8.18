theory BacktrackArray_Impl_getqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/BacktrackArray_Types" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/Predicates_Pred" "../../lib/isabelle/BacktrackArray_Logic" "../../lib/isabelle/Choice_Choice"
begin
theorem get'vc:
  fixes tb :: "'a t"
  fixes x :: "int"
  assumes fact0: "correct tb"
  assumes fact1: "(0 :: int) \<le> x"
  shows "let o1 :: int = int (length (buffer tb)) in (\<not>o1 \<le> x \<longrightarrow> (0 :: int) \<le> x \<and> x < int (length (buffer tb))) \<and> (\<forall>(result :: 'a list). (if o1 \<le> x then result = (Nil :: 'a list) else result = buffer tb ! nat x) \<longrightarrow> result = table (current_timestamp tb) x \<and> list_forall (inv tb) result)"
  sorry
end
