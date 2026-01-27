import Why3.Base
import pearl.prover.lib.lean.Firstorder_term_impl.Types
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
namespace Firstorder_term_impl_Logic_shiftb_compose_lemma_fo_termqtvc
mutual
noncomputable def nat_nlsize_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> Nat.nat
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; s
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term v0) s1; s2
noncomputable def nat_nlsize_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> Nat.nat
  | (Types.nl_fo_term.NLFVar_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_fo_term.NL_App v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (Logic.nat_nlsize_symbol v0) s1; s2
noncomputable def nlsize_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => let s : ℤ := (1 : ℤ); s
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := nlsize_fo_term_list v1 + s; let s2 : ℤ := nlsize_fo_term v0 + s1; s2
noncomputable def nlsize_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term.NLFVar_fo_term v0) => (1 : ℤ)
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (1 : ℤ)
  | (Types.nl_fo_term.NL_App v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := nlsize_fo_term_list v1 + s; let s2 : ℤ := Logic.nlsize_symbol v0 + s1; s2
end
axiom shiftb_fo_term :  {ty'b0 : Type} -> [Inhabited ty'b0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] -> (ℤ -> Spec.fo_term ty'b0 ty'b3) -> ℤ -> Spec.fo_term ty'b0 (Option ty'b3)
axiom shiftb_fo_term_definition {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] (bnd : ℤ -> Spec.fo_term ty'b0 ty'b3) (i : ℤ) : shiftb_fo_term bnd i = (if i = (0 : ℤ) then Spec.fo_term.Var_fo_term (Option.none : Option ty'b3) else Spec.rename_fo_term (bnd (i - (1 : ℤ))) Func.identity Funcs.some)
theorem shiftb_compose_lemma_fo_term'vc {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] (bnd : ℤ -> Spec.fo_term ty'b0 ty'b3) (s0 : ty'b0 -> Spec.symbol ty'c0) (s3 : ty'b3 -> Spec.fo_term ty'c0 ty'c3) : Spec.subst_compose_fo_term (shiftb_fo_term bnd) (Spec.rename_subst_symbol s0 Func.identity) (Spec.olifts_fo_term s3) = shiftb_fo_term (Spec.subst_compose_fo_term bnd s0 s3)
  := sorry
end Firstorder_term_impl_Logic_shiftb_compose_lemma_fo_termqtvc
