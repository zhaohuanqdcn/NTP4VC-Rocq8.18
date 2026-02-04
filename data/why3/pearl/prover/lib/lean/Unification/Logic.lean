import Why3.Base
import pearl.prover.lib.lean.Unification.Types
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
namespace Logic
axiom sdata_inv : Types.sdata -> Bool
axiom sdata_inv_def (x : Types.sdata) : (sdata_inv x = true) = (match x with | Types.sdata.PConflict l1 l2 => Logic.nlimpl_fo_term_list_ok l1 ∧ Logic.nlimpl_fo_term_list_ok l2 ∧ (∀(x1 : ℤ), Spec.is_fo_term_free_var_in_fo_term_list x1 (Types.nlimpl_fo_term_list.model_fo_term_list_field l1) → (0 : ℤ) ≤ x1) ∧ (∀(x1 : ℤ), Spec.is_fo_term_free_var_in_fo_term_list x1 (Types.nlimpl_fo_term_list.model_fo_term_list_field l2) → (0 : ℤ) ≤ x1) | Types.sdata.Assign l => Logic.nlimpl_fo_term_ok l ∧ (∀(x1 : ℤ), Spec.is_fo_term_free_var_in_fo_term x1 (Types.nlimpl_fo_term.model_fo_term_field l) → (0 : ℤ) ≤ x1))
axiom smodel : Types.timestamp Types.sdata -> ℤ -> Spec.fo_term ℤ ℤ
axiom smodel_def (l : Types.timestamp Types.sdata) (x : ℤ) : smodel l x = (match Types.timestamp.table l x with | ([] : List Types.sdata) => Spec.fo_term.Var_fo_term x | List.cons (Types.sdata.PConflict _ _) _ => Spec.fo_term.Var_fo_term x | List.cons (Types.sdata.Assign u) _ => Types.nlimpl_fo_term.model_fo_term_field u)
noncomputable def unassigned (l : Types.timestamp Types.sdata) (x : ℤ) := match Types.timestamp.table l x with | List.cons (Types.sdata.Assign _) _ => False | _ => True
noncomputable def unifier_subst_ok (rho : Types.t Types.sdata) (u : Types.unifier_subst) := smodel (Logic.current_timestamp rho) = Types.unifier_subst.unifier_base_model u ∧ (∀(x : ℤ), Types.unifier_subst.unifier_base_model u x = Spec.fo_term.Var_fo_term x → unassigned (Logic.current_timestamp rho) x) ∧ (∀(x : ℤ), Types.unifier_subst.unifier_base_model u x = Spec.fo_term.Var_fo_term x → Types.unifier_subst.unifier u x = Spec.fo_term.Var_fo_term x) ∧ Spec.subst_compose_fo_term (Types.unifier_subst.unifier_base_model u) Spec.subst_id_symbol (Types.unifier_subst.unifier u) = Types.unifier_subst.unifier u ∧ Spec.subst_compose_fo_term (Types.unifier_subst.unifier u) Spec.subst_id_symbol (Types.unifier_subst.unifier_base_model u) = Types.unifier_subst.unifier u ∧ Spec.subst_compose_fo_term (Types.unifier_subst.unifier u) Spec.subst_id_symbol (Types.unifier_subst.unifier u) = Types.unifier_subst.unifier u ∧ Logic.correct rho ∧ Types.t.inv rho = sdata_inv
end Logic
