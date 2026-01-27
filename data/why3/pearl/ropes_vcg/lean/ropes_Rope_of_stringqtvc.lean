import Why3.Base
import pearl.ropes_vcg.lean.ropes.MyString
open Classical
open Lean4Why3
namespace ropes_Rope_of_stringqtvc
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
theorem of_string'vc (s : MyString.char_string) (fact0 : (0 : ℤ) ≤ MyString.length s) : let o1 : ℤ := MyString.length s; (0 : ℤ) ≤ o1 → (∀(result : rope), (if o1 = (0 : ℤ) then result = rope.Emp else let o2 : ℤ := MyString.length s; (0 : ℤ) ≤ o2 ∧ result = rope.Str s (0 : ℤ) o2) → MyString.infix_eqeq (string result) s ∧ inv result)
  := sorry
end ropes_Rope_of_stringqtvc
