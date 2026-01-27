import Why3.Base
import Why3.map.MapInjection
open Classical
open Lean4Why3
namespace vacid_0_sparse_array_SparseArray_permutationqtvc
axiom sparse_array : Type -> Type
axiom inhabited_axiom_sparse_array {α : Type} [Inhabited α] : Inhabited (sparse_array α)
attribute [instance] inhabited_axiom_sparse_array
axiom values :  {α : Type} -> [Inhabited α] -> sparse_array α -> List α
axiom index :  {α : Type} -> [Inhabited α] -> sparse_array α -> List ℤ
axiom back :  {α : Type} -> [Inhabited α] -> sparse_array α -> List ℤ
axiom card :  {α : Type} -> [Inhabited α] -> sparse_array α -> ℤ
axiom def1 :  {α : Type} -> [Inhabited α] -> sparse_array α -> α
axiom sparse_array'invariant {α : Type} [Inhabited α] (self : sparse_array α) : (0 : ℤ) ≤ card self ∧ card self ≤ Int.ofNat (List.length (values self)) ∧ Int.ofNat (List.length (values self)) ≤ (1000 : ℤ) ∧ List.length (values self) = List.length (index self) ∧ List.length (index self) = List.length (back self) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < card self → ((0 : ℤ) ≤ (back self)[Int.toNat i]! ∧ (back self)[Int.toNat i]! < Int.ofNat (List.length (values self))) ∧ (index self)[Int.toNat ((back self)[Int.toNat i]!)]! = i)
noncomputable def sparse_array'eq {α : Type} [Inhabited α] (a : sparse_array α) (b : sparse_array α) := values a = values b ∧ index a = index b ∧ back a = back b ∧ card a = card b ∧ def1 a = def1 b
axiom sparse_array'inj {α : Type} [Inhabited α] (a : sparse_array α) (b : sparse_array α) (fact0 : sparse_array'eq a b) : a = b
noncomputable def is_elt {α : Type} [Inhabited α] (a : sparse_array α) (i : ℤ) := ((0 : ℤ) ≤ (index a)[Int.toNat i]! ∧ (index a)[Int.toNat i]! < card a) ∧ (back a)[Int.toNat ((index a)[Int.toNat i]!)]! = i
noncomputable def value {α : Type} [Inhabited α] (a : sparse_array α) (i : ℤ) := if is_elt a i then (values a)[Int.toNat i]! else def1 a
noncomputable def length {α : Type} [Inhabited α] (a : sparse_array α) := Int.ofNat (List.length (values a))
theorem permutation'vc {α : Type} [Inhabited α] (a : sparse_array α) (i : ℤ) (fact0 : (0 : ℤ) ≤ card a) (fact1 : card a ≤ Int.ofNat (List.length (values a))) (fact2 : Int.ofNat (List.length (values a)) ≤ (1000 : ℤ)) (fact3 : List.length (values a) = List.length (index a)) (fact4 : List.length (index a) = List.length (back a)) (fact5 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < card a → ((0 : ℤ) ≤ (back a)[Int.toNat i]! ∧ (back a)[Int.toNat i]! < Int.ofNat (List.length (values a))) ∧ (index a)[Int.toNat ((back a)[Int.toNat i]!)]! = i) (fact6 : card a = length a) (fact7 : (0 : ℤ) ≤ i) (fact8 : i < length a) : is_elt a i
  := sorry
end vacid_0_sparse_array_SparseArray_permutationqtvc
