import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_WP_compute_writesqtvc
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
theorem compute_writes'vc (s : Imp.stmt) : (match s with | Imp.stmt.Sskip => True | Imp.stmt.Sassign i _ => True | Imp.stmt.Sseq s1 s2 => (match s with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = s2 ∨ f1 = s2 | Imp.stmt.Sif _ f f1 => f = s2 ∨ f1 = s2 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = s2) ∧ (∀(o1 : set), (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s2 sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset o1) sigma') → (match s with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = s1 ∨ f1 = s1 | Imp.stmt.Sif _ f f1 => f = s1 ∨ f1 = s1 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = s1)) | Imp.stmt.Sif _ s1 s2 => (match s with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = s2 ∨ f1 = s2 | Imp.stmt.Sif _ f f1 => f = s2 ∨ f1 = s2 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = s2) ∧ (∀(o1 : set), (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s2 sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset o1) sigma') → (match s with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = s1 ∨ f1 = s1 | Imp.stmt.Sif _ f f1 => f = s1 ∨ f1 = s1 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = s1)) | Imp.stmt.Swhile _ _ s1 => (match s with | Imp.stmt.Sskip => False | Imp.stmt.Sassign _ _ => False | Imp.stmt.Sseq f f1 => f = s1 ∨ f1 = s1 | Imp.stmt.Sif _ f f1 => f = s1 ∨ f1 = s1 | Imp.stmt.Sassert _ => False | Imp.stmt.Swhile _ _ f => f = s1) | Imp.stmt.Sassert _ => True) ∧ (∀(result : set), (match s with | Imp.stmt.Sskip => to_fset result = (∅ : Finset ℤ) ∧ Int.ofNat (Finset.card (to_fset result)) = (0 : ℤ) | Imp.stmt.Sassign i _ => to_fset result = insert i (∅ : Finset ℤ) ∧ Int.ofNat (Finset.card (to_fset result)) = (1 : ℤ) | Imp.stmt.Sseq s1 s2 => (∃(o1 : set), (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s2 sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset o1) sigma') ∧ (∃(o2 : set), (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s1 sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset o2) sigma') ∧ to_fset result = to_fset o2 ∪ to_fset o1)) | Imp.stmt.Sif _ s1 s2 => (∃(o1 : set), (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s2 sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset o1) sigma') ∧ (∃(o2 : set), (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s1 sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset o2) sigma') ∧ to_fset result = to_fset o2 ∪ to_fset o1)) | Imp.stmt.Swhile _ _ s1 => (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s1 sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset result) sigma') | Imp.stmt.Sassert _ => to_fset result = (∅ : Finset ℤ) ∧ Int.ofNat (Finset.card (to_fset result)) = (0 : ℤ)) → (∀(sigma : ℤ -> Imp.value) (pi : ℤ -> Imp.value) (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (n : ℤ), Imp.many_steps sigma pi s sigma' pi' Imp.stmt.Sskip n → assigns sigma (to_fset result) sigma'))
  := sorry
end wp2_WP_compute_writesqtvc
