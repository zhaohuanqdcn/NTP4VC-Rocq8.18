import Why3.Base
open Classical
open Lean4Why3
namespace bignum_BigNum_addqtvc
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
theorem add'vc (n1 : List ℤ) (n2 : List ℤ) (fact0 : valid n1) (fact1 : valid n2) : valid n1 ∧ valid n2 ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(result : List ℤ), valid result ∧ value result = value n1 + value n2 + (0 : ℤ) → valid result ∧ value result = value n1 + value n2)
  := sorry
end bignum_BigNum_addqtvc
