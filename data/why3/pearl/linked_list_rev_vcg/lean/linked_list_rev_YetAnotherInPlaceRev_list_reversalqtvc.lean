import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_YetAnotherInPlaceRev_list_reversalqtvc
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
theorem list_reversal'vc (mem1 : loc -> loc) : let mem2 : mem := mem.mk mem1; ∀(s : ℤ -> loc) (n : ℤ) (l : loc), valid_cells s n ∧ listLR mem2 s l (0 : ℤ) n → ((if n = (0 : ℤ) then l = null else l = s (0 : ℤ) ∨ (0 : ℤ) = n ∧ null = s (n - (1 : ℤ)) ∧ l = null ∨ ((0 : ℤ) < (0 : ℤ) ∧ (0 : ℤ) < n) ∧ null = s ((0 : ℤ) - (1 : ℤ)) ∧ l = s (0 : ℤ)) ∧ listRL mem2 s null (0 : ℤ) (0 : ℤ) ∧ listLR mem2 s l (0 : ℤ) n ∧ frame mem2 mem2 s n) ∧ (∀(i : ℤ) (p : loc) (l1 : loc) (mem3 : loc -> loc), let mem4 : mem := mem.mk mem3; (if n = (0 : ℤ) then l1 = p ∧ p = null else i = (0 : ℤ) ∧ p = null ∧ l1 = s (0 : ℤ) ∨ i = n ∧ p = s (n - (1 : ℤ)) ∧ l1 = null ∨ ((0 : ℤ) < i ∧ i < n) ∧ p = s (i - (1 : ℤ)) ∧ l1 = s i) ∧ listRL mem4 s p (0 : ℤ) i ∧ listLR mem4 s l1 i n ∧ frame mem4 mem2 s n → (if ¬l1 = null then ¬l1 = null ∧ ¬l1 = null ∧ (let mem5 : mem := mem.mk (Function.update mem3 l1 p); ((0 : ℤ) ≤ n - i ∧ n - (i + (1 : ℤ)) < n - i) ∧ (if n = (0 : ℤ) then mem3 l1 = l1 ∧ l1 = null else i + (1 : ℤ) = (0 : ℤ) ∧ l1 = null ∧ mem3 l1 = s (0 : ℤ) ∨ i + (1 : ℤ) = n ∧ l1 = s (n - (1 : ℤ)) ∧ mem3 l1 = null ∨ ((0 : ℤ) < i + (1 : ℤ) ∧ i + (1 : ℤ) < n) ∧ l1 = s (i + (1 : ℤ) - (1 : ℤ)) ∧ mem3 l1 = s (i + (1 : ℤ))) ∧ listRL mem5 s l1 (0 : ℤ) (i + (1 : ℤ)) ∧ listLR mem5 s (mem3 l1) (i + (1 : ℤ)) n ∧ frame mem5 mem2 s n) else listRL mem4 s p (0 : ℤ) n ∧ frame mem4 mem2 s n))
  := sorry
end linked_list_rev_YetAnotherInPlaceRev_list_reversalqtvc
