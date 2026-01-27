import Why3.Base
import pearl.ropes_vcg.lean.ropes.MyString
open Classical
open Lean4Why3
namespace ropes_Rope_subqtvc
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
theorem sub'vc (r : rope) (len : ℤ) (ofs : ℤ) (fact0 : inv r) (fact1 : (0 : ℤ) ≤ len) (fact2 : (0 : ℤ) ≤ ofs) (fact3 : ofs ≤ length r) (fact4 : ofs + len ≤ length r) : (match r with | rope.Emp => True | rope.Str s ofs' _ => True | rope.App r1 r2 _ => (let left1 : ℤ := length r1 - ofs; let right1 : ℤ := len - left1; if right1 ≤ (0 : ℤ) then (match r with | rope.Emp => False | rope.Str _ _ _ => False | rope.App f f1 _ => f = r1 ∨ f1 = r1) ∧ inv r1 ∧ (0 : ℤ) ≤ len ∧ ((0 : ℤ) ≤ ofs ∧ ofs ≤ length r1) ∧ ofs + len ≤ length r1 else if left1 ≤ (0 : ℤ) then let o1 : ℤ := -left1; (match r with | rope.Emp => False | rope.Str _ _ _ => False | rope.App f f1 _ => f = r2 ∨ f1 = r2) ∧ inv r2 ∧ (0 : ℤ) ≤ len ∧ ((0 : ℤ) ≤ o1 ∧ o1 ≤ length r2) ∧ o1 + len ≤ length r2 else ((match r with | rope.Emp => False | rope.Str _ _ _ => False | rope.App f f1 _ => f = r2 ∨ f1 = r2) ∧ inv r2 ∧ (0 : ℤ) ≤ right1 ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ length r2) ∧ (0 : ℤ) + right1 ≤ length r2) ∧ (∀(o1 : rope), inv o1 ∧ MyString.infix_eqeq (string o1) (MyString.sub (string r2) (0 : ℤ) right1) → ((match r with | rope.Emp => False | rope.Str _ _ _ => False | rope.App f f1 _ => f = r1 ∨ f1 = r1) ∧ inv r1 ∧ (0 : ℤ) ≤ left1 ∧ ((0 : ℤ) ≤ ofs ∧ ofs ≤ length r1) ∧ ofs + left1 ≤ length r1) ∧ (∀(o2 : rope), inv o2 ∧ MyString.infix_eqeq (string o2) (MyString.sub (string r1) ofs left1) → inv o2 ∧ inv o1)))) ∧ (∀(result : rope), (match r with | rope.Emp => result = rope.Emp | rope.Str s ofs' _ => (if len = (0 : ℤ) then result = rope.Emp else result = rope.Str s (ofs' + ofs) len) | rope.App r1 r2 _ => (let left1 : ℤ := length r1 - ofs; let right1 : ℤ := len - left1; if right1 ≤ (0 : ℤ) then inv result ∧ MyString.infix_eqeq (string result) (MyString.sub (string r1) ofs len) else if left1 ≤ (0 : ℤ) then inv result ∧ MyString.infix_eqeq (string result) (MyString.sub (string r2) (-left1) len) else ∃(o1 : rope), (inv o1 ∧ MyString.infix_eqeq (string o1) (MyString.sub (string r2) (0 : ℤ) right1)) ∧ (∃(o2 : rope), (inv o2 ∧ MyString.infix_eqeq (string o2) (MyString.sub (string r1) ofs left1)) ∧ inv result ∧ MyString.infix_eqeq (string result) (MyString.app (string o2) (string o1))))) → inv result ∧ MyString.infix_eqeq (string result) (MyString.sub (string r) ofs len))
  := sorry
end ropes_Rope_subqtvc
