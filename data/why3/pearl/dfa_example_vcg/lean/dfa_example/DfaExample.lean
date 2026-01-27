import Why3.Base
open Classical
open Lean4Why3
namespace DfaExample
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
 | mem_altl (w : List char) (r11 : regexp) (r21 : regexp) : mem w r11 → mem w (regexp.Alt r11 r21)
 | mem_altr (w : List char) (r21 : regexp) (r11 : regexp) : mem w r21 → mem w (regexp.Alt r11 r21)
 | mem_concat (w1 : List char) (r11 : regexp) (w2 : List char) (r21 : regexp) : mem w1 r11 → mem w2 r21 → mem (w1 ++ w2) (regexp.Concat r11 r21)
 | mems1 (r : regexp) : mem ([] : List char) (regexp.Star r)
 | mems2 (w1 : List char) (r : regexp) (w2 : List char) : mem w1 r → mem w2 (regexp.Star r) → mem (w1 ++ w2) (regexp.Star r)
axiom stream : Type
axiom inhabited_axiom_stream : Inhabited stream
attribute [instance] inhabited_axiom_stream
axiom state : stream -> List char
end DfaExample
