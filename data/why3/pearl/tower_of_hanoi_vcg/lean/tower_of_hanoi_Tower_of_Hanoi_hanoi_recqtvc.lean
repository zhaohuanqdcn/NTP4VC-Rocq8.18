import Why3.Base
open Classical
open Lean4Why3
namespace tower_of_hanoi_Tower_of_Hanoi_hanoi_recqtvc
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
theorem hanoi_rec'vc (p : List ℤ) (a : tower) (s : List ℤ) (b : tower) (c : tower) (fact0 : sorted1 p) (fact1 : rod a = List.reverse p ++ s) (fact2 : compat p (rod b)) (fact3 : compat p (rod c)) : if (0 : ℤ) < Int.ofNat (List.length p) then let t : List ℤ := rod c; (match p with | List.cons x r => True | ([] : List ℤ) => False) ∧ (∀(x : ℤ) (r : List ℤ), (match p with | List.cons x1 r1 => x = x1 ∧ r = r1 | ([] : List ℤ) => False) → (let o1 : List ℤ := List.cons x s; let o2 : ℤ := Int.ofNat (List.length p) - (1 : ℤ); (((0 : ℤ) ≤ Int.ofNat (List.length p) ∧ o2 < Int.ofNat (List.length p)) ∧ (Int.ofNat (List.length r) = o2 ∧ sorted1 r) ∧ rod a = List.reverse r ++ o1 ∧ compat r (rod c) ∧ compat r (rod b)) ∧ (∀(c1 : tower) (b1 : tower) (a1 : tower), rod a1 = o1 ∧ rod c1 = List.reverse r ++ rod c ∧ rod b1 = rod b → (rod a1 = List.cons x s ∧ (match rod b1 with | ([] : List ℤ) => True | List.cons y _ => x < y)) ∧ (∀(b2 : tower) (a2 : tower), rod a2 = s ∧ rod b2 = List.cons x (rod b1) → (let o3 : ℤ := Int.ofNat (List.length p) - (1 : ℤ); (((0 : ℤ) ≤ Int.ofNat (List.length p) ∧ o3 < Int.ofNat (List.length p)) ∧ (Int.ofNat (List.length r) = o3 ∧ sorted1 r) ∧ rod c1 = List.reverse r ++ t ∧ compat r (rod b2) ∧ compat r (rod a2)) ∧ (∀(c2 : tower) (b3 : tower) (a3 : tower), rod c2 = t ∧ rod b3 = List.reverse r ++ rod b2 ∧ rod a3 = rod a2 → rod a3 = s ∧ rod b3 = List.reverse p ++ rod b ∧ rod c2 = rod c)))))) else rod a = s ∧ rod b = List.reverse p ++ rod b
  := sorry
end tower_of_hanoi_Tower_of_Hanoi_hanoi_recqtvc
