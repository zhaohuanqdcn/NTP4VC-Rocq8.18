import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_find.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_find.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace adjacent_find_Why3_ide_VCadjacent_find_loop_inv_none_preserved_goal3
theorem goal3 (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := (1 : ℤ) + i_1; let a_1 : Memory.addr := Memory.shift a x; let x_1 : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a i_1; let x_2 : ℤ := t_1 a_2; let x_3 : ℤ := (2 : ℤ) + i_1; ¬x_1 = x_2 → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i → i_1 ≤ (4294967294 : ℤ) → x_3 ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x → Cint.is_sint32 x_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_2 (1 : ℤ) → ¬Axiomatic.p_hasequalneighbors t_1 a x → Cint.is_sint32 x_1 → Memory.valid_rd t a_1 (1 : ℤ) → ¬Axiomatic.p_hasequalneighbors t_1 a x_3
  := sorry
end adjacent_find_Why3_ide_VCadjacent_find_loop_inv_none_preserved_goal3
