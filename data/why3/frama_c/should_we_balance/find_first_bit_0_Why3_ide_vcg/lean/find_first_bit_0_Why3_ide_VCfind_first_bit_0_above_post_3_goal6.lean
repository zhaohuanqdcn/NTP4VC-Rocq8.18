import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.Compound.Compound
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_first_bit_0_Why3_ide_VCfind_first_bit_0_above_post_3_goal6
theorem goal6 (a : Memory.addr) (i_3 : ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (i_4 : ℤ) (i_5 : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) : let a_1 : Memory.addr := Memory.shift a i_3; ¬t_1 (Memory.shift a i_1) = (0 : ℤ) → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_4 → i_4 < i_5 → i ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i_5 → Cint.is_uint8 (t_1 (Memory.shift a i_2)) → Cint.is_uint8 (t_1 (Memory.shift a i_5)) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → (if i_2 < i then i_3 = i_2 ∧ Cint.to_sint32 i_3 = i_5 ∧ t_1 a_1 = (1 : ℤ) ∧ Memory.valid_rd t a_1 (1 : ℤ) else Cint.to_sint32 i = i_5) → (∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 < i_2 → t_1 (Memory.shift a i_6) = (0 : ℤ)) → t_1 (Memory.shift a i_4) = (0 : ℤ)
  := sorry
end find_first_bit_0_Why3_ide_VCfind_first_bit_0_above_post_3_goal6
