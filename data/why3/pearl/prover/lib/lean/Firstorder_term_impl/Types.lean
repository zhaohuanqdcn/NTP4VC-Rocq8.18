import Why3.Base
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
import pearl.prover.lib.lean.Firstorder_symbol_spec.Spec
import pearl.prover.lib.lean.Firstorder_symbol_impl.Types
import pearl.prover.lib.lean.Firstorder_symbol_impl.Logic
import pearl.prover.lib.lean.Firstorder_symbol_impl.Impl
import pearl.prover.lib.lean.Firstorder_term_spec.Spec
open Classical
open Lean4Why3
namespace Types
mutual
inductive nl_fo_term_list (ty'b0 : Type) (ty'b3 : Type) where
  | NL_FONil : nl_fo_term_list ty'b0 ty'b3
  | NL_FOCons : nl_fo_term ty'b0 ty'b3 -> nl_fo_term_list ty'b0 ty'b3 -> nl_fo_term_list ty'b0 ty'b3
inductive nl_fo_term (ty'b0 : Type) (ty'b3 : Type) where
  | NLFVar_fo_term : ty'b3 -> nl_fo_term ty'b0 ty'b3
  | NLBruijn_fo_term : ℤ -> nl_fo_term ty'b0 ty'b3
  | NL_App : Types.nl_symbol ty'b0 -> nl_fo_term_list ty'b0 ty'b3 -> nl_fo_term ty'b0 ty'b3
end
axiom inhabited_axiom_nl_fo_term_list {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (nl_fo_term_list ty'b0 ty'b3)
attribute [instance] inhabited_axiom_nl_fo_term_list
axiom inhabited_axiom_nl_fo_term {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (nl_fo_term ty'b0 ty'b3)
attribute [instance] inhabited_axiom_nl_fo_term
structure nlimpl_fo_term_list where
  nlrepr_fo_term_list_field : nl_fo_term_list ℤ ℤ
  nlfree_var_symbol_set_abstraction_fo_term_list_field : ℤ
  nlfree_var_fo_term_set_abstraction_fo_term_list_field : ℤ
  model_fo_term_list_field : Spec.fo_term_list ℤ ℤ
axiom inhabited_axiom_nlimpl_fo_term_list : Inhabited nlimpl_fo_term_list
attribute [instance] inhabited_axiom_nlimpl_fo_term_list
structure nlimpl_fo_term where
  nlrepr_fo_term_field : nl_fo_term ℤ ℤ
  nlfree_var_symbol_set_abstraction_fo_term_field : ℤ
  nlfree_var_fo_term_set_abstraction_fo_term_field : ℤ
  model_fo_term_field : Spec.fo_term ℤ ℤ
axiom inhabited_axiom_nlimpl_fo_term : Inhabited nlimpl_fo_term
attribute [instance] inhabited_axiom_nlimpl_fo_term
inductive cons_fo_term_list where
  | NLC_FONil : cons_fo_term_list
  | NLC_FOCons : nlimpl_fo_term -> nlimpl_fo_term_list -> cons_fo_term_list
axiom inhabited_axiom_cons_fo_term_list : Inhabited cons_fo_term_list
attribute [instance] inhabited_axiom_cons_fo_term_list
inductive cons_fo_term where
  | NLCVar_fo_term : ℤ -> cons_fo_term
  | NLC_App : Types.nlimpl_symbol -> nlimpl_fo_term_list -> cons_fo_term
axiom inhabited_axiom_cons_fo_term : Inhabited cons_fo_term
attribute [instance] inhabited_axiom_cons_fo_term
end Types
