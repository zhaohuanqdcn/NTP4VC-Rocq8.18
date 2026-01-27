import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace list_removal_Top_remove2qtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom mem : Type
axiom inhabited_axiom_mem : Inhabited mem
attribute [instance] inhabited_axiom_mem
axiom null : loc
axiom head : loc
axiom entry : loc
axiom head_is_not_null : ¬head = null
axiom entry_is_not_null : ¬entry = null
axiom head_is_not_entry : ¬head = entry
axiom list : (loc -> loc) -> loc -> ℤ -> loc -> Prop
axiom list'def (n : ℤ) (mem1 : loc -> loc) (x : loc) (y : loc) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then list mem1 x n y = (x = y) else list mem1 x n y = (¬x = null ∧ list mem1 (mem1 x) (n - (1 : ℤ)) y)
theorem remove2'vc (n1 : ℤ) (n2 : ℤ) (mem1 : loc -> loc) (fact0 : (0 : ℤ) < n1) (fact1 : (0 : ℤ) < n2) (fact2 : list mem1 head n1 entry) (fact3 : list mem1 entry n2 null) : (0 : ℤ) < (1 : ℤ) ∧ (1 : ℤ) ≤ n1 ∧ ¬head = null ∧ list mem1 head ((1 : ℤ) - (1 : ℤ)) head ∧ list mem1 (mem1 head) (n1 - (1 : ℤ)) entry ∧ list mem1 entry n2 null ∧ (∀(n : ℤ) (ind : loc), ((0 : ℤ) < n ∧ n ≤ n1) ∧ ¬ind = null ∧ list mem1 head (n - (1 : ℤ)) ind ∧ list mem1 (mem1 ind) (n1 - n) entry ∧ list mem1 entry n2 null → ¬ind = null ∧ (if ¬mem1 ind = entry then ¬ind = null ∧ ((0 : ℤ) ≤ n1 - n ∧ n1 - (n + (1 : ℤ)) < n1 - n) ∧ ((0 : ℤ) < n + (1 : ℤ) ∧ n + (1 : ℤ) ≤ n1) ∧ ¬mem1 ind = null ∧ list mem1 head (n + (1 : ℤ) - (1 : ℤ)) (mem1 ind) ∧ list mem1 (mem1 (mem1 ind)) (n1 - (n + (1 : ℤ))) entry ∧ list mem1 entry n2 null else let o1 : loc := entry; ¬o1 = null ∧ ¬ind = null ∧ list (Function.update mem1 ind (mem1 o1)) head (n1 + n2 - (1 : ℤ)) null))
  := sorry
end list_removal_Top_remove2qtvc
