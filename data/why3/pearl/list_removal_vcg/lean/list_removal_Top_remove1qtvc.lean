import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace list_removal_Top_remove1qtvc
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
theorem remove1'vc (n1 : ℤ) (n2 : ℤ) (mem1 : loc -> loc) (fact0 : (0 : ℤ) < n1) (fact1 : (0 : ℤ) < n2) (fact2 : list mem1 head n1 entry) (fact3 : list mem1 entry n2 null) : let o1 : loc := head; ¬o1 = null ∧ (let o2 : loc := mem1 o1; (((0 : ℤ) < (1 : ℤ) ∧ (1 : ℤ) ≤ n1) ∧ list mem1 head (1 : ℤ) o2 ∧ ¬o2 = null ∧ list mem1 o2 (n1 - (1 : ℤ)) entry ∧ list mem1 entry n2 null) ∧ (∀(n : ℤ) (curr : loc) (prev : loc), ((0 : ℤ) < n ∧ n ≤ n1) ∧ list mem1 head n curr ∧ ¬curr = null ∧ (prev = null → n = (1 : ℤ)) ∧ (¬prev = null → mem1 prev = curr) ∧ (¬prev = null → list mem1 head (n - (1 : ℤ)) prev) ∧ list mem1 curr (n1 - n) entry ∧ list mem1 entry n2 null → (if ¬curr = entry then ¬curr = null ∧ ((0 : ℤ) ≤ n1 - n ∧ n1 - (n + (1 : ℤ)) < n1 - n) ∧ ((0 : ℤ) < n + (1 : ℤ) ∧ n + (1 : ℤ) ≤ n1) ∧ list mem1 head (n + (1 : ℤ)) (mem1 curr) ∧ ¬mem1 curr = null ∧ (curr = null → n + (1 : ℤ) = (1 : ℤ)) ∧ (¬curr = null → True) ∧ (¬curr = null → list mem1 head (n + (1 : ℤ) - (1 : ℤ)) curr) ∧ list mem1 (mem1 curr) (n1 - (n + (1 : ℤ))) entry ∧ list mem1 entry n2 null else if prev = null then ¬curr = null ∧ (let o3 : loc := head; ¬o3 = null ∧ list (Function.update mem1 o3 (mem1 curr)) head (n1 + n2 - (1 : ℤ)) null) else ¬curr = null ∧ ¬prev = null ∧ list (Function.update mem1 prev (mem1 curr)) head (n1 + n2 - (1 : ℤ)) null)))
  := sorry
end list_removal_Top_remove1qtvc
