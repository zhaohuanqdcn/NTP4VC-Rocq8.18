import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.iota.lib.lean.Compound.Compound
import frama_c.standard_algorithms.iota.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace iota_Why3_ide_VCiota_loop_inv_increment_preserved_goal3
theorem goal3 (i_2 : ℤ) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := (1 : ℤ) + i_2; let x_1 : ℤ := i - i_2; let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a i_2; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_1; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (2147483646 : ℤ) → i_2 ≤ (4294967294 : ℤ) → i + i_1 ≤ (2147483647 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Cint.is_uint32 x → Cint.is_sint32 x_1 → Memory.valid_rw t a_1 i_1 → Memory.valid_rw t a_2 (1 : ℤ) → Axiomatic.p_iota a_3 a i_2 x_1 → Axiomatic.p_iota (Function.update a_3 a_2 i) a x x_1
  := sorry
end iota_Why3_ide_VCiota_loop_inv_increment_preserved_goal3
