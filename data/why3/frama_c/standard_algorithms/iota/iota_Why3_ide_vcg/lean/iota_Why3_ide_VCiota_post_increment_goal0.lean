import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.iota.lib.lean.Compound.Compound
import frama_c.standard_algorithms.iota.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace iota_Why3_ide_VCiota_post_increment_goal0
theorem goal0 (i : ℤ) (i_2 : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let x : ℤ := i - i_2; let a_1 : Memory.addr := Memory.shift a (0 : ℤ); i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i + i_1 ≤ (2147483647 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Cint.is_sint32 x → Memory.valid_rw t a_1 i_1 → Axiomatic.p_iota (Memory.havoc t_1 t_2 a_1 i_1) a i_2 x → Axiomatic.p_iota (Memory.havoc t_1 t_2 a_1 i_2) a i_2 x
  := sorry
end iota_Why3_ide_VCiota_post_increment_goal0
