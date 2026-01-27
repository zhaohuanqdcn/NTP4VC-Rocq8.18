import Why3.Base
open Classical
open Lean4Why3
namespace coincidence_count_list_CoincidenceCountAnyType_coincidence_countqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom eq : t -> t -> Prop
axiom eq'spec (x : t) (y : t) : eq x y = (x = y)
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset t
axiom mk : Finset t -> set
axiom mk'spec (s : Finset t) : to_fset (mk s) = s
axiom choose1 : set -> t
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom rel : t -> t -> Prop
axiom Trans (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z) : rel x z
axiom Asymm (x : t) (y : t) (fact0 : rel x y) : ¬rel y x
axiom Trichotomy (x : t) (y : t) : rel x y ∨ rel y x ∨ x = y
inductive sorted : List t -> Prop where
 | Sorted_Nil : sorted ([] : List t)
 | Sorted_One (x : t) : sorted (List.cons x ([] : List t))
 | Sorted_Two (x : t) (y : t) (l : List t) : rel x y → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List t) (x : t) : ((∀(y : t), y ∈ l → rel x y) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List t) (l2 : List t) : (sorted l1 ∧ sorted l2 ∧ (∀(x : t) (y : t), x ∈ l1 → y ∈ l2 → rel x y)) = sorted (l1 ++ l2)
theorem coincidence_count'vc (a : List t) (b : List t) (fact0 : sorted a) (fact1 : sorted b) : (match b with | List.cons x x1 => (match a with | List.cons x2 x3 => eq x2 x = (x2 = x) → (if eq x2 x then ((match a with | ([] : List t) => False | List.cons _ f => f = x3) ∨ a = x3 ∧ (match b with | ([] : List t) => False | List.cons _ f => f = x1)) ∧ sorted x3 ∧ sorted x1 else if rel x2 x then (match a with | ([] : List t) => False | List.cons _ f => f = x3) ∧ sorted x3 ∧ sorted b else (match b with | ([] : List t) => False | List.cons _ f => f = x1) ∧ sorted a ∧ sorted x1) | _ => True) | _ => True) ∧ (∀(result : set), (match b with | List.cons x x1 => (match a with | List.cons x2 x3 => eq x2 x = (x2 = x) ∧ (if eq x2 x then ∃(o1 : set), to_fset o1 = List.toFinset x3 ∩ List.toFinset x1 ∧ to_fset result = insert x2 (to_fset o1) ∧ (if x2 ∈ to_fset o1 then Finset.card (to_fset result) = Finset.card (to_fset o1) else Int.ofNat (Finset.card (to_fset result)) = Int.ofNat (Finset.card (to_fset o1)) + (1 : ℤ)) else if rel x2 x then to_fset result = List.toFinset x3 ∩ List.toFinset b else to_fset result = List.toFinset a ∩ List.toFinset x1) | _ => to_fset result = (∅ : Finset t) ∧ Int.ofNat (Finset.card (to_fset result)) = (0 : ℤ)) | _ => to_fset result = (∅ : Finset t) ∧ Int.ofNat (Finset.card (to_fset result)) = (0 : ℤ)) → to_fset result = List.toFinset a ∩ List.toFinset b)
  := sorry
end coincidence_count_list_CoincidenceCountAnyType_coincidence_countqtvc
