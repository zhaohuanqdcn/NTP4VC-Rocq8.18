import Why3.Base
open Classical
open Lean4Why3
namespace Nat_Nat_add_nat_simulate_add_intqtvc
inductive nat where
  | ONat : nat
  | SNat : nat -> nat
axiom inhabited_axiom_nat : Inhabited nat
attribute [instance] inhabited_axiom_nat
noncomputable def nat_to_int : nat -> ℤ
  | nat.ONat => (0 : ℤ)
  | (nat.SNat n1) => (1 : ℤ) + nat_to_int n1
noncomputable def add_nat : nat -> nat -> nat
  | nat.ONat, n2 => n2
  | (nat.SNat n11), n2 => nat.SNat (add_nat n11 n2)
theorem add_nat_simulate_add_int'vc (n1 : nat) (n2 : nat) : nat_to_int (add_nat n1 n2) = nat_to_int n1 + nat_to_int n2
  := sorry
end Nat_Nat_add_nat_simulate_add_intqtvc
