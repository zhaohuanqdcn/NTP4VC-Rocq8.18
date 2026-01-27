theory Firstorder_symbol_impl_Impl_bind_var_symbol_in_symbolqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_spec_Spec" "../../lib/isabelle/Firstorder_symbol_impl_Logic"
begin
theorem bind_var_symbol_in_symbol'vc:
  fixes t :: "int nl_symbol"
  fixes i :: "int"
  fixes x :: "int"
  fixes fr0 :: "int \<Rightarrow> 'b0 symbol"
  fixes bnd0 :: "int \<Rightarrow> 'b0 symbol"
  assumes fact0: "correct_indexes_symbol t"
  assumes fact1: "bound_depth_of_symbol_in_symbol t \<le> i"
  shows "case t of NLFVar_symbol v0 \<Rightarrow> True | NLBruijn_symbol v0 \<Rightarrow> True"
  and "\<forall>(result :: int nl_symbol). (case t of NLFVar_symbol v0 \<Rightarrow> (if v0 = x then result = NLBruijn_symbol i else result = NLFVar_symbol v0) | NLBruijn_symbol v0 \<Rightarrow> result = NLBruijn_symbol v0) \<longrightarrow> bound_depth_of_symbol_in_symbol result \<le> i + (1 :: int) \<and> correct_indexes_symbol result \<and> nlmodel_symbol result fr0 bnd0 = nlmodel_symbol t (update fr0 x (bnd0 i)) bnd0"
  sorry
end
