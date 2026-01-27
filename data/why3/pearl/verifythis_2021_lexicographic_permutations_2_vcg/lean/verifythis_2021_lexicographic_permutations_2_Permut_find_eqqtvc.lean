import Why3.Base
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_Permut_find_eqqtvc
noncomputable def sorted_sub (a : List ℤ) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → a[Int.toNat i2]! ≤ a[Int.toNat i1]!
noncomputable def sorted (a : List ℤ) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → a[Int.toNat i2]! ≤ a[Int.toNat i1]!
noncomputable def le (a1 : List ℤ) (a2 : List ℤ) := List.length a1 = List.length a2 ∧ (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length a1)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → a1[Int.toNat j]! = a2[Int.toNat j]!) ∧ (i < Int.ofNat (List.length a1) → a1[Int.toNat i]! < a2[Int.toNat i]!))
noncomputable def lt (a1 : List ℤ) (a2 : List ℤ) := le a1 a2 ∧ ¬a1 = a2
theorem find_eq'vc (a1 : List ℤ) (a2 : List ℤ) (i : ℤ) (fact0 : List.length a1 = List.length a2) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length a1)) (fact3 : List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a2)) : let o1 : ℤ := Int.ofNat (List.length a1); (¬i = o1 → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a2)) ∧ (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (∀(o2 : Bool), (if i = o1 then o2 = true else o2 = (if a1[Int.toNat i]! = a2[Int.toNat i]! then false else true)) → (¬o2 = true → (let o3 : ℤ := i + (1 : ℤ); ((0 : ℤ) ≤ Int.ofNat (List.length a1) - i ∧ Int.ofNat (List.length a1) - o3 < Int.ofNat (List.length a1) - i) ∧ List.length a1 = List.length a2 ∧ ((0 : ℤ) ≤ o3 ∧ o3 ≤ Int.ofNat (List.length a1)) ∧ List.drop (0 : ℕ) (List.take (Int.toNat o3 - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat o3 - (0 : ℕ)) a2))) ∧ (∀(result : ℤ), (if o2 = true then result = i else ((0 : ℤ) ≤ result ∧ result ≤ Int.ofNat (List.length a1)) ∧ List.drop (0 : ℕ) (List.take (Int.toNat result - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat result - (0 : ℕ)) a2) ∧ (result < Int.ofNat (List.length a1) → ¬a1[Int.toNat result]! = a2[Int.toNat result]!)) → ((0 : ℤ) ≤ result ∧ result ≤ Int.ofNat (List.length a1)) ∧ List.drop (0 : ℕ) (List.take (Int.toNat result - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat result - (0 : ℕ)) a2) ∧ (result < Int.ofNat (List.length a1) → ¬a1[Int.toNat result]! = a2[Int.toNat result]!)))
  := sorry
end verifythis_2021_lexicographic_permutations_2_Permut_find_eqqtvc
