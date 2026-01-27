import Why3.Base
open Classical
open Lean4Why3
namespace bignum_BigNum_add_cinqtvc
axiom base : ℤ
axiom base'def : (1 : ℤ) < base
axiom digit : Type
axiom inhabited_axiom_digit : Inhabited digit
attribute [instance] inhabited_axiom_digit
axiom num : Type
axiom inhabited_axiom_num : Inhabited num
attribute [instance] inhabited_axiom_num
noncomputable def value : List ℤ -> ℤ
  | ([] : List ℤ) => (0 : ℤ)
  | (List.cons d r) => d + base * value r
noncomputable def valid : List ℤ -> Prop
  | ([] : List ℤ) => True
  | (List.cons d ([] : List ℤ)) => (0 : ℤ) < d ∧ d < base
  | (List.cons d r) => ((0 : ℤ) ≤ d ∧ d < base) ∧ valid r
theorem add_cin'vc (n1 : List ℤ) (n2 : List ℤ) (cin : ℤ) (fact0 : valid n1) (fact1 : valid n2) (fact2 : (0 : ℤ) ≤ cin) (fact3 : cin ≤ (1 : ℤ)) : (match n2 with | ([] : List ℤ) => (match n1 with | ([] : List ℤ) => valid n2 ∧ (0 : ℤ) ≤ cin ∧ cin < base | List.cons x x1 => valid n1 ∧ (0 : ℤ) ≤ cin ∧ cin < base) | List.cons x x1 => (match n1 with | ([] : List ℤ) => valid n2 ∧ (0 : ℤ) ≤ cin ∧ cin < base | List.cons x2 x3 => (if cin + x2 + x < base then (match n1 with | ([] : List ℤ) => False | List.cons _ f => f = x3) ∧ valid x3 ∧ valid x1 ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (1 : ℤ) else (match n1 with | ([] : List ℤ) => False | List.cons _ f => f = x3) ∧ valid x3 ∧ valid x1 ∧ (0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ (1 : ℤ)))) ∧ (∀(result : List ℤ), (match n2 with | ([] : List ℤ) => (match n1 with | ([] : List ℤ) => valid result ∧ value result = value n2 + cin | List.cons x x1 => valid result ∧ value result = value n1 + cin) | List.cons x x1 => (match n1 with | ([] : List ℤ) => valid result ∧ value result = value n2 + cin | List.cons x2 x3 => (let d : ℤ := cin + x2 + x; if d < base then ∃(o1 : List ℤ), (valid o1 ∧ value o1 = value x3 + value x1 + (0 : ℤ)) ∧ result = List.cons d o1 else ∃(o1 : List ℤ), (valid o1 ∧ value o1 = value x3 + value x1 + (1 : ℤ)) ∧ result = List.cons (d - base) o1))) → valid result ∧ value result = value n1 + value n2 + cin)
  := sorry
end bignum_BigNum_add_cinqtvc
