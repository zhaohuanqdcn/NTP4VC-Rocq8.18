import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace schorr_waite_SchorrWaite_cons_not_inqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom stacknodes : Type
axiom inhabited_axiom_stacknodes : Inhabited stacknodes
attribute [instance] inhabited_axiom_stacknodes
noncomputable def not_in_stack (n : loc) (s : List loc) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → ¬n = s[Int.toNat i]!
theorem cons_not_in'vc (n : loc) (t : loc) (s : List loc) (fact0 : not_in_stack n (List.cons t s)) : not_in_stack n s
  := sorry
end schorr_waite_SchorrWaite_cons_not_inqtvc
