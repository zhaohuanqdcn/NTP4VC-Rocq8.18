import Why3.Base
import pearl.ropes_vcg.lean.ropes.MyString
open Classical
open Lean4Why3
namespace ropes_Rope_getqtvc
inductive rope where
  | Emp : rope
  | Str : MyString.char_string -> ℤ -> ℤ -> rope
  | App : rope -> rope -> ℤ -> rope
axiom inhabited_axiom_rope : Inhabited rope
attribute [instance] inhabited_axiom_rope
noncomputable def length (r : rope) := match r with | rope.Emp => (0 : ℤ) | rope.Str _ _ len => len | rope.App _ _ len => len
noncomputable def inv : rope -> Prop
  | rope.Emp => True
  | (rope.Str s ofs len) => (0 : ℤ) < len ∧ ((0 : ℤ) ≤ ofs ∧ ofs < MyString.length s) ∧ ofs + len ≤ MyString.length s
  | (rope.App l r1 len) => (0 : ℤ) < length l ∧ inv l ∧ (0 : ℤ) < length r1 ∧ inv r1 ∧ len = length l + length r1
noncomputable def string : rope -> MyString.char_string
  | rope.Emp => MyString.empty
  | (rope.Str s ofs len) => MyString.sub s ofs len
  | (rope.App l r1 x) => MyString.app (string l) (string r1)
axiom empty : rope
axiom empty'def : length empty = (0 : ℤ) ∧ inv empty ∧ MyString.infix_eqeq (string empty) MyString.empty
theorem get'vc (r : rope) (i : ℤ) (fact0 : inv r) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < length r) : (match r with | rope.Emp => False | rope.Str s ofs _ => (let o1 : ℤ := ofs + i; (0 : ℤ) ≤ o1 ∧ o1 < MyString.length s) | rope.App left1 right1 _ => (let n : ℤ := length left1; if i < n then (match r with | rope.Emp => False | rope.Str _ _ _ => False | rope.App f f1 _ => f = left1 ∨ f1 = left1) ∧ inv left1 ∧ (0 : ℤ) ≤ i ∧ i < length left1 else let o1 : ℤ := i - n; (match r with | rope.Emp => False | rope.Str _ _ _ => False | rope.App f f1 _ => f = right1 ∨ f1 = right1) ∧ inv right1 ∧ (0 : ℤ) ≤ o1 ∧ o1 < length right1)) ∧ (∀(result : MyString.char), (match r with | rope.Emp => False | rope.Str s ofs _ => result = MyString.mixfix_lbrb s (ofs + i) | rope.App left1 right1 _ => (let n : ℤ := length left1; if i < n then result = MyString.mixfix_lbrb (string left1) i else result = MyString.mixfix_lbrb (string right1) (i - n))) → result = MyString.mixfix_lbrb (string r) i)
  := sorry
end ropes_Rope_getqtvc
