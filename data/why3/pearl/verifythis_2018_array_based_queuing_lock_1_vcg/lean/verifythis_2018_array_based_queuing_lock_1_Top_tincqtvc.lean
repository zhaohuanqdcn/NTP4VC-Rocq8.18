import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_1_Top_tincqtvc
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
axiom ticket : Type
axiom inhabited_axiom_ticket : Inhabited ticket
attribute [instance] inhabited_axiom_ticket
axiom tvalue : ticket -> ℤ
axiom ticket'invariant (self : ticket) : (0 : ℤ) ≤ tvalue self ∧ tvalue self < n
noncomputable def ticket'eq (a : ticket) (b : ticket) := tvalue a = tvalue b
axiom ticket'inj (a : ticket) (b : ticket) (fact0 : ticket'eq a b) : a = b
theorem tinc'vc (t : ticket) : let o1 : ℤ := n; ¬o1 = (0 : ℤ) ∧ (let o2 : ℤ := Int.tmod (tvalue t + (1 : ℤ)) o1; ((0 : ℤ) ≤ o2 ∧ o2 < n) ∧ (∀(result : ticket), tvalue result = o2 → (let v : ℤ := tvalue t + (1 : ℤ); tvalue result = (if v = n then (0 : ℤ) else v))))
  := sorry
end verifythis_2018_array_based_queuing_lock_1_Top_tincqtvc
