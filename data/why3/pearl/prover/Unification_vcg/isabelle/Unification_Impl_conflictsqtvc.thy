theory Unification_Impl_conflictsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "../../lib/isabelle/Unification_Types" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/BacktrackArray_Types" "../../lib/isabelle/Predicates_Pred" "../../lib/isabelle/BacktrackArray_Logic" "../../lib/isabelle/Choice_Choice" "../../lib/isabelle/BacktrackArray_Impl" "../../lib/isabelle/Firstorder_symbol_spec_Spec" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Firstorder_symbol_impl_Logic" "../../lib/isabelle/Firstorder_symbol_impl_Impl" "../../lib/isabelle/Firstorder_term_spec_Spec" "../../lib/isabelle/Firstorder_term_impl_Types" "../../lib/isabelle/Firstorder_term_impl_Logic" "../../lib/isabelle/Firstorder_term_impl_Impl" "../../lib/isabelle/Unification_Logic"
begin
theorem conflicts'vc:
  fixes lv :: "sdata list"
  fixes rhob :: "sdata t"
  fixes rho :: "unifier_subst"
  assumes fact0: "list_forall sdata_inv lv"
  assumes fact1: "unifier_subst_ok rhob rho"
  shows "case lv of Nil \<Rightarrow> unifier_subst_ok rhob rho \<and> precede rhob rhob | Cons (Assign _) q \<Rightarrow> list_forall sdata_inv q \<and> unifier_subst_ok rhob rho | Cons (PConflict t1 t2) q \<Rightarrow> (sdata_inv (PConflict t1 t2) = True \<and> unifier_subst_ok rhob rho) \<and> (\<forall>(rhob1 :: sdata t). inv rhob1 = inv rhob \<longrightarrow> (unifier_subst_ok rhob1 rho \<and> precede rhob rhob1 \<longrightarrow> (list_forall sdata_inv q \<and> unifier_subst_ok rhob1 rho) \<and> (\<forall>(rhob2 :: sdata t). inv rhob2 = inv rhob1 \<longrightarrow> (unifier_subst_ok rhob2 rho \<and> precede rhob1 rhob2 \<longrightarrow> unifier_subst_ok rhob2 rho \<and> precede rhob rhob2) \<and> (correct rhob2 \<and> precede rhob1 rhob2 \<longrightarrow> correct rhob2 \<and> precede rhob rhob2))) \<and> (precede rhob rhob1 \<and> correct rhob1 \<longrightarrow> correct rhob1 \<and> precede rhob rhob1))"
  sorry
end
