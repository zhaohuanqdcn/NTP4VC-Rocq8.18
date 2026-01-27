import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace OptimalReplay
axiom n : ℤ
axiom n'def : (0 : ℤ) < n
axiom f : ℤ -> ℤ
axiom f'spec (k : ℤ) (fact0 : (0 : ℤ) < k) (fact1 : k < n) : (0 : ℤ) ≤ f k ∧ f k < k
inductive path : ℤ -> ℤ -> Prop where
 | path0 : path (0 : ℤ) (0 : ℤ)
 | paths (i : ℤ) (d : ℤ) (j : ℤ) : (0 : ℤ) ≤ i → i < n → path d j → f i ≤ j → j < i → path (d + (1 : ℤ)) i
noncomputable def distance (d : ℤ) (i : ℤ) := path d i ∧ (∀(d' : ℤ), path d' i → d ≤ d')
end OptimalReplay
