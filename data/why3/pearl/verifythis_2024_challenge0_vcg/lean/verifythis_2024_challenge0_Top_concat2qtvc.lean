import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge0_Top_concat2qtvc
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
axiom is_short : List char -> Prop
theorem concat2'vc (left1 : rope) (right1 : rope) (fact0 : valid left1) (fact1 : valid right1) : (match right1 with | rope.Leaf sr => (if is_short sr then match left1 with | rope.Leaf sl => ¬is_short sl → valid left1 ∧ valid right1 | rope.Node wl rl (rope.Leaf sl) => ¬is_short sl → valid left1 ∧ valid right1 | _ => valid left1 ∧ valid right1 else valid left1 ∧ valid right1) | _ => valid left1 ∧ valid right1) ∧ (∀(result : rope), (match right1 with | rope.Leaf sr => (if is_short sr then match left1 with | rope.Leaf sl => (if is_short sl then let o1 : List char := sl ++ sr; (Int.ofNat (List.length o1) = Int.ofNat (List.length sl) + Int.ofNat (List.length sr) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length sl) → o1[Int.toNat i]! = sl[Int.toNat i]!) ∧ (∀(i : ℤ), Int.ofNat (List.length sl) ≤ i ∧ i < Int.ofNat (List.length o1) → o1[Int.toNat i]! = sr[Int.toNat (i - Int.ofNat (List.length sl))]!)) ∧ result = rope.Leaf o1 else valid result ∧ to_str result = to_str left1 ++ to_str right1) | rope.Node wl rl (rope.Leaf sl) => (if is_short sl then let o1 : List char := sl ++ sr; (Int.ofNat (List.length o1) = Int.ofNat (List.length sl) + Int.ofNat (List.length sr) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length sl) → o1[Int.toNat i]! = sl[Int.toNat i]!) ∧ (∀(i : ℤ), Int.ofNat (List.length sl) ≤ i ∧ i < Int.ofNat (List.length o1) → o1[Int.toNat i]! = sr[Int.toNat (i - Int.ofNat (List.length sl))]!)) ∧ result = rope.Node wl rl (rope.Leaf o1) else valid result ∧ to_str result = to_str left1 ++ to_str right1) | _ => valid result ∧ to_str result = to_str left1 ++ to_str right1 else valid result ∧ to_str result = to_str left1 ++ to_str right1) | _ => valid result ∧ to_str result = to_str left1 ++ to_str right1) → valid result ∧ to_str result = to_str left1 ++ to_str right1)
  := sorry
end verifythis_2024_challenge0_Top_concat2qtvc
