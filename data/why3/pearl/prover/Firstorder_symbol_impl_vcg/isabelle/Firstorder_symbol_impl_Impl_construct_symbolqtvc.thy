theory Firstorder_symbol_impl_Impl_construct_symbolqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_spec_Spec" "../../lib/isabelle/Firstorder_symbol_impl_Logic"
begin
theorem construct_symbol'vc:
  fixes v0 :: "int"
  shows "let c :: cons_symbol = NLCVar_symbol v0 in cons_ok_symbol c \<longrightarrow> nlimpl_symbol_ok (nlimpl_symbol'mk (NLFVar_symbol v0) ((1 :: int) + v0) (Var_symbol v0)) \<and> cons_rel_symbol c (nlimpl_symbol'mk (NLFVar_symbol v0) ((1 :: int) + v0) (Var_symbol v0))"
  sorry
end
