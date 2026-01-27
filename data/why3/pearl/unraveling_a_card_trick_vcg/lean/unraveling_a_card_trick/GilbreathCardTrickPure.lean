import Why3.Base
open Classical
open Lean4Why3
namespace GilbreathCardTrickPure
axiom m : ℤ
axiom m_positive : (0 : ℤ) < m
axiom n : ℤ
axiom n_nonnegative : (0 : ℤ) ≤ n
inductive shuffle { α : Type} : List α -> List α -> List α -> Prop where
 | Shuffle_nil_left (l : List α) : shuffle l ([] : List α) l
 | Shuffle_nil_right (l : List α) : shuffle ([] : List α) l l
 | Shuffle_cons_left (a : List α) (b : List α) (c : List α) (x : α) : shuffle a b c → shuffle (List.cons x a) b (List.cons x c)
 | Shuffle_cons_right (a : List α) (b : List α) (c : List α) (x : α) : shuffle a b c → shuffle a (List.cons x b) (List.cons x c)
noncomputable def suit_ordered (l : List ℤ) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ j ∧ j < m → getElem_i? l (i * m + j) = Option.some j
noncomputable def suit_sorted (l : List ℤ) := (∀(i : ℤ) (v : ℤ), getElem_i? l i = Option.some v → (0 : ℤ) ≤ v ∧ v < m) ∧ (∀(i : ℤ) (j1 : ℤ) (j2 : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ j1 ∧ j1 < m → (0 : ℤ) ≤ j2 ∧ j2 < m → ¬getElem_i? l (i * m + j1) = getElem_i? l (i * m + j2))
axiom gilbreath_card_trick (a : List ℤ) (c : List ℤ) (d : List ℤ) (b : List ℤ) (fact0 : Int.ofNat (List.length a) = n * m) (fact1 : suit_ordered a) (fact2 : a = c ++ d) (fact3 : shuffle c (List.reverse d) b) : suit_sorted b
end GilbreathCardTrickPure
