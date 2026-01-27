import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
import frama_c.should_we_balance.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace find_next_bit_wrap_Why3_ide_VCfind_next_bit_wrap_below_post_3_goal9
theorem goal9 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_4 : ℤ) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (i_3 : ℤ) : let x : ℤ := t_1 (Memory.shift a i_4); let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x_1 : ℤ := Cint.to_uint32 i_4; ¬t_1 (Memory.shift a i_2) = (0 : ℤ) → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i_1 → i ≤ A_thread_variables_properties.l_size → i_1 ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Cint.is_sint32 i_4 → Cint.is_uint8 (t_1 (Memory.shift a i)) → Cint.is_uint8 (t_1 (Memory.shift a i_3)) → Cint.is_uint8 x → Memory.valid_rd t a_1 i → Memory.valid_rd t a_1 i_1 → (if x_1 < i_1 then x_1 = i_3 else i_3 = i) → ((∀(i_5 : ℤ), (0 : ℤ) ≤ i_5 → i_5 < i_1 → t_1 (Memory.shift a i_5) = (0 : ℤ)) → i_4 = i_1) → ((∃(i_5 : ℤ), ¬t_1 (Memory.shift a i_5) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < i_1) → ¬x = (0 : ℤ)) → ((∃(i_5 : ℤ), ¬t_1 (Memory.shift a i_5) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < i_1) → (0 : ℤ) ≤ i_4 ∧ i_4 < i_1) → ((∃(i_5 : ℤ), ¬t_1 (Memory.shift a i_5) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < i_1) → (∀(i_5 : ℤ), (0 : ℤ) ≤ i_5 → i_5 < i_4 → t_1 (Memory.shift a i_5) = (0 : ℤ))) → (∀(i_5 : ℤ), i_5 < i → i_1 ≤ i_5 → t_1 (Memory.shift a i_5) = (0 : ℤ)) → i_3 < i
  := sorry
end find_next_bit_wrap_Why3_ide_VCfind_next_bit_wrap_below_post_3_goal9
