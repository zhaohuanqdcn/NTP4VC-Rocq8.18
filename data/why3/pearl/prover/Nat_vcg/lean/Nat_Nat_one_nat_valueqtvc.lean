import Why3.Base
open Classical
open Lean4Why3
namespace Nat_Nat_one_nat_valueqtvc
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
theorem one_nat_value'vc : nat_to_int (nat.SNat nat.ONat) = (1 : ℤ)
  := sorry
end Nat_Nat_one_nat_valueqtvc
