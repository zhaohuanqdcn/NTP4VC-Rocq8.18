import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace schorr_waite_SchorrWaite_trans_pathqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom stacknodes : Type
axiom inhabited_axiom_stacknodes : Inhabited stacknodes
attribute [instance] inhabited_axiom_stacknodes
noncomputable def not_in_stack (n : loc) (s : List loc) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → ¬n = s[Int.toNat i]!
noncomputable def last (s : List loc) := s[Int.toNat (Int.ofNat (List.length s) - (1 : ℤ))]!
noncomputable def distinct (s : List loc) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length s) → ¬i = j → ¬s[Int.toNat i]! = s[Int.toNat j]!
noncomputable def edge (x : loc) (y : loc) (left1 : loc -> loc) (right1 : loc -> loc) := ¬x = null ∧ (left1 x = y ∨ right1 x = y)
inductive path : (loc -> loc) -> (loc -> loc) -> loc -> loc -> List loc -> Prop where
 | path_nil (l : loc -> loc) (r : loc -> loc) (x : loc) : path l r x x ([] : List loc)
 | path_cons (x : loc) (z : loc) (l : loc -> loc) (r : loc -> loc) (y : loc) (p : List loc) : edge x z l r → path l r z y p → path l r x y (List.cons x p)
theorem trans_path'vc (l : loc -> loc) (r : loc -> loc) (x : loc) (y : loc) (p1 : List loc) (z : loc) (p2 : List loc) (fact0 : path l r x y p1) (fact1 : path l r y z p2) : path l r x z (p1 ++ p2)
  := sorry
end schorr_waite_SchorrWaite_trans_pathqtvc
