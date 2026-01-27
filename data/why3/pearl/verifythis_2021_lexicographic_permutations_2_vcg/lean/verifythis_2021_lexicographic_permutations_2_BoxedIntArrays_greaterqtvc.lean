import Why3.Base
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_greaterqtvc
noncomputable def boxed (u : ℤ) (a : List ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (2 : ℤ) * abs (a[Int.toNat i]!) < u
theorem greater'vc (a : List ℤ) : (∀(a : List ℤ) (l : ℤ), (0 : ℤ) ≤ l ∧ l ≤ Int.ofNat (List.length a) → (let o1 : ℤ := Int.ofNat (List.length a); (¬l = o1 → (let o2 : ℤ := l + (1 : ℤ); (((0 : ℤ) ≤ Int.ofNat (List.length a) - l ∧ Int.ofNat (List.length a) - o2 < Int.ofNat (List.length a) - l) ∧ (0 : ℤ) ≤ o2 ∧ o2 ≤ Int.ofNat (List.length a)) ∧ (∀(r : ℤ), (0 : ℤ) ≤ r ∧ (∀(i : ℤ), o2 ≤ i ∧ i < Int.ofNat (List.length a) → (2 : ℤ) * abs (a[Int.toNat i]!) < r) → (0 : ℤ) ≤ l ∧ l < Int.ofNat (List.length a)))) ∧ (∀(result : ℤ), (if l = o1 then result = (0 : ℤ) else ∃(r : ℤ), ((0 : ℤ) ≤ r ∧ (∀(i : ℤ), l + (1 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (2 : ℤ) * abs (a[Int.toNat i]!) < r)) ∧ result = max r ((2 : ℤ) * abs (a[Int.toNat l]!) + (1 : ℤ))) → (0 : ℤ) ≤ result ∧ (∀(i : ℤ), l ≤ i ∧ i < Int.ofNat (List.length a) → (2 : ℤ) * abs (a[Int.toNat i]!) < result)))) ∧ (∀(great : List ℤ -> ℤ -> ℤ), (∀(a : List ℤ) (l : ℤ), (0 : ℤ) ≤ l ∧ l ≤ Int.ofNat (List.length a) → great a l = (if l = Int.ofNat (List.length a) then (0 : ℤ) else max (great a (l + (1 : ℤ))) ((2 : ℤ) * abs (a[Int.toNat l]!) + (1 : ℤ))) ∧ (0 : ℤ) ≤ great a l ∧ (∀(i : ℤ), l ≤ i ∧ i < Int.ofNat (List.length a) → (2 : ℤ) * abs (a[Int.toNat i]!) < great a l)) → (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a))
  := sorry
end verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_greaterqtvc
