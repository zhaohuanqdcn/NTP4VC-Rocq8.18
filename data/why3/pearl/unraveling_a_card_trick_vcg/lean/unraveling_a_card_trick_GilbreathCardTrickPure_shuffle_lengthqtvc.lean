import Why3.Base
open Classical
open Lean4Why3
namespace unraveling_a_card_trick_GilbreathCardTrickPure_shuffle_lengthqtvc
axiom m : ℤ
axiom m_positive : (0 : ℤ) < m
axiom n : ℤ
axiom n_nonnegative : (0 : ℤ) ≤ n
inductive shuffle { α : Type} : List α -> List α -> List α -> Prop where
 | Shuffle_nil_left (l : List α) : shuffle l ([] : List α) l
 | Shuffle_nil_right (l : List α) : shuffle ([] : List α) l l
 | Shuffle_cons_left (a : List α) (b : List α) (c : List α) (x : α) : shuffle a b c → shuffle (List.cons x a) b (List.cons x c)
 | Shuffle_cons_right (a : List α) (b : List α) (c : List α) (x : α) : shuffle a b c → shuffle a (List.cons x b) (List.cons x c)
theorem shuffle_length'vc {α : Type} [Inhabited α] (a : List α) (b : List α) (c : List α) (fact0 : shuffle a b c) : Int.ofNat (List.length a) + Int.ofNat (List.length b) = Int.ofNat (List.length c)
  := sorry
end unraveling_a_card_trick_GilbreathCardTrickPure_shuffle_lengthqtvc
