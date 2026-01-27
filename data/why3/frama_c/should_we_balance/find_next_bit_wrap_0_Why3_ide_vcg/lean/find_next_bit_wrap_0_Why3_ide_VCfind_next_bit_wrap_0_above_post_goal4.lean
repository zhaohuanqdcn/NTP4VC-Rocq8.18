import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
import frama_c.should_we_balance.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace find_next_bit_wrap_0_Why3_ide_VCfind_next_bit_wrap_0_above_post_goal4
theorem goal4 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_4 : ℤ) (i_5 : ℤ) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (i_3 : ℤ) (i_6 : ℤ) : let x : ℤ := t_1 (Memory.shift a i_4); let x_1 : ℤ := t_1 (Memory.shift a i_5); let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x_2 : ℤ := Cint.to_uint32 i_4; ¬t_1 (Memory.shift a i_2) = (0 : ℤ) → i_1 < i → i_2 < i → i_1 ≤ i_2 → i ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_3 → Cint.is_uint32 i_6 → Cint.is_sint32 i_4 → Cint.is_sint32 i_5 → Cint.is_uint8 (t_1 (Memory.shift a i_3)) → Cint.is_uint8 x → Cint.is_uint8 x_1 → Memory.valid_rd t a_1 i → (if x_2 < i then x_2 = i_3 else Cint.to_uint32 i_5 = i_6 ∧ i_1 ≤ A_thread_variables_properties.l_size ∧ Memory.valid_rd t a_1 i_1 ∧ (if i_6 < i_1 then i_6 = i_3 else i_3 = i) ∧ ((∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < i_1 → t_1 (Memory.shift a i_7) = (0 : ℤ)) → i_5 = i_1) ∧ ((∃(i_7 : ℤ), ¬t_1 (Memory.shift a i_7) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_7 ∧ i_7 < i_1) → ¬x_1 = (0 : ℤ)) ∧ ((∃(i_7 : ℤ), ¬t_1 (Memory.shift a i_7) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_7 ∧ i_7 < i_1) → (0 : ℤ) ≤ i_5 ∧ i_5 < i_1) ∧ ((∃(i_7 : ℤ), ¬t_1 (Memory.shift a i_7) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_7 ∧ i_7 < i_1) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < i_5 → t_1 (Memory.shift a i_7) = (0 : ℤ)))) → ((∀(i_7 : ℤ), i_7 < i → i_1 ≤ i_7 → t_1 (Memory.shift a i_7) = (0 : ℤ)) → i_4 = i) → ((∃(i_7 : ℤ), ¬t_1 (Memory.shift a i_7) = (0 : ℤ) ∧ i_7 < i ∧ i_1 ≤ i_7) → ¬x = (0 : ℤ)) → ((∃(i_7 : ℤ), ¬t_1 (Memory.shift a i_7) = (0 : ℤ) ∧ i_7 < i ∧ i_1 ≤ i_7) → i_4 < i) → ((∃(i_7 : ℤ), ¬t_1 (Memory.shift a i_7) = (0 : ℤ) ∧ i_7 < i ∧ i_1 ≤ i_7) → i_4 < i ∧ i_1 ≤ i_4) → ((∃(i_7 : ℤ), ¬t_1 (Memory.shift a i_7) = (0 : ℤ) ∧ i_7 < i ∧ i_1 ≤ i_7) → (∀(i_7 : ℤ), i_1 ≤ i_7 → i_7 < i_4 → t_1 (Memory.shift a i_7) = (0 : ℤ))) → i_3 < i ∧ i_1 ≤ i_3
  := sorry
end find_next_bit_wrap_0_Why3_ide_VCfind_next_bit_wrap_0_above_post_goal4
