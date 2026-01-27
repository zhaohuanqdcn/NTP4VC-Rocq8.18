import Why3.Base
import pearl.prover.lib.lean.Firstorder_symbol_impl.Types
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
import pearl.prover.lib.lean.Firstorder_symbol_spec.Spec
import pearl.prover.lib.lean.Firstorder_symbol_impl.Logic
open Classical
open Lean4Why3
namespace Firstorder_symbol_impl_Impl_nlsubst_symbol_in_symbolqtvc
theorem nlsubst_symbol_in_symbol'vc (t : Types.nlimpl_symbol) (u : Types.nlimpl_symbol) (x : ℤ) (fact0 : Logic.nlimpl_symbol_ok t) (fact1 : Logic.nlimpl_symbol_ok u) : let o1 : Spec.symbol ℤ := Spec.subst_symbol (Types.nlimpl_symbol.model_symbol_field t) (Func.update Spec.subst_id_symbol x (Types.nlimpl_symbol.model_symbol_field u)); (∀(a : ℤ) (b : ℤ) (result : ℤ), (if a < b then result = b else result = a) → a ≤ result ∧ b ≤ result) ∧ (∀(o2 : ℤ), Types.nlimpl_symbol.nlfree_var_symbol_set_abstraction_symbol_field t ≤ o2 ∧ Types.nlimpl_symbol.nlfree_var_symbol_set_abstraction_symbol_field u ≤ o2 → (let o3 : ℤ -> Spec.symbol ℤ := Func.const (Spec.symbol.Var_symbol (-(1 : ℤ))); let o4 : ℤ -> Spec.symbol ℤ := Spec.subst_id_symbol; let o5 : Types.nl_symbol ℤ := Types.nlimpl_symbol.nlrepr_symbol_field u; let o6 : Types.nl_symbol ℤ := Types.nlimpl_symbol.nlrepr_symbol_field t; (Logic.correct_indexes_symbol o6 ∧ Logic.correct_indexes_symbol o5 ∧ Logic.bound_depth_of_symbol_in_symbol o5 = (0 : ℤ)) ∧ (∀(o7 : Types.nl_symbol ℤ), Logic.correct_indexes_symbol o7 ∧ Logic.bound_depth_of_symbol_in_symbol o7 = Logic.bound_depth_of_symbol_in_symbol o6 ∧ Logic.nlmodel_symbol o7 o4 o3 = Logic.nlmodel_symbol o6 (Func.update o4 x (Logic.nlmodel_symbol o5 o4 (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))))) o3 → Logic.nlimpl_symbol_ok (Types.nlimpl_symbol.mk o7 o2 o1) ∧ o1 = Spec.subst_symbol (Types.nlimpl_symbol.model_symbol_field t) (Func.update Spec.subst_id_symbol x (Types.nlimpl_symbol.model_symbol_field u)))))
  := sorry
end Firstorder_symbol_impl_Impl_nlsubst_symbol_in_symbolqtvc
