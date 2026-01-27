import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace Quicksort
noncomputable def qs_partition (a1 : List ℤ) (a2 : List ℤ) (l : ℤ) (m : ℤ) (r : ℤ) (v : ℤ) := List.permut_sub' a1 a2 (Int.toNat l) (Int.toNat r) ∧ (∀(j : ℤ), l ≤ j ∧ j < m → a2[Int.toNat j]! < v) ∧ (∀(j : ℤ), m < j ∧ j < r → v ≤ a2[Int.toNat j]!) ∧ a2[Int.toNat m]! = v
end Quicksort
