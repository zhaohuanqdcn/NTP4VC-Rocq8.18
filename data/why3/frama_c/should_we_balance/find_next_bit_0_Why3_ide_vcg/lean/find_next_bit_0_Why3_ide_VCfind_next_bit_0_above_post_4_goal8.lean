import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.Compound.Compound
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_next_bit_0_Why3_ide_VCfind_next_bit_0_above_post_4_goal8
theorem goal8 (a : Memory.addr) (i_4 : ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i_5 : ℤ) : let a_1 : Memory.addr := Memory.shift a i_4; ¬t_1 (Memory.shift a i_2) = (0 : ℤ) → i_2 < i → i_1 ≤ i_2 → i_1 ≤ i_3 → i ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_sint32 i_5 → Cint.is_uint8 (t_1 (Memory.shift a i_3)) → Cint.is_uint8 (t_1 (Memory.shift a i_5)) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → (if i_3 < i then i_4 = i_3 ∧ Cint.to_sint32 i_4 = i_5 ∧ t_1 a_1 = (1 : ℤ) ∧ Memory.valid_rd t a_1 (1 : ℤ) else Cint.to_sint32 i = i_5) → (∀(i_6 : ℤ), i_1 ≤ i_6 → i_6 < i_3 → t_1 (Memory.shift a i_6) = (0 : ℤ)) → i_5 < i
  := sorry
end find_next_bit_0_Why3_ide_VCfind_next_bit_0_above_post_4_goal8
