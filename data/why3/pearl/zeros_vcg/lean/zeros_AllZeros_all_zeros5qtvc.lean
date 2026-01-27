import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace zeros_AllZeros_all_zeros5qtvc
noncomputable def all_zeros (a : List ℤ) (hi : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < hi → a[Int.toNat i]! = (0 : ℤ)
noncomputable def zero_interval (a : List ℤ) (lo : ℤ) (hi : ℤ) := ∀(i : ℤ), lo ≤ i ∧ i < hi → a[Int.toNat i]! = (0 : ℤ)
theorem all_zeros5'vc (a : List ℤ) : (∀(lo : ℤ) (hi : ℤ), (0 : ℤ) ≤ lo ∧ lo ≤ hi ∧ hi ≤ Int.ofNat (List.length a) → (¬hi ≤ lo → ¬(2 : ℤ) = (0 : ℤ) ∧ (let mid : ℤ := lo + Int.tdiv (hi - lo) (2 : ℤ); ((0 : ℤ) ≤ mid ∧ mid < Int.ofNat (List.length a)) ∧ (a[Int.toNat mid]! = (0 : ℤ) → (((0 : ℤ) ≤ hi - lo ∧ mid - lo < hi - lo) ∧ (0 : ℤ) ≤ lo ∧ lo ≤ mid ∧ mid ≤ Int.ofNat (List.length a)) ∧ (zero_interval a lo mid → (let o1 : ℤ := mid + (1 : ℤ); ((0 : ℤ) ≤ hi - lo ∧ hi - o1 < hi - lo) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ hi ∧ hi ≤ Int.ofNat (List.length a)))))) ∧ (∀(result : Bool), (if hi ≤ lo then result = true else let mid : ℤ := lo + Int.tdiv (hi - lo) (2 : ℤ); if a[Int.toNat mid]! = (0 : ℤ) then if zero_interval a lo mid then result = (if zero_interval a (mid + (1 : ℤ)) hi then true else false) else result = false else result = false) → (result = true) = zero_interval a lo hi)) ∧ (let o1 : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ zero_interval a (0 : ℤ) o1 = all_zeros a (Int.ofNat (List.length a)))
  := sorry
end zeros_AllZeros_all_zeros5qtvc
