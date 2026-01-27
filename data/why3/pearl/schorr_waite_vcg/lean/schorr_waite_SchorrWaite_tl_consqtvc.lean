import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace schorr_waite_SchorrWaite_tl_consqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom stacknodes : Type
axiom inhabited_axiom_stacknodes : Inhabited stacknodes
attribute [instance] inhabited_axiom_stacknodes
noncomputable def not_in_stack (n : loc) (s : List loc) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → ¬n = s[Int.toNat i]!
theorem tl_cons'vc (s2 : List loc) (fact0 : (0 : ℤ) < Int.ofNat (List.length s2)) : s2 = List.cons (s2[(0 : ℕ)]!) (List.drop (1 : ℕ) s2)
  := sorry
end schorr_waite_SchorrWaite_tl_consqtvc
