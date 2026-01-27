import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_first_of.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_first_of.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_first_of_Why3_ide_VCfind_first_of_loop_inv_not_found_preserved_goal2
theorem goal2 (i_2 : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := (1 : ℤ) + i_2; let a_2 : Memory.addr := Memory.shift a_1 i_2; let x_1 : ℤ := t_1 a_2; (0 : ℤ) ≤ i → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 x → Cint.is_sint32 (t_1 (Memory.shift a i)) → Cint.is_sint32 x_1 → ¬Axiomatic.p_hasvalueof t_1 a_1 i_2 a i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → Memory.valid_rd t a_2 (1 : ℤ) → ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i x_1 → ¬Axiomatic.p_hasvalueof t_1 a_1 x a i
  := sorry
end find_first_of_Why3_ide_VCfind_first_of_loop_inv_not_found_preserved_goal2
