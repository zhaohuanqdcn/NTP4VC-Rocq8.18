import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_loop_inv_3_established_part2_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a (1 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a (0 : ℤ)); let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_1 = (1 : ℤ) → ¬x = x_1 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region x_2 ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint8 x_1 → Cint.is_uint8 x → Memory.valid_rw t a_3 i_1 → Memory.valid_rw t a_4 i → Memory.separated a_4 i a_3 i_1 → x_2 = Memory.addr.base a
  := sorry
end memmem_Why3_ide_VCmemmem_loop_inv_3_established_part2_goal5
