import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge0_Top_splitqtvc
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
theorem split'vc (r : rope) (i : ℤ) (fact0 : valid r) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ Int.ofNat (List.length (to_str r))) : (match r with | rope.Leaf s => (0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length s) | rope.Node wl rl rr => (if i < wl then ((match r with | rope.Leaf _ => False | rope.Node _ f f1 => f = rl ∨ f1 = rl) ∧ valid rl ∧ (0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length (to_str rl))) ∧ (∀(rll : rope) (rlr : rope), valid rll ∧ valid rlr ∧ to_str rl = to_str rll ++ to_str rlr ∧ Int.ofNat (List.length (to_str rll)) = i → valid rlr ∧ valid rr) else wl < i → (let o1 : ℤ := i - wl; ((match r with | rope.Leaf _ => False | rope.Node _ f f1 => f = rr ∨ f1 = rr) ∧ valid rr ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length (to_str rr))) ∧ (∀(rrl : rope) (rrr : rope), valid rrl ∧ valid rrr ∧ to_str rr = to_str rrl ++ to_str rrr ∧ Int.ofNat (List.length (to_str rrl)) = o1 → valid rl ∧ valid rrl)))) ∧ (∀(left1 : rope) (right1 : rope), (match r with | rope.Leaf s => left1 = rope.Leaf (List.take (Int.toNat i) s) ∧ right1 = rope.Leaf (List.drop (Int.toNat i) s) | rope.Node wl rl rr => (if i < wl then ∃(right2 : rope), (valid left1 ∧ valid right2 ∧ to_str rl = to_str left1 ++ to_str right2 ∧ Int.ofNat (List.length (to_str left1)) = i) ∧ valid right1 ∧ to_str right1 = to_str right2 ++ to_str rr else if wl < i then ∃(left2 : rope), (valid left2 ∧ valid right1 ∧ to_str rr = to_str left2 ++ to_str right1 ∧ Int.ofNat (List.length (to_str left2)) = i - wl) ∧ valid left1 ∧ to_str left1 = to_str rl ++ to_str left2 else left1 = rl ∧ right1 = rr)) → valid left1 ∧ valid right1 ∧ to_str r = to_str left1 ++ to_str right1 ∧ Int.ofNat (List.length (to_str left1)) = i)
  := sorry
end verifythis_2024_challenge0_Top_splitqtvc
