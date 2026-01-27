import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace fenwick_Fenwick_fen_compactqtvc
structure fenwick where
  t : List ℤ
  leaves : ℤ
axiom inhabited_axiom_fenwick : Inhabited fenwick
attribute [instance] inhabited_axiom_fenwick
noncomputable def valid (f : fenwick) := (0 : ℤ) ≤ fenwick.leaves f ∧ Int.ofNat (List.length (fenwick.t f)) = (if fenwick.leaves f = (0 : ℤ) then (0 : ℤ) else (2 : ℤ) * fenwick.leaves f - (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < fenwick.leaves f - (1 : ℤ) → (fenwick.t f)[Int.toNat i]! = (fenwick.t f)[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]! + (fenwick.t f)[Int.toNat ((2 : ℤ) * i + (2 : ℤ))]!)
noncomputable def get (f : fenwick) (i : ℤ) := (fenwick.t f)[Int.toNat (i + fenwick.leaves f - (1 : ℤ))]!
axiom get_closure : fenwick -> ℤ -> ℤ
axiom get_closure_def (y : fenwick) (y1 : ℤ) : get_closure y y1 = get y y1
noncomputable def rget (f : fenwick) (a : ℤ) (b : ℤ) := int.Sum.sum (get_closure f) a b
axiom mixfix_lbrb_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom mixfix_lbrb_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : mixfix_lbrb_closure y y1 = y[Int.toNat y1]!
theorem fen_compact'vc (a : ℤ) (b : ℤ) (f : fenwick) (fact0 : (0 : ℤ) ≤ a) (fact1 : a ≤ b) (fact2 : (2 : ℤ) * b < Int.ofNat (List.length (fenwick.t f))) (fact3 : valid f) : int.Sum.sum (mixfix_lbrb_closure (fenwick.t f)) a b = int.Sum.sum (mixfix_lbrb_closure (fenwick.t f)) ((2 : ℤ) * a + (1 : ℤ)) ((2 : ℤ) * b + (1 : ℤ))
  := sorry
end fenwick_Fenwick_fen_compactqtvc
