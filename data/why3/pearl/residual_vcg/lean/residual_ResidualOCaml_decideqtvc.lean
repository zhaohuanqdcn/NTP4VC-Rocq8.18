import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace residual_ResidualOCaml_decideqtvc
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
axiom ostring : Type
axiom inhabited_axiom_ostring : Inhabited ostring
attribute [instance] inhabited_axiom_ostring
axiom str : ostring -> List char
theorem decide'vc (o1 : BitVec 63) (w : ostring) (r : regexp) (fact0 : BitVec.toInt o1 = Int.ofNat (List.length (str w))) (fact1 : (0 : ℤ) ≤ Int.ofNat (List.length (str w))) : int'63_in_bounds (BitVec.toInt o1 - (1 : ℤ)) ∧ (∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt o1 - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o2 + (1 : ℤ) → mem (List.drop (0 : ℕ) (str w)) r = mem (str w) r ∧ (∀(r' : regexp), (∀(i : BitVec 63), let i1 : ℤ := BitVec.toInt i; ((0 : ℤ) ≤ i1 ∧ i1 ≤ BitVec.toInt o2) ∧ mem (List.drop (Int.toNat i1) (str w)) r' = mem (str w) r → ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < Int.ofNat (List.length (str w))) ∧ (∀(o3 : regexp), (∀(w1 : List char), mem w1 o3 = mem (List.cons ((str w)[Int.toNat (BitVec.toInt i)]!) w1) r') → mem (List.drop (Int.toNat (i1 + (1 : ℤ))) (str w)) o3 = mem (str w) r)) ∧ (mem (List.drop (Int.toNat (BitVec.toInt o2 + (1 : ℤ))) (str w)) r' = mem (str w) r → mem ([] : List char) r' = mem (str w) r))) ∧ (BitVec.toInt o2 + (1 : ℤ) < (0 : ℤ) → mem ([] : List char) r = mem (str w) r))
  := sorry
end residual_ResidualOCaml_decideqtvc
