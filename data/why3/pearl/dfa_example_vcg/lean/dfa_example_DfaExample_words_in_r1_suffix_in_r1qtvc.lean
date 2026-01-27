import Why3.Base
open Classical
open Lean4Why3
namespace dfa_example_DfaExample_words_in_r1_suffix_in_r1qtvc
inductive char where
  | Zero : char
  | One : char
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
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
axiom stream : Type
axiom inhabited_axiom_stream : Inhabited stream
attribute [instance] inhabited_axiom_stream
axiom state : stream -> List char
theorem words_in_r1_suffix_in_r1'vc (c : char) (c' : char) (w : List char) (fact0 : mem (List.cons c (List.cons c' w)) (regexp.Concat (regexp.Star (regexp.Alt (regexp.Char char.Zero) (regexp.Char char.One))) (regexp.Char char.One))) : mem (List.cons c' w) (regexp.Concat (regexp.Star (regexp.Alt (regexp.Char char.Zero) (regexp.Char char.One))) (regexp.Char char.One))
  := sorry
end dfa_example_DfaExample_words_in_r1_suffix_in_r1qtvc
