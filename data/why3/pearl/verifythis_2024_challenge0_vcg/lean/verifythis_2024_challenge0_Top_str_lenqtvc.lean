import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge0_Top_str_lenqtvc
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
theorem str_len'vc (r : rope) (fact0 : valid r) : (match r with | rope.Leaf s => True | rope.Node wl _ rr => (match r with | rope.Leaf _ => False | rope.Node _ f f1 => f = rr ∨ f1 = rr) ∧ valid rr) ∧ (∀(result : ℤ), (match r with | rope.Leaf s => result = Int.ofNat (List.length s) | rope.Node wl _ rr => result = wl + Int.ofNat (List.length (to_str rr))) → result = Int.ofNat (List.length (to_str r)))
  := sorry
end verifythis_2024_challenge0_Top_str_lenqtvc
