import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace equality_up_to_spaces_Top_compare_up_to_spacesqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom space : char
axiom eq : char -> char -> Bool
axiom eq'spec (x : char) (y : char) : (eq x y = true) = (x = y)
axiom char_string : Type
axiom inhabited_axiom_char_string : Inhabited char_string
attribute [instance] inhabited_axiom_char_string
axiom remove_spaces : List char -> List char
axiom remove_spaces'def (s : List char) : if Int.ofNat (List.length s) = (0 : ℤ) then remove_spaces s = s else if eq (s[(0 : ℕ)]!) space = true then remove_spaces s = remove_spaces (List.drop (1 : ℕ) s) else remove_spaces s = List.cons (s[(0 : ℕ)]!) (remove_spaces (List.drop (1 : ℕ) s))
theorem compare_up_to_spaces'vc (x : List char) (y : List char) : let n : ℤ := Int.ofNat (List.length x); let m : ℤ := Int.ofNat (List.length y); (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ n) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ m) ∧ (remove_spaces x = remove_spaces y) = (remove_spaces (List.drop (0 : ℕ) x) = remove_spaces (List.drop (0 : ℕ) y))) ∧ (∀(j : ℤ) (i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ n) ∧ ((0 : ℤ) ≤ j ∧ j ≤ m) ∧ (remove_spaces x = remove_spaces y) = (remove_spaces (List.drop (Int.toNat i) x) = remove_spaces (List.drop (Int.toNat j) y)) → (∀(o1 : Bool), (if i < n then o1 = true else o1 = (if j < m then true else false)) → (if o1 = true then ∀(o2 : Bool), (if i < n then let o3 : char := space; let o4 : char := x[Int.toNat i]!; o2 = eq o4 o3 ∧ (o2 = true) = (o4 = o3) else o2 = false) → (if o2 = true then ((0 : ℤ) ≤ n - i + m - j ∧ n - (i + (1 : ℤ)) + m - j < n - i + m - j) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ n) ∧ ((0 : ℤ) ≤ j ∧ j ≤ m) ∧ (remove_spaces x = remove_spaces y) = (remove_spaces (List.drop (Int.toNat (i + (1 : ℤ))) x) = remove_spaces (List.drop (Int.toNat j) y)) else ∀(o3 : Bool), (if j < m then let o4 : char := space; let o5 : char := y[Int.toNat j]!; o3 = eq o5 o4 ∧ (o3 = true) = (o5 = o4) else o3 = false) → (if o3 = true then ((0 : ℤ) ≤ n - i + m - j ∧ n - i + m - (j + (1 : ℤ)) < n - i + m - j) ∧ ((0 : ℤ) ≤ i ∧ i ≤ n) ∧ ((0 : ℤ) ≤ j + (1 : ℤ) ∧ j + (1 : ℤ) ≤ m) ∧ (remove_spaces x = remove_spaces y) = (remove_spaces (List.drop (Int.toNat i) x) = remove_spaces (List.drop (Int.toNat (j + (1 : ℤ))) y)) else ∀(o4 : Bool), (if i = n then o4 = true else o4 = (if j = m then true else false)) → (if o4 = true then ¬remove_spaces x = remove_spaces y else let o5 : char := y[Int.toNat j]!; let o6 : char := x[Int.toNat i]!; let o7 : Bool := eq o6 o5; (o7 = true) = (o6 = o5) → (if ¬o7 = true then ¬remove_spaces x = remove_spaces y else ((0 : ℤ) ≤ n - i + m - j ∧ n - (i + (1 : ℤ)) + m - (j + (1 : ℤ)) < n - i + m - j) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ n) ∧ ((0 : ℤ) ≤ j + (1 : ℤ) ∧ j + (1 : ℤ) ≤ m) ∧ (remove_spaces x = remove_spaces y) = (remove_spaces (List.drop (Int.toNat (i + (1 : ℤ))) x) = remove_spaces (List.drop (Int.toNat (j + (1 : ℤ))) y)))))) else remove_spaces x = remove_spaces y)))
  := sorry
end equality_up_to_spaces_Top_compare_up_to_spacesqtvc
