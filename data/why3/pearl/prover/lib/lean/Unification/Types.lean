import Why3.Base
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.BacktrackArray.Logic
import pearl.prover.lib.lean.Choice.Choice
import pearl.prover.lib.lean.BacktrackArray.Impl
import pearl.prover.lib.lean.Firstorder_symbol_spec.Spec
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
import pearl.prover.lib.lean.Firstorder_symbol_impl.Types
import pearl.prover.lib.lean.Firstorder_symbol_impl.Logic
import pearl.prover.lib.lean.Firstorder_symbol_impl.Impl
import pearl.prover.lib.lean.Firstorder_term_spec.Spec
import pearl.prover.lib.lean.Firstorder_term_impl.Types
import pearl.prover.lib.lean.Firstorder_term_impl.Logic
import pearl.prover.lib.lean.Firstorder_term_impl.Impl
open Classical
open Lean4Why3
namespace Types
inductive sdata where
  | PConflict : Types.nlimpl_fo_term_list -> Types.nlimpl_fo_term_list -> sdata
  | Assign : Types.nlimpl_fo_term -> sdata
axiom inhabited_axiom_sdata : Inhabited sdata
attribute [instance] inhabited_axiom_sdata
axiom subst : Type
axiom inhabited_axiom_subst : Inhabited subst
attribute [instance] inhabited_axiom_subst
axiom timesubst : Type
axiom inhabited_axiom_timesubst : Inhabited timesubst
attribute [instance] inhabited_axiom_timesubst
structure unifier_subst where
  unifier_base_model : ℤ -> Spec.fo_term ℤ ℤ
  unifier : ℤ -> Spec.fo_term ℤ ℤ
axiom inhabited_axiom_unifier_subst : Inhabited unifier_subst
attribute [instance] inhabited_axiom_unifier_subst
structure unification_return where
  final_unifier : unifier_subst
  unifier_factor : ℤ -> Spec.fo_term ℤ ℤ
axiom inhabited_axiom_unification_return : Inhabited unification_return
attribute [instance] inhabited_axiom_unification_return
end Types
