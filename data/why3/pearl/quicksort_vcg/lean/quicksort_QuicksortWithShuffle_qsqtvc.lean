import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import pearl.quicksort_vcg.lean.quicksort.Quicksort
import Why3.array.IntArraySorted
import pearl.quicksort_vcg.lean.quicksort.Shuffle
import Why3.random.State
import Why3.random.Random
open Classical
open Lean4Why3
namespace quicksort_QuicksortWithShuffle_qsqtvc
theorem qs'vc (a : List ℤ) (a1 : List ℤ) (a2 : List ℤ) (fact0 : List.length a = List.length a1) (fact1 : List.Perm a1 a) (fact2 : List.length a2 = List.length a) (fact3 : IntArraySorted.sorted a2) (fact4 : List.Perm a a2) : IntArraySorted.sorted a2 ∧ List.Perm a1 a2
  := sorry
end quicksort_QuicksortWithShuffle_qsqtvc
