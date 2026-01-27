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
namespace Firstorder_symbol_impl_Impl_unbind_var_symbol_in_symbolqtvc
theorem unbind_var_symbol_in_symbol'vc {ty'b0 : Type} [Inhabited ty'b0] (i : ℤ) (t : Types.nl_symbol ℤ) (x : Types.nl_symbol ℤ) (fr0 : ℤ -> Spec.symbol ty'b0) (bnd10 : ℤ -> Spec.symbol ty'b0) (bnd20 : ℤ -> Spec.symbol ty'b0) (fact0 : (0 : ℤ) ≤ i) (fact1 : Logic.correct_indexes_symbol t) (fact2 : Logic.bound_depth_of_symbol_in_symbol t ≤ i + (1 : ℤ)) (fact3 : Logic.correct_indexes_symbol x) (fact4 : Logic.bound_depth_of_symbol_in_symbol x = (0 : ℤ)) : (match t with | Types.nl_symbol.NLFVar_symbol v0 => True | Types.nl_symbol.NLBruijn_symbol v0 => True) ∧ (∀(result : Types.nl_symbol ℤ), (match t with | Types.nl_symbol.NLFVar_symbol v0 => result = Types.nl_symbol.NLFVar_symbol v0 | Types.nl_symbol.NLBruijn_symbol v0 => (if v0 = i then result = x else result = Types.nl_symbol.NLBruijn_symbol v0)) → Logic.correct_indexes_symbol result ∧ Logic.bound_depth_of_symbol_in_symbol result ≤ i ∧ Logic.nlmodel_symbol result fr0 bnd10 = Logic.nlmodel_symbol t fr0 (Func.update bnd10 i (Logic.nlmodel_symbol x fr0 bnd20)))
  := sorry
end Firstorder_symbol_impl_Impl_unbind_var_symbol_in_symbolqtvc
