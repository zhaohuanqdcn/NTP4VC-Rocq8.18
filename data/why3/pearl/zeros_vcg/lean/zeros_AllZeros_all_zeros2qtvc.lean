import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace zeros_AllZeros_all_zeros2qtvc
noncomputable def all_zeros (a : List ℤ) (hi : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < hi → a[Int.toNat i]! = (0 : ℤ)
theorem all_zeros2'vc (a : List ℤ) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a) ∧ all_zeros a (0 : ℤ) ∧ (∀(i : ℤ) (res : Bool), ((0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length a)) ∧ (res = true) = all_zeros a i → (∀(o1 : Bool), (if res = true then o1 = (if i < Int.ofNat (List.length a) then true else false) else o1 = false) → (if o1 = true then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ Int.ofNat (List.length a) - i ∧ Int.ofNat (List.length a) - (i + (1 : ℤ)) < Int.ofNat (List.length a) - i) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ Int.ofNat (List.length a)) ∧ ((if a[Int.toNat i]! = (0 : ℤ) then true else false) = true) = all_zeros a (i + (1 : ℤ)) else (res = true) = all_zeros a (Int.ofNat (List.length a)))))
  := sorry
end zeros_AllZeros_all_zeros2qtvc
