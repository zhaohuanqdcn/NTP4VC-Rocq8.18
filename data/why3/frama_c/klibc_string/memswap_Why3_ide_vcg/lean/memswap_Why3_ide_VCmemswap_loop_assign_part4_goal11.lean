import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memswap_Why3_ide_VCmemswap_loop_assign_part4_goal11
theorem goal11 (a : Memory.addr) (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := i_1 - i; let a_4 : Memory.addr := Memory.shift a_1 x; let a_5 : Memory.addr -> ℤ := Memory.havoc t_2 (Memory.havoc t_1 t_3 a_2 x) a_3 x; let x_1 : ℤ := i_1 - Cint.to_uint32 (i - (1 : ℤ)); ¬i = (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_3 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_3 i_1 → Memory.separated a_3 i_1 a_2 i_1 → ¬Memory.invalid t a_4 (1 : ℤ) → (∀(i_2 : ℤ), let a_6 : Memory.addr := Memory.shift a i_2; i_2 < i_1 → i_1 ≤ i_2 + i → a_5 a_6 = t_3 a_6) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i < i_1 → a_5 (Memory.shift a i_2) = t_3 (Memory.shift a_1 i_2)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i < i_1 → a_5 (Memory.shift a_1 i_2) = t_3 (Memory.shift a i_2)) → (∀(i_2 : ℤ), let a_6 : Memory.addr := Memory.shift a_1 i_2; i_2 < i_1 → i_1 ≤ i_2 + i → a_5 a_6 = t_3 a_6) → Memory.included a_4 (1 : ℤ) a_2 x_1 ∨ Memory.included a_4 (1 : ℤ) a_3 x_1
  := sorry
end memswap_Why3_ide_VCmemswap_loop_assign_part4_goal11
