import Why3.Base
import Why3.int.NumOf
import Why3.int.Sum
import Why3.map.MapExt
import Why3.map.MapPermut
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace verifythis_2021_shearsort_ShearSort_transpose_countqtvc
axiom column :  {α : Type} -> [Inhabited α] -> Matrix.matrix α -> ℤ -> ℤ -> α
axiom column'def {α : Type} [Inhabited α] (m : Matrix.matrix α) (j : ℤ) (i : ℤ) : column m j i = Matrix.elts m i j
axiom moccf :  {α : Type} -> [Inhabited α] -> α -> (ℤ -> ℤ -> α) -> ℤ -> ℤ -> ℤ
axiom moccf'def {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (c : ℤ) (i : ℤ) : moccf x e c i = Int.ofNat (Lean4Why3.map_occ x (e i) (0 : ℤ) c)
noncomputable def mocc {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (r : ℤ) (c : ℤ) := int.Sum.sum (moccf x e c) (0 : ℤ) r
theorem transpose_count'vc {α : Type} [Inhabited α] (r : ℤ) (c : ℤ) (e1 : ℤ -> ℤ -> α) (e2 : ℤ -> ℤ -> α) (x : α) (fact0 : (0 : ℤ) ≤ r) (fact1 : (0 : ℤ) ≤ c) (fact2 : ∀(i : ℤ) (j : ℤ), ((0 : ℤ) ≤ i ∧ i < r) ∧ (0 : ℤ) ≤ j ∧ j < c → e1 i j = e2 j i) : mocc x e1 r c = mocc x e2 c r
  := sorry
end verifythis_2021_shearsort_ShearSort_transpose_countqtvc
