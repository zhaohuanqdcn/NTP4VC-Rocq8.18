import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_YetAnotherInPlaceRev_list_reversal_finalqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
structure mem where
  next : loc -> loc
axiom inhabited_axiom_mem : Inhabited mem
attribute [instance] inhabited_axiom_mem
noncomputable def valid_cells (s : ℤ -> loc) (n : ℤ) := (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → ¬s i = null) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ j ∧ j < n → ¬i = j → ¬s i = s j)
noncomputable def listLR (m : mem) (s : ℤ -> loc) (l : loc) (lo : ℤ) (hi : ℤ) := ((0 : ℤ) ≤ lo ∧ lo ≤ hi) ∧ (if lo = hi then l = null else l = s lo ∧ mem.next m (s (hi - (1 : ℤ))) = null ∧ (∀(k : ℤ), lo ≤ k ∧ k < hi - (1 : ℤ) → mem.next m (s k) = s (k + (1 : ℤ))))
noncomputable def listRL (m : mem) (s : ℤ -> loc) (l : loc) (lo : ℤ) (hi : ℤ) := ((0 : ℤ) ≤ lo ∧ lo ≤ hi) ∧ (if lo = hi then l = null else mem.next m (s lo) = null ∧ l = s (hi - (1 : ℤ)) ∧ (∀(k : ℤ), lo < k ∧ k < hi → mem.next m (s k) = s (k - (1 : ℤ))))
noncomputable def frame (m1 : mem) (m2 : mem) (s : ℤ -> loc) (n : ℤ) := ∀(p : loc), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → ¬p = s i) → mem.next m1 p = mem.next m2 p
axiom is_list : mem -> loc -> (ℤ -> loc) -> ℤ -> Prop
axiom result : (ℤ -> loc) -> ℤ -> loc
axiom result'def (s : ℤ -> loc) (i : ℤ) : result s i = s (i + (1 : ℤ))
axiom is_list'def (n : ℤ) (m : mem) (l : loc) (s : ℤ -> loc) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then is_list m l s n = (l = null) else is_list m l s n = ((let q1' : loc := s (0 : ℤ); l = q1' ∧ ¬q1' = null) ∧ is_list m (mem.next m l) (result s) (n - (1 : ℤ)))
axiom fc : (ℤ -> loc) -> ℤ -> ℤ -> loc
axiom fc'def (s : ℤ -> loc) (n : ℤ) (i : ℤ) : fc s n i = s (n - (1 : ℤ) - i)
theorem list_reversal_final'vc (mem1 : loc -> loc) : let mem2 : mem := mem.mk mem1; ∀(s : ℤ -> loc) (n : ℤ) (l : loc), (0 : ℤ) ≤ n ∧ is_list mem2 l s n → (valid_cells s n ∧ listLR mem2 s l (0 : ℤ) n) ∧ (∀(mem3 : loc -> loc), let mem4 : mem := mem.mk mem3; ∀(r : loc), listRL mem4 s r (0 : ℤ) n ∧ frame mem4 mem2 s n → is_list mem4 r (fc s n) n ∧ frame mem4 mem2 s n)
  := sorry
end linked_list_rev_YetAnotherInPlaceRev_list_reversal_finalqtvc
