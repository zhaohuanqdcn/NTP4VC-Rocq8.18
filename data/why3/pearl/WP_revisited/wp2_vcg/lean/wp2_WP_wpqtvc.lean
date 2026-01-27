import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
import pearl.WP_revisited.lib.lean.wp2.HoareLogic
open Classical
open Lean4Why3
namespace wp2_WP_wpqtvc
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset ℤ
axiom mk : Finset ℤ -> set
axiom mk'spec (s : Finset ℤ) : to_fset (mk s) = s
axiom choose1 : set -> ℤ
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
noncomputable def assigns (sigma : ℤ -> Imp.value) (a : Finset ℤ) (sigma' : ℤ -> Imp.value) := ∀(i : ℤ), ¬i ∈ a → sigma i = sigma' i
noncomputable def stmt_writes : Imp.stmt -> Finset ℤ -> Prop
  | Imp.stmt.Sskip, w => True
  | (Imp.stmt.Sassert x), w => True
  | (Imp.stmt.Sassign id1 x), w => id1 ∈ w
  | (Imp.stmt.Sseq s1 s2), w => stmt_writes s1 w ∧ stmt_writes s2 w
  | (Imp.stmt.Sif x s1 s2), w => stmt_writes s1 w ∧ stmt_writes s2 w
  | (Imp.stmt.Swhile x x0 s), w => stmt_writes s w
theorem wp'vc (i : Imp.stmt) (q : Imp.fmla) : (match i with | Imp.stmt.Sskip => True | Imp.stmt.Sseq i1 i2 => (match i with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = i2 ∨ f1 = i2 | Imp.stmt.Sif _ f f1 => f = i2 ∨ f1 = i2 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = i2) ∧ (∀(o1 : Imp.fmla), Imp.valid_triple o1 i2 q → (match i with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = i1 ∨ f1 = i1 | Imp.stmt.Sif _ f f1 => f = i1 ∨ f1 = i1 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = i1)) | Imp.stmt.Sassign x e => True | Imp.stmt.Sif e i1 i2 => (match i with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = i2 ∨ f1 = i2 | Imp.stmt.Sif _ f f1 => f = i2 ∨ f1 = i2 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = i2) ∧ (∀(o1 : Imp.fmla), Imp.valid_triple o1 i2 q → (match i with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = i1 ∨ f1 = i1 | Imp.stmt.Sif _ f f1 => f = i1 ∨ f1 = i1 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = i1)) | Imp.stmt.Sassert f => True | Imp.stmt.Swhile e inv i1 => (match i with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = i1 ∨ f1 = i1 | Imp.stmt.Sif _ f f1 => f = i1 ∨ f1 = i1 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = i1)) ∧ (∀(result : Imp.fmla), (match i with | Imp.stmt.Sskip => result = q | Imp.stmt.Sseq i1 i2 => (∃(o1 : Imp.fmla), Imp.valid_triple o1 i2 q ∧ Imp.valid_triple result i1 o1) | Imp.stmt.Sassign x e => (∃(id1 : ℤ), Imp.fresh_in_fmla id1 q ∧ result = Imp.fmla.Flet id1 e (Imp.subst q x id1)) | Imp.stmt.Sif e i1 i2 => (∃(o1 : Imp.fmla), Imp.valid_triple o1 i2 q ∧ (∃(o2 : Imp.fmla), Imp.valid_triple o2 i1 q ∧ result = Imp.fmla.Fand (Imp.fmla.Fimplies (Imp.fmla.Fterm e) o2) (Imp.fmla.Fimplies (Imp.fmla.Fnot (Imp.fmla.Fterm e)) o1))) | Imp.stmt.Sassert f => result = Imp.fmla.Fimplies f q | Imp.stmt.Swhile e inv i1 => (∃(o1 : Imp.fmla), Imp.valid_triple o1 i1 inv ∧ (∃(o2 : Imp.fmla), (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value), Imp.eval_fmla sigma pi o2 → Imp.eval_fmla sigma pi (Imp.fmla.Fand (Imp.fmla.Fimplies (Imp.fmla.Fand (Imp.fmla.Fterm e) inv) o1) (Imp.fmla.Fimplies (Imp.fmla.Fand (Imp.fmla.Fnot (Imp.fmla.Fterm e)) inv) q)) ∧ (∀(sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi i1 sigma' pi' Imp.stmt.Sskip n → Imp.eval_fmla sigma' pi' o2)) ∧ result = Imp.fmla.Fand inv o2))) → Imp.valid_triple result i q)
  := sorry
end wp2_WP_wpqtvc
