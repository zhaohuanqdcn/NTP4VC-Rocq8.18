theory Unification_Logic_smodel_depend_only_modelqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/Unification_Types" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/BacktrackArray_Types" "../../lib/isabelle/Predicates_Pred" "../../lib/isabelle/BacktrackArray_Logic" "../../lib/isabelle/Choice_Choice" "../../lib/isabelle/BacktrackArray_Impl" "../../lib/isabelle/Firstorder_symbol_spec_Spec" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Firstorder_symbol_impl_Logic" "../../lib/isabelle/Firstorder_symbol_impl_Impl" "../../lib/isabelle/Firstorder_term_spec_Spec" "../../lib/isabelle/Firstorder_term_impl_Types" "../../lib/isabelle/Firstorder_term_impl_Logic" "../../lib/isabelle/Firstorder_term_impl_Impl"
begin
consts sdata_inv :: "sdata \<Rightarrow> bool"
axiomatization where sdata_inv_def:   "sdata_inv x = True \<longleftrightarrow> (case x of PConflict l1 l2 \<Rightarrow> nlimpl_fo_term_list_ok l1 \<and> nlimpl_fo_term_list_ok l2 \<and> (\<forall>(x1 :: int). is_fo_term_free_var_in_fo_term_list x1 (model_fo_term_list_field l1) \<longrightarrow> (0 :: int) \<le> x1) \<and> (\<forall>(x1 :: int). is_fo_term_free_var_in_fo_term_list x1 (model_fo_term_list_field l2) \<longrightarrow> (0 :: int) \<le> x1) | Assign l \<Rightarrow> nlimpl_fo_term_ok l \<and> (\<forall>(x1 :: int). is_fo_term_free_var_in_fo_term x1 (model_fo_term_field l) \<longrightarrow> (0 :: int) \<le> x1))"
  for x :: "sdata"
consts smodel :: "sdata timestamp \<Rightarrow> int \<Rightarrow> (int, int) fo_term"
axiomatization where smodel_def:   "smodel l x = (case table l x of Nil \<Rightarrow> Var_fo_term x | Cons (PConflict _ _) _ \<Rightarrow> Var_fo_term x | Cons (Assign u) _ \<Rightarrow> model_fo_term_field u)"
  for l :: "sdata timestamp"
  and x :: "int"
definition unassigned :: "sdata timestamp \<Rightarrow> int \<Rightarrow> _"
  where "unassigned l x \<longleftrightarrow> (case table l x of Cons (Assign _) _ \<Rightarrow> False | _ \<Rightarrow> True)" for l x
theorem smodel_depend_only_model'vc:
  fixes l1 :: "sdata timestamp"
  fixes l2 :: "sdata timestamp"
  assumes fact0: "table l1 = table l2"
  shows "smodel l1 = smodel l2"
  sorry
end
