import Why3.Base
import Why3.int.NumOf
import Why3.int.Sum
import Why3.map.MapExt
import Why3.map.MapPermut
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace verifythis_2021_shearsort_ShearSort_permut_swapqtvc
axiom column :  {α : Type} -> [Inhabited α] -> Matrix.matrix α -> ℤ -> ℤ -> α
axiom column'def {α : Type} [Inhabited α] (m : Matrix.matrix α) (j : ℤ) (i : ℤ) : column m j i = Matrix.elts m i j
axiom moccf :  {α : Type} -> [Inhabited α] -> α -> (ℤ -> ℤ -> α) -> ℤ -> ℤ -> ℤ
axiom moccf'def {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (c : ℤ) (i : ℤ) : moccf x e c i = Int.ofNat (Lean4Why3.map_occ x (e i) (0 : ℤ) c)
noncomputable def mocc {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (r : ℤ) (c : ℤ) := int.Sum.sum (moccf x e c) (0 : ℤ) r
theorem permut_swap'vc {α : Type} [Inhabited α] (l : ℤ) (x : ℤ) (u : ℤ) (y : ℤ) (a : ℤ -> α) (b : ℤ -> α) (fact0 : l ≤ x) (fact1 : x < u) (fact2 : l ≤ y) (fact3 : y < u) (fact4 : ∀(i : ℤ), (l ≤ i ∧ i ≤ u) ∧ ¬i = x ∧ ¬i = y → a i = b i) (fact5 : a x = b y) (fact6 : a y = b x) : MapPermut.permut a b l u
  := sorry
end verifythis_2021_shearsort_ShearSort_permut_swapqtvc
