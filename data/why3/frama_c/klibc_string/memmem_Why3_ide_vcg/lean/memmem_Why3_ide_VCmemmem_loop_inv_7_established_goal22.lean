import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_loop_inv_7_established_goal22
theorem goal22 (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a : Memory.addr) : let x : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); (0 : ℤ) < i → (0 : ℤ) ≤ i → Memory.region x ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t a_3 (1 : ℤ) → Memory.valid_rw t a_4 i → Memory.separated a_4 i a_3 (1 : ℤ) → x = Memory.addr.base a
  := sorry
end memmem_Why3_ide_VCmemmem_loop_inv_7_established_goal22
