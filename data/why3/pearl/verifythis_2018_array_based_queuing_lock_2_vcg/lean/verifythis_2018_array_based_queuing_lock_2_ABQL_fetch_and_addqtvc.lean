import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_2_ABQL_fetch_and_addqtvc
axiom n : ℤ
axiom N_val : (2 : ℤ) ≤ n
axiom k : ℤ
axiom K_val : (2 : ℤ) ≤ k
axiom tick : Type
axiom inhabited_axiom_tick : Inhabited tick
attribute [instance] inhabited_axiom_tick
axiom b : tick -> ℤ
axiom v : tick -> ℤ
axiom tick'invariant (self : tick) : (0 : ℤ) ≤ v self ∧ (0 : ℤ) ≤ b self ∧ b self < k * n ∧ b self = v self % (k * n)
noncomputable def tick'eq (a : tick) (b1 : tick) := b a = b b1 ∧ v a = v b1
axiom tick'inj (a : tick) (b1 : tick) (fact0 : tick'eq a b1) : a = b1
theorem fetch_and_add'vc (r : tick) : let o1 : ℤ := v r + (1 : ℤ); let o2 : ℤ := k * n; ¬o2 = (0 : ℤ) ∧ (let o3 : ℤ := (b r + (1 : ℤ)) % o2; ((0 : ℤ) ≤ o1 ∧ ((0 : ℤ) ≤ o3 ∧ o3 < k * n) ∧ o3 = o1 % (k * n)) ∧ (∀(o4 : tick), b o4 = o3 ∧ v o4 = o1 → v o4 = v r + (1 : ℤ)))
  := sorry
end verifythis_2018_array_based_queuing_lock_2_ABQL_fetch_and_addqtvc
