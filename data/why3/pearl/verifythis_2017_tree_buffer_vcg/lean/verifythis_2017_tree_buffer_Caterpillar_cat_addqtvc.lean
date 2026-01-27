import Why3.Base
import pearl.verifythis_2017_tree_buffer_vcg.lean.verifythis_2017_tree_buffer.Spec
open Classical
open Lean4Why3
namespace verifythis_2017_tree_buffer_Caterpillar_cat_addqtvc
axiom cat : Type -> Type
axiom inhabited_axiom_cat {α : Type} [Inhabited α] : Inhabited (cat α)
attribute [instance] inhabited_axiom_cat
axiom ch :  {α : Type} -> [Inhabited α] -> cat α -> ℤ
axiom xs :  {α : Type} -> [Inhabited α] -> cat α -> List α
axiom xs_len :  {α : Type} -> [Inhabited α] -> cat α -> ℤ
axiom ys :  {α : Type} -> [Inhabited α] -> cat α -> List α
axiom b :  {α : Type} -> [Inhabited α] -> cat α -> Spec.buf α
axiom cat'invariant {α : Type} [Inhabited α] (self : cat α) : Spec.buf.h (b self) = ch self ∧ xs_len self = Int.ofNat (List.length (xs self)) ∧ Int.ofNat (List.length (xs self)) < ch self ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ ch self → Spec.take len (xs self ++ ys self) = Spec.take len (Spec.buf.xs (b self)))
noncomputable def cat'eq {α : Type} [Inhabited α] (a : cat α) (b1 : cat α) := ch a = ch b1 ∧ xs a = xs b1 ∧ xs_len a = xs_len b1 ∧ ys a = ys b1 ∧ b a = b b1
axiom cat'inj {α : Type} [Inhabited α] (a : cat α) (b1 : cat α) (fact0 : cat'eq a b1) : a = b1
theorem cat_add'vc {α : Type} [Inhabited α] (c : cat α) (x : α) : let o1 : ℤ := ch c - (1 : ℤ); let o2 : ℤ := xs_len c; (if o2 = o1 then let o3 : Spec.buf α := Spec.add x (b c); let o4 : List α := ([] : List α); let o5 : ℤ := ch c; Spec.buf.h o3 = o5 ∧ ((0 : ℤ) = Int.ofNat (List.length o4) ∧ Int.ofNat (List.length o4) < o5) ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ o5 → Spec.take len (o4 ++ List.cons x (xs c)) = Spec.take len (Spec.buf.xs o3)) else let o3 : Spec.buf α := Spec.add x (b c); let o4 : List α := List.cons x (xs c); let o5 : ℤ := ch c; Spec.buf.h o3 = o5 ∧ ((1 : ℤ) + xs_len c = Int.ofNat (List.length o4) ∧ Int.ofNat (List.length o4) < o5) ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ o5 → Spec.take len (o4 ++ ys c) = Spec.take len (Spec.buf.xs o3))) ∧ (∀(result : cat α), (if o2 = o1 then ch result = ch c ∧ xs result = ([] : List α) ∧ xs_len result = (0 : ℤ) ∧ ys result = List.cons x (xs c) ∧ b result = Spec.add x (b c) else ch result = ch c ∧ xs result = List.cons x (xs c) ∧ xs_len result = (1 : ℤ) + xs_len c ∧ ys result = ys c ∧ b result = Spec.add x (b c)) → b result = Spec.add x (b c))
  := sorry
end verifythis_2017_tree_buffer_Caterpillar_cat_addqtvc
