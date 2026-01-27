import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2015_dancing_links_DancingLinks_dllqtvc
theorem dll'vc : (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o1 : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o1[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o1) = (0 : ℤ) → (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o2 : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o2[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o2) = (0 : ℤ) → List.length o2 = List.length o1 ∧ Int.ofNat (List.length o1) = (0 : ℤ)))
  := sorry
end verifythis_2015_dancing_links_DancingLinks_dllqtvc
