import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.int.Sum
import Why3.map.MapExt
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
import Why3.matrix.Matrix
import pearl.verifythis_2021_shearsort_vcg.lean.verifythis_2021_shearsort.Quicksort
open Classical
open Lean4Why3
namespace verifythis_2021_shearsort_ShearSortComplete_sortqtrefnqtvc
axiom column :  {α : Type} -> [Inhabited α] -> Matrix.matrix α -> ℤ -> ℤ -> α
axiom column'def {α : Type} [Inhabited α] (m : Matrix.matrix α) (j : ℤ) (i : ℤ) : column m j i = Matrix.elts m i j
axiom moccf :  {α : Type} -> [Inhabited α] -> α -> (ℤ -> ℤ -> α) -> ℤ -> ℤ -> ℤ
axiom moccf'def {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (c : ℤ) (i : ℤ) : moccf x e c i = Int.ofNat (Lean4Why3.map_occ x (e i) (0 : ℤ) c)
noncomputable def mocc {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (r : ℤ) (c : ℤ) := int.Sum.sum (moccf x e c) (0 : ℤ) r
theorem sort'refn'vc (a : List ℤ) (a1 : List ℤ) (fact0 : List.length a = List.length a1) (fact1 : IntArraySorted.sorted a) (fact2 : List.Perm a1 a) : (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i ≤ j ∧ j < Int.ofNat (List.length a) → a[Int.toNat i]! ≤ a[Int.toNat j]!) ∧ MapPermut.permut (getElem! a ∘ Int.toNat) (getElem! a1 ∘ Int.toNat) (0 : ℤ) (Int.ofNat (List.length a))
  := sorry
end verifythis_2021_shearsort_ShearSortComplete_sortqtrefnqtvc
