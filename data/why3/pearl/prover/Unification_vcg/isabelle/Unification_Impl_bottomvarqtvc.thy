theory Unification_Impl_bottomvarqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "../../lib/isabelle/Unification_Types" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/BacktrackArray_Types" "../../lib/isabelle/Predicates_Pred" "../../lib/isabelle/BacktrackArray_Logic" "../../lib/isabelle/Choice_Choice" "../../lib/isabelle/BacktrackArray_Impl" "../../lib/isabelle/Firstorder_symbol_spec_Spec" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Firstorder_symbol_impl_Logic" "../../lib/isabelle/Firstorder_symbol_impl_Impl" "../../lib/isabelle/Firstorder_term_spec_Spec" "../../lib/isabelle/Firstorder_term_impl_Types" "../../lib/isabelle/Firstorder_term_impl_Logic" "../../lib/isabelle/Firstorder_term_impl_Impl" "../../lib/isabelle/Unification_Logic"
begin
theorem bottomvar'vc:
  fixes rhob :: "sdata t"
  fixes rho :: "unifier_subst"
  fixes x :: "int"
  assumes fact0: "unifier_subst_ok rhob rho"
  assumes fact1: "unassigned (current_timestamp rhob) x"
  shows "let tm :: (int, int) fo_term = Var_fo_term x in tm = subst_fo_term tm subst_id_symbol (unifier_base_model rho) \<and> tm = subst_fo_term tm subst_id_symbol (unifier rho)"
  sorry
end
