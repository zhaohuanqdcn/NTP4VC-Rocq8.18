import Why3.Base
import Why3.int.NumOf
import Why3.int.Sum
import Why3.map.MapExt
import Why3.map.MapPermut
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace verifythis_2021_shearsort_ShearSort_numoff_occqtvc
axiom column :  {α : Type} -> [Inhabited α] -> Matrix.matrix α -> ℤ -> ℤ -> α
axiom column'def {α : Type} [Inhabited α] (m : Matrix.matrix α) (j : ℤ) (i : ℤ) : column m j i = Matrix.elts m i j
axiom moccf :  {α : Type} -> [Inhabited α] -> α -> (ℤ -> ℤ -> α) -> ℤ -> ℤ -> ℤ
axiom moccf'def {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (c : ℤ) (i : ℤ) : moccf x e c i = Int.ofNat (Lean4Why3.map_occ x (e i) (0 : ℤ) c)
noncomputable def mocc {α : Type} [Inhabited α] (x : α) (e : ℤ -> ℤ -> α) (r : ℤ) (c : ℤ) := int.Sum.sum (moccf x e c) (0 : ℤ) r
axiom compose :  {γ : Type} -> [Inhabited γ] ->  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> γ) -> (α -> β) -> α -> γ
axiom compose'def {γ : Type} {α : Type} {β : Type} [Inhabited γ] [Inhabited α] [Inhabited β] (g : β -> γ) (f : α -> β) (x : α) : compose g f x = g (f x)
theorem numoff_occ'vc {α : Type} [Inhabited α] (l : ℤ) (u : ℤ) (p : α -> Bool) (x : α) (q : α -> Bool) (a : ℤ -> α) (fact0 : l ≤ u) (fact1 : p x = true) (fact2 : ∀(y : α), (q y = true) = (p y = true ∧ ¬y = x)) : NumOf.numof (compose p a) l u = NumOf.numof (compose q a) l u + Int.ofNat (Lean4Why3.map_occ x a l u)
  := sorry
end verifythis_2021_shearsort_ShearSort_numoff_occqtvc
