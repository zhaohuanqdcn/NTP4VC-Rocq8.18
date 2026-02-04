import Why3.Base
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
import pearl.prover.lib.lean.Firstorder_symbol_spec.Spec
open Classical
open Lean4Why3
namespace Types
inductive nl_symbol (ty'b0 : Type) where
  | NLFVar_symbol : ty'b0 -> nl_symbol ty'b0
  | NLBruijn_symbol : ℤ -> nl_symbol ty'b0
axiom inhabited_axiom_nl_symbol {ty'b0 : Type} [Inhabited ty'b0] : Inhabited (nl_symbol ty'b0)
attribute [instance] inhabited_axiom_nl_symbol
structure nlimpl_symbol where
  nlrepr_symbol_field : nl_symbol ℤ
  nlfree_var_symbol_set_abstraction_symbol_field : ℤ
  model_symbol_field : Spec.symbol ℤ
axiom inhabited_axiom_nlimpl_symbol : Inhabited nlimpl_symbol
attribute [instance] inhabited_axiom_nlimpl_symbol
inductive cons_symbol where
  | NLCVar_symbol : ℤ -> cons_symbol
axiom inhabited_axiom_cons_symbol : Inhabited cons_symbol
attribute [instance] inhabited_axiom_cons_symbol
end Types
