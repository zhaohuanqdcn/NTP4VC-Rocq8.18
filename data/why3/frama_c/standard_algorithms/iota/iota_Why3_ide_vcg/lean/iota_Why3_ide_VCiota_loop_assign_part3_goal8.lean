import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.iota.lib.lean.Compound.Compound
import frama_c.standard_algorithms.iota.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace iota_Why3_ide_VCiota_loop_assign_part3_goal8
theorem goal8 (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let x : ℤ := i_1 + i_2; let x_1 : ℤ := i - i_1; let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a x_1; i_1 ≤ i → i < x → i ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (2147483646 : ℤ) → x ≤ (2147483647 : ℤ) → i ≤ (4294967294 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i_2 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_uint32 x_1 → Memory.valid_rw t a_1 i_2 → Memory.valid_rw t a_2 (1 : ℤ) → ¬Memory.invalid t a_2 (1 : ℤ) → Axiomatic.p_iota (Memory.havoc t_1 t_2 a_1 i_2) a x_1 i_1 → Memory.included a_2 (1 : ℤ) a_1 i_2
  := sorry
end iota_Why3_ide_VCiota_loop_assign_part3_goal8
