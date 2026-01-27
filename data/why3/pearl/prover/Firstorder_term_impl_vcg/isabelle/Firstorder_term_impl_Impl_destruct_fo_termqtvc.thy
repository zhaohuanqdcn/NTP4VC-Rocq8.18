theory Firstorder_term_impl_Impl_destruct_fo_termqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/Firstorder_term_impl_Types" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_spec_Spec" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Firstorder_symbol_impl_Logic" "../../lib/isabelle/Firstorder_symbol_impl_Impl" "../../lib/isabelle/Firstorder_term_spec_Spec" "../../lib/isabelle/Firstorder_term_impl_Logic"
begin
theorem destruct_fo_term'vc:
  fixes t :: "nlimpl_fo_term"
  assumes fact0: "nlimpl_fo_term_ok t"
  shows "let fv0 :: int = nlfree_var_symbol_set_abstraction_fo_term_field t; o1 :: (int, int) nl_fo_term = nlrepr_fo_term_field t in (case o1 of NLFVar_fo_term v0 \<Rightarrow> True | NLBruijn_fo_term v0 \<Rightarrow> False | NL_App v0 v1 \<Rightarrow> (case model_fo_term_field t of Var_fo_term x0 \<Rightarrow> False | App x0 x1 \<Rightarrow> True)) \<and> (\<forall>(result :: cons_fo_term). (case o1 of NLFVar_fo_term v0 \<Rightarrow> result = NLCVar_fo_term v0 | NLBruijn_fo_term v0 \<Rightarrow> False | NL_App v0 v1 \<Rightarrow> (case model_fo_term_field t of Var_fo_term x0 \<Rightarrow> False | App x0 x1 \<Rightarrow> result = NLC_App (nlimpl_symbol'mk v0 fv0 (rename_symbol x0 identity)) (nlimpl_fo_term_list'mk v1 fv0 (nlfree_var_fo_term_set_abstraction_fo_term_field t) (rename_fo_term_list x1 identity identity)))) \<longrightarrow> cons_ok_fo_term result \<and> cons_rel_fo_term result t \<and> cons_open_rel_fo_term result t)"
  sorry
end
