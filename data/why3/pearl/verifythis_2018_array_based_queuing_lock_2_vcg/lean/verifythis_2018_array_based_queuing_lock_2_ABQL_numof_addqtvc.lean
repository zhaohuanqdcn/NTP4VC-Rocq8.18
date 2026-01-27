import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.queue.Queue
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_2_ABQL_numof_addqtvc
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
inductive pc where
  | A1 : pc
  | A2 : pc
  | A3 : pc
  | R1 : pc
  | R2 : pc
  | I : pc
  | W : pc
axiom inhabited_axiom_pc : Inhabited pc
attribute [instance] inhabited_axiom_pc
noncomputable def has_ticket (pc1 : pc) := match pc1 with | pc.A1 => False | pc.I => False | _ => True
noncomputable def has_lock (pc1 : pc) := match pc1 with | pc.A3 => True | pc.W => True | pc.R1 => True | pc.R2 => True | _ => False
axiom nondet_source : Type
axiom inhabited_axiom_nondet_source : Inhabited nondet_source
attribute [instance] inhabited_axiom_nondet_source
axiom rng : Type
axiom inhabited_axiom_rng : Inhabited rng
attribute [instance] inhabited_axiom_rng
axiom source : rng -> nondet_source
axiom fc :  {α : Type} -> [Inhabited α] -> List α -> α -> ℤ -> Bool
axiom fc'def {α : Type} [Inhabited α] (a : List α) (v1 : α) (i : ℤ) : (fc a v1 i = true) = (a[Int.toNat i]! = v1)
theorem numof_add'vc {α : Type} [Inhabited α] (l : ℤ) (i : ℤ) (u : ℤ) (a : List α) (v1 : α) (fact0 : l ≤ i) (fact1 : i < u) (fact2 : ¬a[Int.toNat i]! = v1) : Int.ofNat (List.count v1 (List.drop (Int.toNat l) (List.take (Int.toNat u - Int.toNat l) (List.set a (Int.toNat i) v1)))) = Int.ofNat (List.count v1 (List.drop (Int.toNat l) (List.take (Int.toNat u - Int.toNat l) a))) + (1 : ℤ)
  := sorry
end verifythis_2018_array_based_queuing_lock_2_ABQL_numof_addqtvc
