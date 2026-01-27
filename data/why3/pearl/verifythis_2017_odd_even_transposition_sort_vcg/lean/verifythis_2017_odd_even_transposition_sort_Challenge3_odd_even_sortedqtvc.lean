import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.int.Sum
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
import Why3.array.Inversions
open Classical
open Lean4Why3
namespace verifythis_2017_odd_even_transposition_sort_Challenge3_odd_even_sortedqtvc
noncomputable def odd_sorted (a : List ℤ) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i → (2 : ℤ) * i + (2 : ℤ) < n → a[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]! ≤ a[Int.toNat ((2 : ℤ) * i + (2 : ℤ))]!
noncomputable def even_sorted (a : List ℤ) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i → (2 : ℤ) * i + (1 : ℤ) < n → a[Int.toNat ((2 : ℤ) * i)]! ≤ a[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]!
theorem odd_even_sorted'vc (n : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ Int.ofNat (List.length a)) (fact2 : odd_sorted a n) (fact3 : even_sorted a n) : IntArraySorted.sorted_sub1 a (0 : ℤ) n
  := sorry
end verifythis_2017_odd_even_transposition_sort_Challenge3_odd_even_sortedqtvc
