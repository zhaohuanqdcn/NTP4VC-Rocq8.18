theory Firstorder_symbol_impl_Logic_shiftb_compose_lemma_symbolqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/Firstorder_symbol_impl_Types" "../../lib/isabelle/Nat_Nat" "../../lib/isabelle/Functions_Config" "../../lib/isabelle/Functions_Func" "../../lib/isabelle/OptionFuncs_Funcs" "../../lib/isabelle/Sum_Sum" "../../lib/isabelle/Firstorder_symbol_spec_Spec"
begin
fun nat_nlsize_symbol :: "'b0 nl_symbol \<Rightarrow> Nat_Nat.nat"  and nlsize_symbol :: "'b0 nl_symbol \<Rightarrow> int"
  where "nat_nlsize_symbol (NLFVar_symbol v0) = SNat ONat" for v0
      | "nat_nlsize_symbol (NLBruijn_symbol v0) = SNat ONat" for v0
      | "nlsize_symbol (NLFVar_symbol v0) = (1 :: int)" for v0
      | "nlsize_symbol (NLBruijn_symbol v0) = (1 :: int)" for v0
consts shiftb_symbol :: "(int \<Rightarrow> 'b0 symbol) \<Rightarrow> int \<Rightarrow> 'b0 option symbol"
axiomatization where shiftb_symbol_definition:   "shiftb_symbol bnd i = (if i = (0 :: int) then Var_symbol (None :: 'b0 option) else rename_symbol (bnd (i - (1 :: int))) some)"
  for bnd :: "int \<Rightarrow> 'b0 symbol"
  and i :: "int"
theorem shiftb_compose_lemma_symbol'vc:
  fixes bnd :: "int \<Rightarrow> 'b0 symbol"
  fixes s0 :: "'b0 \<Rightarrow> 'c0 symbol"
  shows "subst_compose_symbol (shiftb_symbol bnd) ((olifts_symbol :: ('b0 \<Rightarrow> 'c0 symbol) \<Rightarrow> 'b0 option \<Rightarrow> 'c0 option symbol) s0) = shiftb_symbol (subst_compose_symbol bnd s0)"
  sorry
end
