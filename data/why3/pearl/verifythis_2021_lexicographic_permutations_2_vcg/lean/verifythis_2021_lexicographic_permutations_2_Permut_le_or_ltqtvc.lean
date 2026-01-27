import Why3.Base
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_Permut_le_or_ltqtvc
noncomputable def sorted_sub (a : List ℤ) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → a[Int.toNat i2]! ≤ a[Int.toNat i1]!
noncomputable def sorted (a : List ℤ) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → a[Int.toNat i2]! ≤ a[Int.toNat i1]!
noncomputable def le (a1 : List ℤ) (a2 : List ℤ) := List.length a1 = List.length a2 ∧ (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length a1)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → a1[Int.toNat j]! = a2[Int.toNat j]!) ∧ (i < Int.ofNat (List.length a1) → a1[Int.toNat i]! < a2[Int.toNat i]!))
noncomputable def lt (a1 : List ℤ) (a2 : List ℤ) := le a1 a2 ∧ ¬a1 = a2
axiom find_eq : List ℤ -> List ℤ -> ℤ -> ℤ
axiom find_eq'def (a1 : List ℤ) (a2 : List ℤ) (i : ℤ) (fact0 : List.length a1 = List.length a2) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length a1)) (fact3 : List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a2)) : if i = Int.ofNat (List.length a1) ∨ ¬a1[Int.toNat i]! = a2[Int.toNat i]! then find_eq a1 a2 i = i else find_eq a1 a2 i = find_eq a1 a2 (i + (1 : ℤ))
axiom find_eq'spec'1 (a1 : List ℤ) (a2 : List ℤ) (i : ℤ) (fact0 : List.length a1 = List.length a2) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length a1)) (fact3 : List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a2)) : (0 : ℤ) ≤ find_eq a1 a2 i ∧ find_eq a1 a2 i ≤ Int.ofNat (List.length a1)
axiom find_eq'spec'0 (a1 : List ℤ) (a2 : List ℤ) (i : ℤ) (fact0 : List.length a1 = List.length a2) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length a1)) (fact3 : List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a2)) : List.drop (0 : ℕ) (List.take (Int.toNat (find_eq a1 a2 i) - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat (find_eq a1 a2 i) - (0 : ℕ)) a2)
axiom find_eq'spec (a1 : List ℤ) (a2 : List ℤ) (i : ℤ) (fact0 : List.length a1 = List.length a2) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length a1)) (fact3 : List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a1) = List.drop (0 : ℕ) (List.take (Int.toNat i - (0 : ℕ)) a2)) (fact4 : find_eq a1 a2 i < Int.ofNat (List.length a1)) : ¬a1[Int.toNat (find_eq a1 a2 i)]! = a2[Int.toNat (find_eq a1 a2 i)]!
noncomputable def find_le (a1 : List ℤ) (a2 : List ℤ) := if List.length a1 = List.length a2 then let i : ℤ := find_eq a1 a2 (0 : ℤ); if i = Int.ofNat (List.length a1) then true else if a1[Int.toNat i]! < a2[Int.toNat i]! then true else false else false
axiom find_le'spec (a1 : List ℤ) (a2 : List ℤ) : (find_le a1 a2 = true) = le a1 a2
theorem le_or_lt'vc (a1 : List ℤ) (a2 : List ℤ) (fact0 : List.length a1 = List.length a2) : le a1 a2 ∨ lt a2 a1
  := sorry
end verifythis_2021_lexicographic_permutations_2_Permut_le_or_ltqtvc
