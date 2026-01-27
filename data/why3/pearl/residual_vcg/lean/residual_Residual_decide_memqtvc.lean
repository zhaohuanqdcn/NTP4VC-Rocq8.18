import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace residual_Residual_decide_memqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom eq : char -> char -> Prop
axiom eq'spec (x : char) (y : char) : eq x y = (x = y)
inductive regexp where
  | Empty : regexp
  | Epsilon : regexp
  | Char : char -> regexp
  | Alt : regexp -> regexp -> regexp
  | Concat : regexp -> regexp -> regexp
  | Star : regexp -> regexp
axiom inhabited_axiom_regexp : Inhabited regexp
attribute [instance] inhabited_axiom_regexp
inductive mem : List char -> regexp -> Prop where
 | mem_eps : mem ([] : List char) regexp.Epsilon
 | mem_char (c : char) : mem [c] (regexp.Char c)
 | mem_altl (w : List char) (r1 : regexp) (r2 : regexp) : mem w r1 → mem w (regexp.Alt r1 r2)
 | mem_altr (w : List char) (r2 : regexp) (r1 : regexp) : mem w r2 → mem w (regexp.Alt r1 r2)
 | mem_concat (w1 : List char) (r1 : regexp) (w2 : List char) (r2 : regexp) : mem w1 r1 → mem w2 r2 → mem (w1 ++ w2) (regexp.Concat r1 r2)
 | mems1 (r : regexp) : mem ([] : List char) (regexp.Star r)
 | mems2 (w1 : List char) (r : regexp) (w2 : List char) : mem w1 r → mem w2 (regexp.Star r) → mem (w1 ++ w2) (regexp.Star r)
theorem decide_mem'vc (w : List char) (r : regexp) : let o1 : ℤ := Int.ofNat (List.length w) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → mem (List.drop (0 : ℕ) w) r = mem w r ∧ (∀(r' : regexp), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ mem (List.drop (Int.toNat i) w) r' = mem w r → (∀(o2 : regexp), (∀(w1 : List char), mem w1 o2 = mem (List.cons (w[Int.toNat i]!) w1) r') → mem (List.drop (Int.toNat (i + (1 : ℤ))) w) o2 = mem w r)) ∧ (mem (List.drop (Int.toNat (o1 + (1 : ℤ))) w) r' = mem w r → mem ([] : List char) r' = mem w r))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → mem ([] : List char) r = mem w r)
  := sorry
end residual_Residual_decide_memqtvc
