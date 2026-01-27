import Why3.Base
open Classical
open Lean4Why3
namespace array_of_list_Top_lengthqtvc
theorem length'vc {α : Type} [Inhabited α] (l : List α) : (match l with | ([] : List α) => True | List.cons _ l1 => (match l with | ([] : List α) => False | List.cons _ f => f = l1)) ∧ (∀(result : ℕ), (match l with | ([] : List α) => result = (0 : ℕ) | List.cons _ l1 => (∃(o1 : ℕ), o1 = List.length l1 ∧ Int.ofNat result = Int.ofNat o1 + (1 : ℤ))) → result = List.length l)
  := sorry
end array_of_list_Top_lengthqtvc
