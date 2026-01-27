import Why3.Base
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
open Classical
open Lean4Why3
namespace Firstorder_symbol_spec_Spec_renaming_identity_lemma_symbolqtvc
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
theorem renaming_identity_lemma_symbol'vc {ty'b0 : Type} [Inhabited ty'b0] (t : ty'b0) : let t1 : symbol ty'b0 := symbol.Var_symbol t; rename_symbol t1 Func.identity = t1
  := sorry
end Firstorder_symbol_spec_Spec_renaming_identity_lemma_symbolqtvc
