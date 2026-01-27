import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find2.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.find2.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_Why3_ide_VCfind_loop_inv_not_found_preserved_goal2
theorem goal2 (a : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; let x : ℤ := t_1 a_1; let x_1 : ℤ := (1 : ℤ) + i_2; ¬x = i → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Cint.is_uint32 x_1 → ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_2 i → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Memory.valid_rd t a_1 (1 : ℤ) → ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) x_1 i
  := sorry
end find_Why3_ide_VCfind_loop_inv_not_found_preserved_goal2
