import Why3.Base
open Classical
open Lean4Why3
namespace linked_list_rev_YetAnotherInPlaceRev_set_cdrqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
structure mem where
  next : loc -> loc
axiom inhabited_axiom_mem : Inhabited mem
attribute [instance] inhabited_axiom_mem
axiom o1 : (loc -> loc) -> loc -> loc -> loc -> loc
axiom o'def (mem1 : loc -> loc) (p : loc) (v : loc) (x : loc) : o1 mem1 p v x = (if x = p then v else mem1 x)
theorem set_cdr'vc (p : loc) (mem1 : loc -> loc) (v : loc) (mem2 : loc -> loc) (fact0 : ¬p = null) (fact1 : ∀(x : loc), mem1 x = (if x = p then v else mem2 x)) : mem1 = Function.update mem2 p v
  := sorry
end linked_list_rev_YetAnotherInPlaceRev_set_cdrqtvc
