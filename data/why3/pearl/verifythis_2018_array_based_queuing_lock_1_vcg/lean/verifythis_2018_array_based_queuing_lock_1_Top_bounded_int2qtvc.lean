import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_1_Top_bounded_int2qtvc
axiom k : ℤ
axiom k'def : (0 : ℤ) < k
axiom n : ℤ
axiom n'def : (0 : ℤ) < n
axiom bounded_int : Type
axiom inhabited_axiom_bounded_int : Inhabited bounded_int
attribute [instance] inhabited_axiom_bounded_int
axiom bmodel : bounded_int -> ℤ
axiom bounded_int'invariant (self : bounded_int) : (0 : ℤ) ≤ bmodel self ∧ bmodel self < k * n
axiom bzero : bounded_int
axiom bzero'def : bmodel bzero = (0 : ℤ)
theorem bounded_int2'vc : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < n ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < n → (0 : ℤ) = Int.tmod (bmodel bzero) n)
  := sorry
end verifythis_2018_array_based_queuing_lock_1_Top_bounded_int2qtvc
