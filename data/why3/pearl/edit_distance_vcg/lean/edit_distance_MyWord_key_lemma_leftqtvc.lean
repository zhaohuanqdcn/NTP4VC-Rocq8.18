import Why3.Base
open Classical
open Lean4Why3
namespace edit_distance_MyWord_key_lemma_leftqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
inductive dist : List char -> List char -> ℤ -> Prop where
 | dist_eps : dist ([] : List char) ([] : List char) (0 : ℤ)
 | dist_add_left (w1 : List char) (w2 : List char) (n : ℤ) (a : char) : dist w1 w2 n → dist (List.cons a w1) w2 (n + (1 : ℤ))
 | dist_add_right (w1 : List char) (w2 : List char) (n : ℤ) (a : char) : dist w1 w2 n → dist w1 (List.cons a w2) (n + (1 : ℤ))
 | dist_context (w1 : List char) (w2 : List char) (n : ℤ) (a : char) : dist w1 w2 n → dist (List.cons a w1) (List.cons a w2) n
noncomputable def min_dist (w1 : List char) (w2 : List char) (n : ℤ) := dist w1 w2 n ∧ (∀(m : ℤ), dist w1 w2 m → n ≤ m)
noncomputable def last_char : char -> List char -> char
  | a, ([] : List char) => a
  | a, (List.cons c u') => last_char c u'
noncomputable def but_last : char -> List char -> List char
  | a, ([] : List char) => ([] : List char)
  | a, (List.cons c u') => List.cons a (but_last c u')
theorem key_lemma_left'vc (a : char) (w1 : List char) (w2 : List char) (m : ℤ) (fact0 : dist (List.cons a w1) w2 m) : ∃(u2 : List char) (v2 : List char) (k : ℤ), w2 = u2 ++ v2 ∧ dist w1 v2 k ∧ k + Int.ofNat (List.length u2) ≤ m + (1 : ℤ)
  := sorry
end edit_distance_MyWord_key_lemma_leftqtvc
