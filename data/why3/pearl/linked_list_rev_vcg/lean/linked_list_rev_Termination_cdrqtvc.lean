import Why3.Base
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace linked_list_rev_Termination_cdrqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
structure mem where
  next : loc -> loc
axiom inhabited_axiom_mem : Inhabited mem
attribute [instance] inhabited_axiom_mem
theorem cdr'vc : True
  := sorry
end linked_list_rev_Termination_cdrqtvc
