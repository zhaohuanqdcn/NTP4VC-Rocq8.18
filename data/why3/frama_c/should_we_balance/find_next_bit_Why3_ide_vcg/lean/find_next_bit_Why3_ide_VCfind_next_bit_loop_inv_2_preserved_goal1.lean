import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.Compound.Compound
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_next_bit_Why3_ide_VCfind_next_bit_loop_inv_2_preserved_goal1
theorem goal1 (a : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; t_1 a_1 = (0 : ℤ) → i_2 < i → i_1 ≤ i_2 → i_1 ≤ i_3 → i ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_3 < Cint.to_uint32 ((1 : ℤ) + i_2) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → (∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 < i_2 → t_1 (Memory.shift a i_4) = (0 : ℤ)) → t_1 (Memory.shift a i_3) = (0 : ℤ)
  := sorry
end find_next_bit_Why3_ide_VCfind_next_bit_loop_inv_2_preserved_goal1
