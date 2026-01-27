import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_HoareLogic_even_not_oddqtvc
inductive even : ℤ -> Prop where
 | even_0 : even (0 : ℤ)
 | even_odd (x : ℤ) : even x → even (x + (2 : ℤ))
theorem even_not_odd'vc (x : ℤ) : ¬(even x ∧ even (x + (1 : ℤ)))
  := sorry
end sf_HoareLogic_even_not_oddqtvc
