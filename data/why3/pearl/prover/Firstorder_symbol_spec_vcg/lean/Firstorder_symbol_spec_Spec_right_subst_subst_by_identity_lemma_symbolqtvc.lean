import Why3.Base
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
open Classical
open Lean4Why3
namespace Firstorder_symbol_spec_Spec_right_subst_subst_by_identity_lemma_symbolqtvc
inductive symbol (ty'b0 : Type) where
  | Var_symbol : ty'b0 -> symbol ty'b0
axiom inhabited_axiom_symbol {ty'b0 : Type} [Inhabited ty'b0] : Inhabited (symbol ty'b0)
attribute [instance] inhabited_axiom_symbol
mutual
noncomputable def nat_size_symbol {ty'b0 : Type} [Inhabited ty'b0] : symbol ty'b0 -> Nat.nat
  | (symbol.Var_symbol v0) => Nat.nat.SNat Nat.nat.ONat
noncomputable def size_symbol {ty'b0 : Type} [Inhabited ty'b0] : symbol ty'b0 -> ℤ
  | (symbol.Var_symbol v0) => (1 : ℤ)
end
noncomputable def rename_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (t : symbol ty'b0) (s0 : ty'b0 -> ty'c0) := match t with | symbol.Var_symbol v0 => symbol.Var_symbol (s0 v0)
axiom rename_subst_symbol :  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ty'b0 -> symbol ty'c0) -> (ty'c0 -> ty'd0) -> ty'b0 -> symbol ty'd0
axiom rename_subst_symbol_definition {ty'd0 : Type} {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'd0] [Inhabited ty'c0] [Inhabited ty'b0] (s0 : ty'b0 -> symbol ty'c0) (s10 : ty'c0 -> ty'd0) (x : ty'b0) : rename_subst_symbol s0 s10 x = rename_symbol (s0 x) s10
noncomputable def olifts_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (s : ty'b0 -> symbol ty'c0) := Funcs.ocase (rename_subst_symbol s Funcs.some) (symbol.Var_symbol (Option.none : Option ty'c0))
noncomputable def subst_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (t : symbol ty'b0) (s0 : ty'b0 -> symbol ty'c0) := match t with | symbol.Var_symbol v0 => s0 v0
axiom subst_compose_symbol :  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ty'b0 -> symbol ty'c0) -> (ty'c0 -> symbol ty'd0) -> ty'b0 -> symbol ty'd0
axiom subst_compose_symbol_definition {ty'd0 : Type} {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'd0] [Inhabited ty'c0] [Inhabited ty'b0] (s0 : ty'b0 -> symbol ty'c0) (s10 : ty'c0 -> symbol ty'd0) (x : ty'b0) : subst_compose_symbol s0 s10 x = subst_symbol (s0 x) s10
axiom subst_id_symbol :  {ty'b0 : Type} -> [Inhabited ty'b0] -> ty'b0 -> symbol ty'b0
axiom subst_id_symbol_definition {ty'b0 : Type} [Inhabited ty'b0] (x : ty'b0) : subst_id_symbol x = symbol.Var_symbol x
theorem right_subst_subst_by_identity_lemma_symbol'vc {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (s0 : ty'b0 -> symbol ty'c0) : subst_compose_symbol s0 subst_id_symbol = s0
  := sorry
end Firstorder_symbol_spec_Spec_right_subst_subst_by_identity_lemma_symbolqtvc
