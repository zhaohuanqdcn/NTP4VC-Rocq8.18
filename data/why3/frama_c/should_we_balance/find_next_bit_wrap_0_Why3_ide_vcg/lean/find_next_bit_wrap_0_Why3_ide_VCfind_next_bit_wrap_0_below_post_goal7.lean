import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
import frama_c.should_we_balance.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace find_next_bit_wrap_0_Why3_ide_VCfind_next_bit_wrap_0_below_post_goal7
theorem goal7 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_3 : ℤ) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_3); let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬t_1 (Memory.shift a i_1) = (0 : ℤ) → i < i_2 → (0 : ℤ) ≤ i_1 → i_1 < i → i ≤ A_thread_variables_properties.l_size → i_2 ≤ A_thread_variables_properties.l_size → i ≤ Cint.to_uint32 i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_uint8 (t_1 (Memory.shift a i_2)) → Cint.is_uint8 x → Memory.valid_rd t a_1 i → Memory.valid_rd t a_1 i_2 → ((∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i → t_1 (Memory.shift a i_4) = (0 : ℤ)) → i_3 = i) → ((∃(i_4 : ℤ), ¬t_1 (Memory.shift a i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < i) → ¬x = (0 : ℤ)) → ((∃(i_4 : ℤ), ¬t_1 (Memory.shift a i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < i) → (0 : ℤ) ≤ i_3 ∧ i_3 < i) → ((∃(i_4 : ℤ), ¬t_1 (Memory.shift a i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < i) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_3 → t_1 (Memory.shift a i_4) = (0 : ℤ))) → ¬(∀(i_4 : ℤ), i ≤ i_4 → i_4 < i_2 → t_1 (Memory.shift a i_4) = (0 : ℤ))
  := sorry
end find_next_bit_wrap_0_Why3_ide_VCfind_next_bit_wrap_0_below_post_goal7
