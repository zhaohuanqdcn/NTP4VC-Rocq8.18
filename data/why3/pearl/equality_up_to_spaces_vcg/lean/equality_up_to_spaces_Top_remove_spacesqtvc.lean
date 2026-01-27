import Why3.Base
open Classical
open Lean4Why3
namespace equality_up_to_spaces_Top_remove_spacesqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom space : char
axiom eq : char -> char -> Bool
axiom eq'spec (x : char) (y : char) : (eq x y = true) = (x = y)
axiom char_string : Type
axiom inhabited_axiom_char_string : Inhabited char_string
attribute [instance] inhabited_axiom_char_string
theorem remove_spaces'vc (s : List char) (fact0 : ¬Int.ofNat (List.length s) = (0 : ℤ)) : let o1 : char := space; let o2 : char := s[(0 : ℕ)]!; (eq o2 o1 = true) = (o2 = o1) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length s)) ∧ (0 : ℤ) ≤ Int.ofNat (List.length s) ∧ List.length (List.drop (1 : ℕ) s) < List.length s
  := sorry
end equality_up_to_spaces_Top_remove_spacesqtvc
