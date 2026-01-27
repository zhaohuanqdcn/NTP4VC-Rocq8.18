import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge0_Top_deleteqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom str : Type
axiom inhabited_axiom_str : Inhabited str
attribute [instance] inhabited_axiom_str
inductive rope where
  | Leaf : List char -> rope
  | Node : ℤ -> rope -> rope -> rope
axiom inhabited_axiom_rope : Inhabited rope
attribute [instance] inhabited_axiom_rope
noncomputable def to_str : rope -> List char
  | (rope.Leaf s) => s
  | (rope.Node x rl rr) => to_str rl ++ to_str rr
noncomputable def valid : rope -> Prop
  | (rope.Leaf x_s) => True
  | (rope.Node wl rl rr) => wl = Int.ofNat (List.length (to_str rl)) ∧ valid rl ∧ valid rr
theorem delete'vc (r : rope) (i : ℤ) (len : ℤ) (fact0 : valid r) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length (to_str r))) (fact3 : (0 : ℤ) ≤ len) (fact4 : len ≤ Int.ofNat (List.length (to_str r)) - i) : valid r ∧ (0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length (to_str r)) ∧ (∀(left1 : rope) (remaining : rope), valid left1 ∧ valid remaining ∧ to_str r = to_str left1 ++ to_str remaining ∧ Int.ofNat (List.length (to_str left1)) = i → ((valid remaining ∧ (0 : ℤ) ≤ len ∧ len ≤ Int.ofNat (List.length (to_str remaining))) ∧ (∀(o1 : rope) (right1 : rope), valid o1 ∧ valid right1 ∧ to_str remaining = to_str o1 ++ to_str right1 ∧ Int.ofNat (List.length (to_str o1)) = len → valid left1 ∧ valid right1)) ∧ (∀(result : rope), (∃(left2 : rope) (right1 : rope), (valid left2 ∧ valid right1 ∧ to_str remaining = to_str left2 ++ to_str right1 ∧ Int.ofNat (List.length (to_str left2)) = len) ∧ valid result ∧ to_str result = to_str left1 ++ to_str right1) → valid result ∧ to_str result = List.take (Int.toNat i) (to_str r) ++ List.drop (Int.toNat (i + len)) (to_str r)))
  := sorry
end verifythis_2024_challenge0_Top_deleteqtvc
