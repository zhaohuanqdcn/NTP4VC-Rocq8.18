import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import Why3.Cint.Cint
import frama_c.should_we_balance.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace find_next_bit_wrap_Why3_ide_VCfind_next_bit_wrap_complete_below_above_nowhere_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_1 < i) (fact1 : i ≤ A_thread_variables_properties.l_size) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Cint.is_uint32 i) (fact5 : Cint.is_uint32 i_1) (fact6 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : (∀(i_2 : ℤ), i_2 < i → i_1 ≤ i_2 → t_1 (Memory.shift a i_2) = (0 : ℤ)) ∧ (∃(i_2 : ℤ), ¬t_1 (Memory.shift a i_2) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_2 ∧ i_2 < i_1) ∨ (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → t_1 (Memory.shift a i_2) = (0 : ℤ)) ∨ (∃(i_2 : ℤ), ¬t_1 (Memory.shift a i_2) = (0 : ℤ) ∧ i_2 < i ∧ i_1 ≤ i_2)
  := sorry
end find_next_bit_wrap_Why3_ide_VCfind_next_bit_wrap_complete_below_above_nowhere_goal0
