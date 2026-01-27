import Why3.Base
open Classical
open Lean4Why3
namespace rac_Premises_test1qtvc
axiom p : ℤ -> Prop
axiom q : ℤ -> Prop
axiom a (x : ℤ) (fact0 : p x) : q x
theorem test1'vc (fact0 : p (42 : ℤ)) : q (42 : ℤ)
  := sorry
end rac_Premises_test1qtvc
