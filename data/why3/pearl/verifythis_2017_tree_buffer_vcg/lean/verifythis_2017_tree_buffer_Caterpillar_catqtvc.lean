import Why3.Base
import pearl.verifythis_2017_tree_buffer_vcg.lean.verifythis_2017_tree_buffer.Spec
open Classical
open Lean4Why3
namespace verifythis_2017_tree_buffer_Caterpillar_catqtvc
theorem cat'vc {α : Type} [Inhabited α] : let o1 : Spec.buf α := Spec.buf.mk (1 : ℤ) ([] : List α); let xs : List α := ([] : List α); Spec.buf.h o1 = (1 : ℤ) ∧ ((0 : ℤ) = Int.ofNat (List.length xs) ∧ Int.ofNat (List.length xs) < (1 : ℤ)) ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ (1 : ℤ) → Spec.take len (xs ++ ([] : List α)) = Spec.take len (Spec.buf.xs o1))
  := sorry
end verifythis_2017_tree_buffer_Caterpillar_catqtvc
