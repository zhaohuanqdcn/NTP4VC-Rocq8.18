import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
import pearl.verifythis_2021_lexicographic_permutations_2_vcg.lean.verifythis_2021_lexicographic_permutations_2.BoxedIntArrays
import Why3.queue.Queue
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_Permut_as_numberqtvc
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
axiom as_num : ℤ -> List ℤ -> ℤ -> ℤ
axiom as_num'def (base : ℤ) (a : List ℤ) (i : ℤ) (fact0 : BoxedIntArrays.boxed base a) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length a)) : if i = Int.ofNat (List.length a) then as_num base a i = (0 : ℤ) else as_num base a i = a[Int.toNat i]! * HPow.hPow base (Int.toNat (Int.ofNat (List.length a) - (1 : ℤ) - i)) + as_num base a (i + (1 : ℤ))
axiom as_num'spec (base : ℤ) (a : List ℤ) (i : ℤ) (fact0 : BoxedIntArrays.boxed base a) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length a)) : (2 : ℤ) * abs (as_num base a i) < HPow.hPow base (Int.toNat (Int.ofNat (List.length a) - i))
theorem as_number'vc (base : ℤ) (a : List ℤ) (fact0 : BoxedIntArrays.boxed base a) : BoxedIntArrays.boxed base a ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a) ∧ (let result : ℤ := as_num base a (0 : ℤ); (2 : ℤ) * abs result < HPow.hPow base (Int.toNat (Int.ofNat (List.length a) - (0 : ℤ))) → abs result ≤ BoxedIntArrays.maxi base a)
  := sorry
end verifythis_2021_lexicographic_permutations_2_Permut_as_numberqtvc
