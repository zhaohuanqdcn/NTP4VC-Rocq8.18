import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_YetAnotherInPlaceRev_is_listqtvc
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
theorem is_list'vc (n : ℤ) (s : ℤ -> loc) (l : loc) (fact0 : (0 : ℤ) ≤ n) (fact1 : ¬n = (0 : ℤ)) (fact2 : let q1' : loc := s (0 : ℤ); if l = q1' then true = (if q1' = null then false else true) else true = false) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1
  := sorry
end linked_list_rev_YetAnotherInPlaceRev_is_listqtvc
