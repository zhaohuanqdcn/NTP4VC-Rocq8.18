import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memccpy_Why3_ide_VCmemccpy_loop_assign_part5_goal14
theorem goal14 (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := i_1 - i; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 x; let a_4 : Memory.addr := Memory.shift a x; let a_5 : ℤ := a_3 a_4; let x_1 : ℤ := Cint.to_sint8 i_2; let a_6 : Memory.addr := Memory.shift a (0 : ℤ); let a_7 : Memory.addr := Memory.shift a_1 x; ¬i = (0 : ℤ) → ¬a_5 = x_1 → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_2 → i_2 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t a_6 i_1 → Memory.valid_rw t a_2 i_1 → Memory.separated a_6 i_1 a_2 i_1 → Memory.addr_le a a_4 → Memory.addr_le a_1 a_7 → Memory.addr_le a_4 (Memory.shift a i_1) → Memory.addr_le a_7 (Memory.shift a_1 i_1) → ¬Memory.invalid t a_7 (1 : ℤ) → Cint.is_sint8 a_5 → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + i < i_1 → a_3 (Memory.shift a_1 i_3) = a_3 (Memory.shift a i_3)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + i < i_1 → ¬a_3 (Memory.shift a_1 i_3) = x_1) → Memory.included a_7 (1 : ℤ) a_2 (i_1 - Cint.to_uint32 (i - (1 : ℤ)))
  := sorry
end memccpy_Why3_ide_VCmemccpy_loop_assign_part5_goal14
