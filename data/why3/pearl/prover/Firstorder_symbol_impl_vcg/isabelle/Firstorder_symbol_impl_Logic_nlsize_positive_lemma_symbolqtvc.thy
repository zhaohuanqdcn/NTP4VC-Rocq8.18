theory Firstorder_symbol_impl_Logic_nlsize_positive_lemma_symbolqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_spec_Spec"
begin
fun nat_nlsize_symbol :: "'b0 nl_symbol \<Rightarrow> Nat_Nat.nat"  and nlsize_symbol :: "'b0 nl_symbol \<Rightarrow> int"
  where "nat_nlsize_symbol (NLFVar_symbol v0) = SNat ONat" for v0
      | "nat_nlsize_symbol (NLBruijn_symbol v0) = SNat ONat" for v0
      | "nlsize_symbol (NLFVar_symbol v0) = (1 :: int)" for v0
      | "nlsize_symbol (NLBruijn_symbol v0) = (1 :: int)" for v0
theorem nlsize_positive_lemma_symbol'vc:
  fixes t :: "'b0 nl_symbol"
  shows "(0 :: int) < nlsize_symbol t"
  sorry
end
