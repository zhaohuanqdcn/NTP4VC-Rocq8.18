import Why3.Base
import pearl.ropes_vcg.lean.ropes.MyString
open Classical
open Lean4Why3
namespace ropes_Rope_emptyqtvc
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
theorem empty'vc : let result : rope := rope.Emp; length result = (0 : ℤ) ∧ inv result ∧ MyString.infix_eqeq (string result) MyString.empty
  := sorry
end ropes_Rope_emptyqtvc
