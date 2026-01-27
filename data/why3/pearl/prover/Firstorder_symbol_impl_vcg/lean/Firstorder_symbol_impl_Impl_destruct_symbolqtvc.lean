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
namespace Firstorder_symbol_impl_Impl_destruct_symbolqtvc
theorem destruct_symbol'vc (t : Types.nlimpl_symbol) (fact0 : Logic.nlimpl_symbol_ok t) : let o1 : Types.nl_symbol ℤ := Types.nlimpl_symbol.nlrepr_symbol_field t; (match o1 with | Types.nl_symbol.NLFVar_symbol v0 => True | Types.nl_symbol.NLBruijn_symbol v0 => False) ∧ (∀(result : ℤ), let result1 : Types.cons_symbol := Types.cons_symbol.NLCVar_symbol result; (match o1 with | Types.nl_symbol.NLFVar_symbol v0 => result = v0 | Types.nl_symbol.NLBruijn_symbol v0 => False) → Logic.cons_ok_symbol result1 ∧ Logic.cons_rel_symbol result1 t ∧ Logic.cons_open_rel_symbol result1 t)
  := sorry
end Firstorder_symbol_impl_Impl_destruct_symbolqtvc
