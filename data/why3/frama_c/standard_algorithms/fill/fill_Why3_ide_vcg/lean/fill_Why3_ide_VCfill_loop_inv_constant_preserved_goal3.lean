import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.fill.lib.lean.Compound.Compound
import frama_c.standard_algorithms.fill.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace fill_Why3_ide_VCfill_loop_inv_constant_preserved_goal3
theorem goal3 (i_2 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := (1 : ℤ) + i_2; let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a i_2; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_1; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Cint.is_uint32 x → Memory.valid_rw t a_1 i_1 → Memory.valid_rw t a_2 (1 : ℤ) → Axiomatic.p_constantrange a_3 a (0 : ℤ) i_2 i → Axiomatic.p_constantrange (Function.update a_3 a_2 i) a (0 : ℤ) x i
  := sorry
end fill_Why3_ide_VCfill_loop_inv_constant_preserved_goal3
