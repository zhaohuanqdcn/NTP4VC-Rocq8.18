import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2017_tree_buffer_Spec_take_lemmaqtvc
structure buf (α : Type) where
  h : ℤ
  xs : List α
axiom inhabited_axiom_buf {α : Type} [Inhabited α] : Inhabited (buf α)
attribute [instance] inhabited_axiom_buf
noncomputable def take {α : Type} [Inhabited α] : ℤ -> List α -> List α
  | n, ([] : List α) => ([] : List α)
  | n, (List.cons x xs1) => if n = (0 : ℤ) then ([] : List α) else List.cons x (take (n - (1 : ℤ)) xs1)
noncomputable def add {α : Type} [Inhabited α] (x : α) (b : buf α) := buf.mk (buf.h b) (List.cons x (buf.xs b))
noncomputable def get {α : Type} [Inhabited α] (b : buf α) := take (buf.h b) (buf.xs b)
theorem take_lemma'vc {α : Type} [Inhabited α] (n : ℤ) (l1 : List α) (l2 : List α) (l3 : List α) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ Int.ofNat (List.length l1)) : take n (l1 ++ l2) = take n (l1 ++ l3)
  := sorry
end verifythis_2017_tree_buffer_Spec_take_lemmaqtvc
