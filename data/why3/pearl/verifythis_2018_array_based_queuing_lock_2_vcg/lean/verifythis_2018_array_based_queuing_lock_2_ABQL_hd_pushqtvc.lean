import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_2_ABQL_hd_pushqtvc
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
noncomputable def lt (tick1 : tick) (tick2 : tick) := v tick1 < v tick2
noncomputable def sorted (s : List tick) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length s) → lt (s[Int.toNat i]!) (s[Int.toNat j]!)
noncomputable def consecutive (l : List tick) := ∀(i : ℤ), (0 : ℤ) < i ∧ i < Int.ofNat (List.length l) → v (l[Int.toNat i]!) = v (l[Int.toNat (i - (1 : ℤ))]!) + (1 : ℤ)
noncomputable def last (l : List tick) := if Int.ofNat (List.length l) = (0 : ℤ) then Option.none else Option.some (l[Int.toNat (Int.ofNat (List.length l) - (1 : ℤ))]!)
noncomputable def hd (l : List tick) := if Int.ofNat (List.length l) = (0 : ℤ) then Option.none else Option.some (l[(0 : ℕ)]!)
theorem hd_push'vc (l : List tick) (x : tick) : hd l = Option.none ∨ hd (l ++ List.cons x ([] : List tick)) = hd l
  := sorry
end verifythis_2018_array_based_queuing_lock_2_ABQL_hd_pushqtvc
