import Why3.Base
import pearl.prover.lib.lean.Firstorder_symbol_impl.Types
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
import pearl.prover.lib.lean.Firstorder_symbol_spec.Spec
open Classical
open Lean4Why3
namespace Logic
mutual
noncomputable def nat_nlsize_symbol {ty'b0 : Type} [Inhabited ty'b0] : Types.nl_symbol ty'b0 -> Nat.nat
  | (Types.nl_symbol.NLFVar_symbol v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_symbol.NLBruijn_symbol v0) => Nat.nat.SNat Nat.nat.ONat
noncomputable def nlsize_symbol {ty'b0 : Type} [Inhabited ty'b0] : Types.nl_symbol ty'b0 -> ℤ
  | (Types.nl_symbol.NLFVar_symbol v0) => (1 : ℤ)
  | (Types.nl_symbol.NLBruijn_symbol v0) => (1 : ℤ)
end
axiom shiftb_symbol :  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ℤ -> Spec.symbol ty'b0) -> ℤ -> Spec.symbol (Option ty'b0)
axiom shiftb_symbol_definition {ty'b0 : Type} [Inhabited ty'b0] (bnd : ℤ -> Spec.symbol ty'b0) (i : ℤ) : shiftb_symbol bnd i = (if i = (0 : ℤ) then Spec.symbol.Var_symbol (Option.none : Option ty'b0) else Spec.rename_symbol (bnd (i - (1 : ℤ))) Funcs.some)
noncomputable def nlmodel_symbol {ty'b0 : Type} {ty'c0 : Type} [Inhabited ty'b0] [Inhabited ty'c0] (t : Types.nl_symbol ty'b0) (fr0 : ty'b0 -> Spec.symbol ty'c0) (bnd0 : ℤ -> Spec.symbol ty'c0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => fr0 v0 | Types.nl_symbol.NLBruijn_symbol v0 => bnd0 v0
noncomputable def correct_indexes_symbol {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ty'b0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => True | Types.nl_symbol.NLBruijn_symbol v0 => (0 : ℤ) ≤ v0
noncomputable def bound_depth_of_symbol_in_symbol {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ty'b0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => (0 : ℤ) | Types.nl_symbol.NLBruijn_symbol v0 => (1 : ℤ) + v0
noncomputable def nlimpl_symbol_ok (t : Types.nlimpl_symbol) := nlmodel_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) Spec.subst_id_symbol (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))) = Types.nlimpl_symbol.model_symbol_field t ∧ correct_indexes_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) ∧ bound_depth_of_symbol_in_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) = (0 : ℤ) ∧ (∀(x : ℤ), Spec.is_symbol_free_var_in_symbol x (Types.nlimpl_symbol.model_symbol_field t) → x < Types.nlimpl_symbol.nlfree_var_symbol_set_abstraction_symbol_field t)
noncomputable def cons_ok_symbol (c : Types.cons_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => True
noncomputable def cons_rel_symbol (c : Types.cons_symbol) (t : Types.nlimpl_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => Types.nlimpl_symbol.model_symbol_field t = Spec.symbol.Var_symbol v0
noncomputable def cons_open_rel_symbol (c : Types.cons_symbol) (t : Types.nlimpl_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => Types.nlimpl_symbol.model_symbol_field t = Spec.symbol.Var_symbol v0
end Logic
