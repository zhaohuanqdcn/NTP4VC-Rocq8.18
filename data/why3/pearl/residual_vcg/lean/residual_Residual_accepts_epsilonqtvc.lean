import Why3.Base
open Classical
open Lean4Why3
namespace residual_Residual_accepts_epsilonqtvc
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
theorem accepts_epsilon'vc (r : regexp) : (match r with | regexp.Empty => True | regexp.Epsilon => True | regexp.Char _ => True | regexp.Alt r1 r2 => (match r with | regexp.Empty => False | regexp.Epsilon => False | regexp.Char _ => False | regexp.Alt f f1 => f = r1 ∨ f1 = r1 | regexp.Concat f f1 => f = r1 ∨ f1 = r1 | regexp.Star f => f = r1) ∧ (¬mem ([] : List char) r1 → (match r with | regexp.Empty => False | regexp.Epsilon => False | regexp.Char _ => False | regexp.Alt f f1 => f = r2 ∨ f1 = r2 | regexp.Concat f f1 => f = r2 ∨ f1 = r2 | regexp.Star f => f = r2)) | regexp.Concat r1 r2 => (match r with | regexp.Empty => False | regexp.Epsilon => False | regexp.Char _ => False | regexp.Alt f f1 => f = r1 ∨ f1 = r1 | regexp.Concat f f1 => f = r1 ∨ f1 = r1 | regexp.Star f => f = r1) ∧ (mem ([] : List char) r1 → (match r with | regexp.Empty => False | regexp.Epsilon => False | regexp.Char _ => False | regexp.Alt f f1 => f = r2 ∨ f1 = r2 | regexp.Concat f f1 => f = r2 ∨ f1 = r2 | regexp.Star f => f = r2)) | regexp.Star _ => True) ∧ (∀(result : Bool), (match r with | regexp.Empty => result = false | regexp.Epsilon => result = true | regexp.Char _ => result = false | regexp.Alt r1 r2 => (if mem ([] : List char) r1 then result = true else result = (if mem ([] : List char) r2 then true else false)) | regexp.Concat r1 r2 => (if mem ([] : List char) r1 then result = (if mem ([] : List char) r2 then true else false) else result = false) | regexp.Star _ => result = true) → (result = true) = mem ([] : List char) r)
  := sorry
end residual_Residual_accepts_epsilonqtvc
