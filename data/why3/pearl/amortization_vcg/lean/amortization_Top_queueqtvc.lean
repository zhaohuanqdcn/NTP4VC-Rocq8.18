import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace amortization_Top_queueqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
theorem queue'vc : ∃(size : ℤ) (credits : ℤ), (0 : ℤ) ≤ size ∧ (0 : ℤ) ≤ credits ∧ credits ≤ size
  := sorry
end amortization_Top_queueqtvc
