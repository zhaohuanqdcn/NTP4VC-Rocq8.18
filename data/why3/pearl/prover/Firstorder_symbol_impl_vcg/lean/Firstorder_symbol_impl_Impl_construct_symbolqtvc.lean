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
namespace Firstorder_symbol_impl_Impl_construct_symbolqtvc
theorem construct_symbol'vc (v0 : ℤ) : let c : Types.cons_symbol := Types.cons_symbol.NLCVar_symbol v0; Logic.cons_ok_symbol c → Logic.nlimpl_symbol_ok (Types.nlimpl_symbol.mk (Types.nl_symbol.NLFVar_symbol v0) ((1 : ℤ) + v0) (Spec.symbol.Var_symbol v0)) ∧ Logic.cons_rel_symbol c (Types.nlimpl_symbol.mk (Types.nl_symbol.NLFVar_symbol v0) ((1 : ℤ) + v0) (Spec.symbol.Var_symbol v0))
  := sorry
end Firstorder_symbol_impl_Impl_construct_symbolqtvc
