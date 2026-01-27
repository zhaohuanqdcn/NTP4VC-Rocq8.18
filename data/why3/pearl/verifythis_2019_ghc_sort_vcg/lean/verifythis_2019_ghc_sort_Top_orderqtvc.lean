import Why3.Base
import Why3.why3.Ref.Ref
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_ghc_sort_Top_orderqtvc
axiom Trans (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x < y) (fact1 : y < z) : x < z
inductive sorted : List ℤ -> Prop where
 | Sorted_Nil : sorted ([] : List ℤ)
 | Sorted_One (x : ℤ) : sorted (List.cons x ([] : List ℤ))
 | Sorted_Two (x : ℤ) (y : ℤ) (l : List ℤ) : x < y → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x < y) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List ℤ) (l2 : List ℤ) : (sorted l1 ∧ sorted l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x < y)) = sorted (l1 ++ l2)
axiom Trans1 (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x ≤ y) (fact1 : y ≤ z) : x ≤ z
inductive sorted1 : List ℤ -> Prop where
 | Sorted_Nil1 : sorted1 ([] : List ℤ)
 | Sorted_One1 (x : ℤ) : sorted1 (List.cons x ([] : List ℤ))
 | Sorted_Two1 (x : ℤ) (y : ℤ) (l : List ℤ) : x ≤ y → sorted1 (List.cons y l) → sorted1 (List.cons x (List.cons y l))
axiom sorted_mem1 (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x ≤ y) ∧ sorted1 l) = sorted1 (List.cons x l)
axiom sorted_append1 (l1 : List ℤ) (l2 : List ℤ) : (sorted1 l1 ∧ sorted1 l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x ≤ y)) = sorted1 (l1 ++ l2)
inductive sorted2 : List ℤ -> Prop where
 | Sorted_Nil2 : sorted2 ([] : List ℤ)
 | Sorted_One2 (x : ℤ) : sorted2 (List.cons x ([] : List ℤ))
 | Sorted_Two2 (y : ℤ) (x : ℤ) (l : List ℤ) : y ≤ x → sorted2 (List.cons y l) → sorted2 (List.cons x (List.cons y l))
axiom sorted_mem2 (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → y ≤ x) ∧ sorted2 l) = sorted2 (List.cons x l)
axiom sorted_append2 (l1 : List ℤ) (l2 : List ℤ) : (sorted2 l1 ∧ sorted2 l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → y ≤ x)) = sorted2 (l1 ++ l2)
noncomputable def compat (s : List ℤ) (t : List ℤ) := match (s, t) with | (List.cons x _, List.cons y _) => x ≤ y | (_, _) => True
axiom rev_append_sorted_incr (s : List ℤ) (t : List ℤ) : sorted1 (List.reverse s ++ t) = (sorted2 s ∧ sorted1 t ∧ compat s t)
axiom rev_append_sorted_decr (s : List ℤ) (t : List ℤ) : sorted2 (List.reverse s ++ t) = (sorted1 s ∧ sorted2 t ∧ compat t s)
noncomputable def eqb (b1 : Bool) (b2 : Bool) := Bool.imp b1 b2 && Bool.imp b2 b1
axiom eqb'spec (b1 : Bool) (b2 : Bool) : (eqb b1 b2 = true) = (b1 = b2)
axiom list_seq : Type
axiom inhabited_axiom_list_seq : Inhabited list_seq
attribute [instance] inhabited_axiom_list_seq
axiom list : list_seq -> List ℤ
axiom seq : list_seq -> List ℤ
axiom list_seq'invariant (self : list_seq) : seq self = List.reverse (list self)
noncomputable def list_seq'eq (a : list_seq) (b : list_seq) := list a = list b ∧ seq a = seq b
axiom list_seq'inj (a : list_seq) (b : list_seq) (fact0 : list_seq'eq a b) : a = b
axiom nil : list_seq
axiom nil'def : list nil = ([] : List ℤ) ∧ seq nil = ([] : List ℤ)
theorem order'vc (l : List ℤ) (fact0 : sorted l ∨ sorted2 l) : (match l with | ([] : List ℤ) => True | List.cons _ ([] : List ℤ) => True | List.cons h1 (List.cons h2 _) => True) ∧ (∀(result : List ℤ), (match l with | ([] : List ℤ) => result = l | List.cons _ ([] : List ℤ) => result = l | List.cons h1 (List.cons h2 _) => (if h1 < h2 then result = l else result = List.reverse l)) → sorted1 result ∧ List.Perm l result)
  := sorry
end verifythis_2019_ghc_sort_Top_orderqtvc
