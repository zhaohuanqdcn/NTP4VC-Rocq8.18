import Why3.Base
open Classical
open Lean4Why3
namespace bignum_BigNum_msdqtvc
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
theorem msd'vc (n : List ℤ) (fact0 : valid n) : (value n = (0 : ℤ)) = (n = ([] : List ℤ))
  := sorry
end bignum_BigNum_msdqtvc
