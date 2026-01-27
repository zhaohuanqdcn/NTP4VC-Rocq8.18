import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.Compound.Compound
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_first_bit_0_Why3_ide_VCfind_first_bit_0_loop_inv_preserved_goal0
theorem goal0 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; t_1 a_1 = (0 : ℤ) → i_1 < i → (0 : ℤ) ≤ i_2 → i ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 < Cint.to_uint32 ((1 : ℤ) + i_1) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → t_1 (Memory.shift a i_3) = (0 : ℤ)) → t_1 (Memory.shift a i_2) = (0 : ℤ)
  := sorry
end find_first_bit_0_Why3_ide_VCfind_first_bit_0_loop_inv_preserved_goal0
