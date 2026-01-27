import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import frama_c.should_we_balance.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace cpumask_copy_Why3_ide_VCcpumask_copy_assert_rte_mem_access_2_goal6
theorem goal6 (t_3 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := t_3 (Memory.shift a (0 : ℤ)); let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_5 : Memory.addr := t_3 a_4; let a_6 : Memory.addr := Memory.shift a_5 (0 : ℤ); let a_7 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_6 A_thread_variables_properties.l_size; ¬Cint.to_uint32 i = A_thread_variables_properties.l_size → (0 : ℤ) ≤ i → i ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Cint.is_sint32 i → Memory.valid_rd t a (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_3 A_thread_variables_properties.l_size → Memory.valid_rw t a_6 A_thread_variables_properties.l_size → Memory.separated a_6 A_thread_variables_properties.l_size a_3 A_thread_variables_properties.l_size → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → (¬a_7 (Memory.shift a_5 i_1) = (0 : ℤ)) = (¬a_7 (Memory.shift a_2 i_1) = (0 : ℤ))) → Memory.valid_rd t a_4 (1 : ℤ)
  := sorry
end cpumask_copy_Why3_ide_VCcpumask_copy_assert_rte_mem_access_2_goal6
