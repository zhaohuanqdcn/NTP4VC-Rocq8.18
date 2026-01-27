import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace zeros_AllZeros_all_zeros1qtvc
noncomputable def all_zeros (a : List ℤ) (hi : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < hi → a[Int.toNat i]! = (0 : ℤ)
theorem all_zeros1'vc (a : List ℤ) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → all_zeros a (0 : ℤ) ∧ (∀(res : Bool), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (res = true) = all_zeros a i → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (if ¬a[Int.toNat i]! = (0 : ℤ) then (false = true) = all_zeros a (i + (1 : ℤ)) else (res = true) = all_zeros a (i + (1 : ℤ)))) ∧ ((res = true) = all_zeros a (o1 + (1 : ℤ)) → (res = true) = all_zeros a (Int.ofNat (List.length a))))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → all_zeros a (Int.ofNat (List.length a)))
  := sorry
end zeros_AllZeros_all_zeros1qtvc
