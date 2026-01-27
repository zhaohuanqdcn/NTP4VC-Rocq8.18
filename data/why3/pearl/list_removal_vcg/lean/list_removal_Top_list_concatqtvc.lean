import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace list_removal_Top_list_concatqtvc
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
theorem list_concat'vc (n1 : ℤ) (n2 : ℤ) (mem1 : loc -> loc) (x : loc) (y : loc) (z : loc) (fact0 : (0 : ℤ) ≤ n1) (fact1 : (0 : ℤ) ≤ n2) (fact2 : list mem1 x n1 y) (fact3 : ¬y = null) (fact4 : list mem1 (mem1 y) n2 z) : list mem1 x (n1 + (1 : ℤ) + n2) z
  := sorry
end list_removal_Top_list_concatqtvc
