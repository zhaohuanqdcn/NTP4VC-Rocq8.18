import Why3.Base
import pearl.prover.lib.lean.Nat.Nat
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.OptionFuncs.Funcs
import pearl.prover.lib.lean.Sum.Sum
import pearl.prover.lib.lean.Firstorder_symbol_spec.Spec
open Classical
open Lean4Why3
namespace Firstorder_term_spec_Spec_renaming_composition_lemma_fo_term_listqtvc
mutual
inductive fo_term_list (ty'b0 : Type) (ty'b3 : Type) where
  | FONil : fo_term_list ty'b0 ty'b3
  | FOCons : fo_term ty'b0 ty'b3 -> fo_term_list ty'b0 ty'b3 -> fo_term_list ty'b0 ty'b3
inductive fo_term (ty'b0 : Type) (ty'b3 : Type) where
  | Var_fo_term : ty'b3 -> fo_term ty'b0 ty'b3
  | App : Spec.symbol ty'b0 -> fo_term_list ty'b0 ty'b3 -> fo_term ty'b0 ty'b3
end
axiom inhabited_axiom_fo_term_list {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (fo_term_list ty'b0 ty'b3)
attribute [instance] inhabited_axiom_fo_term_list
axiom inhabited_axiom_fo_term {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (fo_term ty'b0 ty'b3)
attribute [instance] inhabited_axiom_fo_term
mutual
noncomputable def nat_size_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> Nat.nat
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; s
  | (fo_term_list.FOCons v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_size_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (nat_size_fo_term v0) s1; s2
noncomputable def nat_size_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> Nat.nat
  | (fo_term.Var_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (fo_term.App v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_size_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (Spec.nat_size_symbol v0) s1; s2
noncomputable def size_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> ℤ
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => let s : ℤ := (1 : ℤ); s
  | (fo_term_list.FOCons v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := size_fo_term_list v1 + s; let s2 : ℤ := size_fo_term v0 + s1; s2
noncomputable def size_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> ℤ
  | (fo_term.Var_fo_term v0) => (1 : ℤ)
  | (fo_term.App v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := size_fo_term_list v1 + s; let s2 : ℤ := Spec.size_symbol v0 + s1; s2
end
mutual
noncomputable def rename_fo_term_list {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> (ty'b0 -> ty'c0) -> (ty'b3 -> ty'c3) -> fo_term_list ty'c0 ty'c3
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3), s0, s3 => (fo_term_list.FONil : fo_term_list ty'c0 ty'c3)
  | (fo_term_list.FOCons v0 v1), s0, s3 => fo_term_list.FOCons (rename_fo_term v0 s0 s3) (rename_fo_term_list v1 s0 s3)
noncomputable def rename_fo_term {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> (ty'b0 -> ty'c0) -> (ty'b3 -> ty'c3) -> fo_term ty'c0 ty'c3
  | (fo_term.Var_fo_term v0), s0, s3 => fo_term.Var_fo_term (s3 v0)
  | (fo_term.App v0 v1), s0, s3 => fo_term.App (Spec.rename_symbol v0 s0) (rename_fo_term_list v1 s0 s3)
end
theorem renaming_composition_lemma_fo_term_list'vc {ty'c0 : Type} {ty'b3 : Type} {ty'd0 : Type} {ty'd3 : Type} {ty'c3 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b3] [Inhabited ty'd0] [Inhabited ty'd3] [Inhabited ty'c3] [Inhabited ty'b0] (t : fo_term_list ty'b0 ty'b3) (s10 : ty'b0 -> ty'c0) (s13 : ty'b3 -> ty'c3) (s20 : ty'c0 -> ty'd0) (s23 : ty'c3 -> ty'd3) : rename_fo_term_list (rename_fo_term_list t s10 s13) s20 s23 = rename_fo_term_list t (Func.compose s20 s10) (Func.compose s23 s13)
  := sorry
end Firstorder_term_spec_Spec_renaming_composition_lemma_fo_term_listqtvc
