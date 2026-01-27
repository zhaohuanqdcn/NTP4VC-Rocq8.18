import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeArray_createqtvc
noncomputable def is_cumulative_array_for (c : List ℤ) (a : List ℤ) := Int.ofNat (List.length c) = Int.ofNat (List.length a) + (1 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length c) → getElem! c (Int.toNat i) = ArraySum.sum a (0 : ℤ) i)
theorem create'vc (a : List ℤ) : let l : ℤ := Int.ofNat (List.length a); let o1 : ℤ := l + (1 : ℤ); (0 : ℤ) ≤ o1 ∧ (∀(s : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 → s[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length s) = o1 → ((1 : ℤ) ≤ l + (1 : ℤ) → (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < (1 : ℤ) → s[Int.toNat k]! = ArraySum.sum a (0 : ℤ) k) ∧ (∀(s1 : List ℤ), List.length s1 = List.length s → (∀(i : ℤ), ((1 : ℤ) ≤ i ∧ i ≤ l) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i → s1[Int.toNat k]! = ArraySum.sum a (0 : ℤ) k) → (let o2 : ℤ := i - (1 : ℤ); ((0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length a)) ∧ (let o3 : ℤ := i - (1 : ℤ); ((0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length s1)) ∧ (let o4 : ℤ := s1[Int.toNat o3]! + a[Int.toNat o2]!; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s1)) ∧ (List.length (List.set s1 (Int.toNat i) o4) = List.length s1 → getElem! (List.set s1 (Int.toNat i) o4) ∘ Int.toNat = Function.update (getElem! s1 ∘ Int.toNat) i o4 → (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i + (1 : ℤ) → (List.set s1 (Int.toNat i) o4)[Int.toNat k]! = ArraySum.sum a (0 : ℤ) k)))))) ∧ ((∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < l + (1 : ℤ) → s1[Int.toNat k]! = ArraySum.sum a (0 : ℤ) k) → is_cumulative_array_for s1 a))) ∧ (l + (1 : ℤ) < (1 : ℤ) → is_cumulative_array_for s a))
  := sorry
end sumrange_CumulativeArray_createqtvc
