import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_loop_inv_4_established_part2_goal7
theorem goal7 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (a : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_1 (0 : ℤ)); let x_2 : ℤ := Memory.addr.base a_3; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_3 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_1 = (1 : ℤ) → ¬x = x_1 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint8 x_1 → Cint.is_uint8 x → Memory.valid_rw t a_4 i_1 → Memory.valid_rw t a_5 i → Memory.separated a_5 i a_4 i_1 → x_2 = Memory.addr.base a
  := sorry
end memmem_Why3_ide_VCmemmem_loop_inv_4_established_part2_goal7
