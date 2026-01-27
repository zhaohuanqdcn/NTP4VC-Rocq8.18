import Why3.Base
import Why3.map.MapEq
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_ArrayListConversions_to_list_fromqtvc
theorem to_list_from'vc (i : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) : let o1 : ℤ := Int.ofNat (List.length a); (¬i = o1 → (let o2 : ℤ := i + (1 : ℤ); (((0 : ℤ) ≤ Int.ofNat (List.length a) - i ∧ Int.ofNat (List.length a) - o2 < Int.ofNat (List.length a) - i) ∧ (0 : ℤ) ≤ o2 ∧ o2 ≤ Int.ofNat (List.length a)) ∧ (∀(o3 : List ℤ), Int.ofNat (List.length o3) = Int.ofNat (List.length a) - o2 ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) - o2 → getElem_i? o3 k = Option.some (a[Int.toNat (k + o2)]!)) → (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)))) ∧ (∀(result : List ℤ), (if i = o1 then result = ([] : List ℤ) else let o2 : ℤ := i + (1 : ℤ); ∃(o3 : List ℤ), (Int.ofNat (List.length o3) = Int.ofNat (List.length a) - o2 ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) - o2 → getElem_i? o3 k = Option.some (a[Int.toNat (k + o2)]!))) ∧ result = List.cons (a[Int.toNat i]!) o3) → Int.ofNat (List.length result) = Int.ofNat (List.length a) - i ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) - i → getElem_i? result k = Option.some (a[Int.toNat (k + i)]!)))
  := sorry
end verifythis_2021_lexicographic_permutations_2_ArrayListConversions_to_list_fromqtvc
