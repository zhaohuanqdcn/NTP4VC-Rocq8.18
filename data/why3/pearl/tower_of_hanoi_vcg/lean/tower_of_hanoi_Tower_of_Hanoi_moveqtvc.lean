import Why3.Base
open Classical
open Lean4Why3
namespace tower_of_hanoi_Tower_of_Hanoi_moveqtvc
inductive sorted : List ℤ -> Prop where
 | Sorted_Nil : sorted ([] : List ℤ)
 | Sorted_One (x : ℤ) : sorted (List.cons x ([] : List ℤ))
 | Sorted_Two (x : ℤ) (y : ℤ) (l : List ℤ) : x < y → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x < y) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List ℤ) (l2 : List ℤ) : (sorted l1 ∧ sorted l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x < y)) = sorted (l1 ++ l2)
inductive sorted1 : List ℤ -> Prop where
 | Sorted_Nil1 : sorted1 ([] : List ℤ)
 | Sorted_One1 (x : ℤ) : sorted1 (List.cons x ([] : List ℤ))
 | Sorted_Two1 (y : ℤ) (x : ℤ) (l : List ℤ) : y < x → sorted1 (List.cons y l) → sorted1 (List.cons x (List.cons y l))
axiom sorted_mem1 (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → y < x) ∧ sorted1 l) = sorted1 (List.cons x l)
axiom sorted_append1 (l1 : List ℤ) (l2 : List ℤ) : (sorted1 l1 ∧ sorted1 l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → y < x)) = sorted1 (l1 ++ l2)
noncomputable def compat (s : List ℤ) (t : List ℤ) := match (s, t) with | (List.cons x _, List.cons y _) => x < y | (_, _) => True
axiom rev_append_sorted_incr (s : List ℤ) (t : List ℤ) : sorted (List.reverse s ++ t) = (sorted1 s ∧ sorted t ∧ compat s t)
axiom rev_append_sorted_decr (s : List ℤ) (t : List ℤ) : sorted1 (List.reverse s ++ t) = (sorted s ∧ sorted1 t ∧ compat t s)
axiom tower : Type
axiom inhabited_axiom_tower : Inhabited tower
attribute [instance] inhabited_axiom_tower
axiom rod : tower -> List ℤ
axiom tower'invariant (self : tower) : sorted (rod self)
noncomputable def tower'eq (a : tower) (b : tower) := rod a = rod b
axiom tower'inj (a : tower) (b : tower) (fact0 : tower'eq a b) : a = b
theorem move'vc (a : tower) (x : ℤ) (s : List ℤ) (b : tower) (fact0 : rod a = List.cons x s) (fact1 : match rod b with | ([] : List ℤ) => True | List.cons y _ => x < y) : match rod a with | List.cons x1 r => (∀(a1 : tower) (b1 : tower), sorted r ∧ (r = rod a1 → sorted (List.cons x1 (rod b)) ∧ (List.cons x1 (rod b) = rod b1 → rod a1 = s ∧ rod b1 = List.cons x (rod b)))) | ([] : List ℤ) => False
  := sorry
end tower_of_hanoi_Tower_of_Hanoi_moveqtvc
