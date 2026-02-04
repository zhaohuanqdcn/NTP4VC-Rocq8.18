import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.int32_quat_comp_norm_shortest.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic15
noncomputable def p_bound_int32quat (mint_0 : Memory.addr -> ℤ) (q : Memory.addr) (bound_0 : ℤ) := let x : ℤ := mint_0 (Memory.shift q (0 : ℤ)); let x_1 : ℤ := mint_0 (Memory.shift q (1 : ℤ)); let x_2 : ℤ := mint_0 (Memory.shift q (2 : ℤ)); let x_3 : ℤ := mint_0 (Memory.shift q (3 : ℤ)); x ≤ bound_0 ∧ x_1 ≤ bound_0 ∧ x_2 ≤ bound_0 ∧ x_3 ≤ bound_0 ∧ (0 : ℤ) ≤ bound_0 + x ∧ (0 : ℤ) ≤ bound_0 + x_1 ∧ (0 : ℤ) ≤ bound_0 + x_2 ∧ (0 : ℤ) ≤ bound_0 + x_3
noncomputable def p_rvalid_bound_int32quat (malloc_0 : ℤ -> ℤ) (mint_0 : Memory.addr -> ℤ) (q : Memory.addr) (bound_0 : ℤ) := Memory.valid_rd malloc_0 q (4 : ℤ) ∧ p_bound_int32quat mint_0 q bound_0
end Axiomatic15
