import Why3.Base
open Classical
open Lean4Why3
namespace bignum_BigNum_add_digitqtvc
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
theorem add_digit'vc (n : List ℤ) (d : ℤ) (fact0 : valid n) (fact1 : (0 : ℤ) ≤ d) (fact2 : d < base) : (match n with | ([] : List ℤ) => True | List.cons d0 r => ¬d + d0 < base → (match n with | ([] : List ℤ) => False | List.cons _ f => f = r) ∧ valid r ∧ (0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < base) ∧ (∀(result : List ℤ), (match n with | ([] : List ℤ) => (if d = (0 : ℤ) then result = ([] : List ℤ) else result = List.cons d ([] : List ℤ)) | List.cons d0 r => (if d + d0 < base then result = List.cons (d + d0) r else ∃(o1 : List ℤ), (valid o1 ∧ value o1 = value r + (1 : ℤ)) ∧ result = List.cons (d + d0 - base) o1)) → valid result ∧ value result = value n + d)
  := sorry
end bignum_BigNum_add_digitqtvc
