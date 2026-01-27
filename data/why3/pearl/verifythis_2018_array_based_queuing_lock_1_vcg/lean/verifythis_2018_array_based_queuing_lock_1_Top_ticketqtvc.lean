import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_1_Top_ticketqtvc
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
axiom bounded_int2 : Type
axiom inhabited_axiom_bounded_int2 : Inhabited bounded_int2
attribute [instance] inhabited_axiom_bounded_int2
axiom value : bounded_int2 -> bounded_int
axiom model : bounded_int2 -> ℤ
axiom bounded_int2'invariant (self : bounded_int2) : (0 : ℤ) ≤ model self ∧ model self < n ∧ model self = Int.tmod (bmodel (value self)) n
noncomputable def bounded_int2'eq (a : bounded_int2) (b : bounded_int2) := value a = value b ∧ model a = model b
axiom bounded_int2'inj (a : bounded_int2) (b : bounded_int2) (fact0 : bounded_int2'eq a b) : a = b
theorem ticket'vc : ∃(tvalue : ℤ), (0 : ℤ) ≤ tvalue ∧ tvalue < n
  := sorry
end verifythis_2018_array_based_queuing_lock_1_Top_ticketqtvc
