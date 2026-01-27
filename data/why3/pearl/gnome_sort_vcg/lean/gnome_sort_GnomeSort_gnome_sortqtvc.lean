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
namespace gnome_sort_GnomeSort_gnome_sortqtvc
theorem gnome_sort'vc (a : List ℤ) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a) ∧ IntArraySorted.sorted_sub1 a (0 : ℤ) (0 : ℤ) ∧ List.Perm a a ∧ (∀(pos : ℤ) (a1 : List ℤ), List.length a1 = List.length a → ((0 : ℤ) ≤ pos ∧ pos ≤ Int.ofNat (List.length a1)) ∧ IntArraySorted.sorted_sub1 a1 (0 : ℤ) pos ∧ List.Perm a a1 → (if pos < Int.ofNat (List.length a1) then (¬pos = (0 : ℤ) → (let o1 : ℤ := pos - (1 : ℤ); ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length a1)) ∧ (0 : ℤ) ≤ pos ∧ pos < Int.ofNat (List.length a1))) ∧ (∀(o1 : Bool), (if pos = (0 : ℤ) then o1 = true else o1 = (if a1[Int.toNat (pos - (1 : ℤ))]! ≤ a1[Int.toNat pos]! then true else false)) → (if o1 = true then ((0 : ℤ) ≤ Inversions.inversions a1 ∧ Inversions.inversions a1 < Inversions.inversions a1 ∨ (0 : ℤ) ≤ Int.ofNat (List.length a1) - pos ∧ Int.ofNat (List.length a1) - (pos + (1 : ℤ)) < Int.ofNat (List.length a1) - pos) ∧ ((0 : ℤ) ≤ pos + (1 : ℤ) ∧ pos + (1 : ℤ) ≤ Int.ofNat (List.length a1)) ∧ IntArraySorted.sorted_sub1 a1 (0 : ℤ) (pos + (1 : ℤ)) ∧ List.Perm a a1 else let o2 : ℤ := pos - (1 : ℤ); (((0 : ℤ) ≤ pos ∧ pos < Int.ofNat (List.length a1)) ∧ (0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length a1)) ∧ (∀(a2 : List ℤ), List.length a2 = List.length a1 → Lean4Why3.arrayExchange a1 a2 pos o2 → ((0 : ℤ) ≤ Inversions.inversions a1 ∧ Inversions.inversions a2 < Inversions.inversions a1 ∨ Inversions.inversions a1 = Inversions.inversions a2 ∧ (0 : ℤ) ≤ Int.ofNat (List.length a1) - pos ∧ Int.ofNat (List.length a2) - (pos - (1 : ℤ)) < Int.ofNat (List.length a1) - pos) ∧ ((0 : ℤ) ≤ pos - (1 : ℤ) ∧ pos - (1 : ℤ) ≤ Int.ofNat (List.length a2)) ∧ IntArraySorted.sorted_sub1 a2 (0 : ℤ) (pos - (1 : ℤ)) ∧ List.Perm a a2))) else IntArraySorted.sorted a1 ∧ List.Perm a a1))
  := sorry
end gnome_sort_GnomeSort_gnome_sortqtvc
