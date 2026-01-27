import Why3.Base
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace linked_list_rev_Termination_set_idxqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
structure mem where
  next : loc -> loc
axiom inhabited_axiom_mem : Inhabited mem
attribute [instance] inhabited_axiom_mem
noncomputable def valid_cells (s : ℤ -> loc) (n : ℤ) := (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → ¬s i = null) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ j ∧ j < n → ¬i = j → ¬s i = s j)
noncomputable def inside_memory (s : ℤ -> loc) (n : ℤ) (l : loc) := l = null ∨ (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < n) ∧ l = s i)
noncomputable def finite_memory (m : mem) (s : ℤ -> loc) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → inside_memory s n (mem.next m (s i))
axiom fc : (ℤ -> loc) -> (loc -> ℤ) -> ℤ -> Bool
axiom fc'def (s : ℤ -> loc) (idx : loc -> ℤ) (i : ℤ) : (fc s idx i = true) = ((0 : ℤ) < idx (s i))
noncomputable def seen (s : ℤ -> loc) (idx : loc -> ℤ) (lo : ℤ) (hi : ℤ) := NumOf.numof (fc s idx) lo hi
theorem set_idx'vc (s : ℤ -> loc) (n : ℤ) (l : loc) (idx : loc -> ℤ) (fact0 : valid_cells s n) (fact1 : inside_memory s n l) (fact2 : ¬l = null) (fact3 : idx l = -(1 : ℤ)) (fact4 : (0 : ℤ) ≤ seen s idx (0 : ℤ) n) : seen s (Function.update idx l (seen s idx (0 : ℤ) n + (1 : ℤ))) (0 : ℤ) n = (1 : ℤ) + seen s idx (0 : ℤ) n
  := sorry
end linked_list_rev_Termination_set_idxqtvc
