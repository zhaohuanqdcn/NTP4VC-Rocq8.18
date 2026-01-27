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
namespace Firstorder_symbol_impl_Impl_bind_var_symbol_in_symbolqtvc
theorem bind_var_symbol_in_symbol'vc {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ℤ) (i : ℤ) (x : ℤ) (fr0 : ℤ -> Spec.symbol ty'b0) (bnd0 : ℤ -> Spec.symbol ty'b0) (fact0 : Logic.correct_indexes_symbol t) (fact1 : Logic.bound_depth_of_symbol_in_symbol t ≤ i) : (match t with | Types.nl_symbol.NLFVar_symbol v0 => True | Types.nl_symbol.NLBruijn_symbol v0 => True) ∧ (∀(result : Types.nl_symbol ℤ), (match t with | Types.nl_symbol.NLFVar_symbol v0 => (if v0 = x then result = Types.nl_symbol.NLBruijn_symbol i else result = Types.nl_symbol.NLFVar_symbol v0) | Types.nl_symbol.NLBruijn_symbol v0 => result = Types.nl_symbol.NLBruijn_symbol v0) → Logic.bound_depth_of_symbol_in_symbol result ≤ i + (1 : ℤ) ∧ Logic.correct_indexes_symbol result ∧ Logic.nlmodel_symbol result fr0 bnd0 = Logic.nlmodel_symbol t (Func.update fr0 x (bnd0 i)) bnd0)
  := sorry
end Firstorder_symbol_impl_Impl_bind_var_symbol_in_symbolqtvc
