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
namespace Firstorder_symbol_impl_Impl_subst_base_symbol_in_symbolqtvc
theorem subst_base_symbol_in_symbol'vc {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ℤ) (u : Types.nl_symbol ℤ) (x : ℤ) (fr0 : ℤ -> Spec.symbol ty'b0) (bnd10 : ℤ -> Spec.symbol ty'b0) (bnd20 : ℤ -> Spec.symbol ty'b0) (fact0 : Logic.correct_indexes_symbol t) (fact1 : Logic.correct_indexes_symbol u) (fact2 : Logic.bound_depth_of_symbol_in_symbol u = (0 : ℤ)) : (match t with | Types.nl_symbol.NLFVar_symbol v0 => True | Types.nl_symbol.NLBruijn_symbol v0 => True) ∧ (∀(result : Types.nl_symbol ℤ), (match t with | Types.nl_symbol.NLFVar_symbol v0 => (if v0 = x then result = u else result = Types.nl_symbol.NLFVar_symbol v0) | Types.nl_symbol.NLBruijn_symbol v0 => result = Types.nl_symbol.NLBruijn_symbol v0) → Logic.correct_indexes_symbol result ∧ Logic.bound_depth_of_symbol_in_symbol result = Logic.bound_depth_of_symbol_in_symbol t ∧ Logic.nlmodel_symbol result fr0 bnd10 = Logic.nlmodel_symbol t (Func.update fr0 x (Logic.nlmodel_symbol u fr0 bnd20)) bnd10)
  := sorry
end Firstorder_symbol_impl_Impl_subst_base_symbol_in_symbolqtvc
