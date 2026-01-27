import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace zeros_AllZeros_all_zeros4qtvc
noncomputable def all_zeros (a : List ℤ) (hi : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < hi → a[Int.toNat i]! = (0 : ℤ)
theorem all_zeros4'vc (a : List ℤ) : (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length a)) ∧ all_zeros a i → (let o1 : ℤ := Int.ofNat (List.length a); (¬i = o1 → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (a[Int.toNat i]! = (0 : ℤ) → (let o2 : ℤ := i + (1 : ℤ); ((0 : ℤ) ≤ Int.ofNat (List.length a) - i ∧ Int.ofNat (List.length a) - o2 < Int.ofNat (List.length a) - i) ∧ ((0 : ℤ) ≤ o2 ∧ o2 ≤ Int.ofNat (List.length a)) ∧ all_zeros a o2))) ∧ (∀(result : Bool), (if i = o1 then result = true else if a[Int.toNat i]! = (0 : ℤ) then result = (if all_zeros a (Int.ofNat (List.length a)) then true else false) else result = false) → (result = true) = all_zeros a (Int.ofNat (List.length a))))) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a) ∧ all_zeros a (0 : ℤ)
  := sorry
end zeros_AllZeros_all_zeros4qtvc
