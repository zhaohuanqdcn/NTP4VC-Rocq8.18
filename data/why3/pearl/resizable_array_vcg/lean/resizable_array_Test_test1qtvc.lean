import Why3.Base
import pearl.resizable_array_vcg.lean.resizable_array.ResizableArrayImplem
open Classical
open Lean4Why3
namespace resizable_array_Test_test1qtvc
theorem test1'vc : (0 : ℤ) ≤ (10 : ℤ) ∧ (∀(r : ResizableArrayImplem.rarray ℤ), ResizableArrayImplem.dummy r = (0 : ℤ) ∧ ResizableArrayImplem.length r = (10 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (10 : ℤ) → (ResizableArrayImplem.data r)[Int.toNat i]! = (0 : ℤ)) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < ResizableArrayImplem.length r) ∧ (∀(r1 : ResizableArrayImplem.rarray ℤ), List.length (ResizableArrayImplem.data r1) = List.length (ResizableArrayImplem.data r) → ResizableArrayImplem.length r = ResizableArrayImplem.length r1 ∧ ResizableArrayImplem.dummy r = ResizableArrayImplem.dummy r1 → getElem! (ResizableArrayImplem.data r1) ∘ Int.toNat = Function.update (getElem! (ResizableArrayImplem.data r) ∘ Int.toNat) (0 : ℤ) (17 : ℤ) → (0 : ℤ) ≤ (7 : ℤ)))
  := sorry
end resizable_array_Test_test1qtvc
