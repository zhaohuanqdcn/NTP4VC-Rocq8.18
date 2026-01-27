import Why3.Base
open Classical
open Lean4Why3
namespace tower_of_hanoi_Tower_of_Hanoi_tower_of_hanoiqtvc
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
theorem tower_of_hanoi'vc (b : tower) (c : tower) (a : tower) (fact0 : rod b = rod c) (fact1 : rod c = ([] : List ℤ)) : let o1 : List ℤ := ([] : List ℤ); let o2 : List ℤ := List.reverse (rod a) ++ ([] : List ℤ); ((List.length o2 = List.length (rod a) ∧ sorted1 o2) ∧ rod a = List.reverse o2 ++ o1 ∧ compat o2 (rod b) ∧ compat o2 (rod c)) ∧ (∀(c1 : tower) (b1 : tower) (a1 : tower), rod a1 = o1 ∧ rod b1 = List.reverse o2 ++ rod b ∧ rod c1 = rod c → rod b1 = rod a ∧ rod a1 = rod c1 ∧ rod c1 = ([] : List ℤ))
  := sorry
end tower_of_hanoi_Tower_of_Hanoi_tower_of_hanoiqtvc
