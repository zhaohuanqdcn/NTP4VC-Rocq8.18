import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import frama_c.should_we_balance.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace cpumask_copy_Why3_ide_VCcpumask_copy_loop_assign_part3_goal10
theorem goal10 (a : Memory.addr) (a_1 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr := t_3 a_2; let a_5 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_6 : Memory.addr := Memory.shift a_4 i; let a_7 : Memory.addr := t_3 a_3; let a_8 : Memory.addr := Memory.shift a_7 (0 : ℤ); let a_9 : Memory.addr := Memory.shift a_7 i; let a_10 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_8 A_thread_variables_properties.l_size; let a_11 : ℤ := a_10 a_6; ¬Cint.to_uint32 i = A_thread_variables_properties.l_size → (0 : ℤ) ≤ i → i ≤ A_thread_variables_properties.l_size → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (2147483646 : ℤ) → Memory.framed t_3 → Memory.linked t → Cint.is_sint32 i → Memory.valid_rd t a (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_5 A_thread_variables_properties.l_size → Memory.valid_rd t a_6 (1 : ℤ) → Memory.valid_rw t a_8 A_thread_variables_properties.l_size → Memory.valid_rw t a_9 (1 : ℤ) → ¬Memory.invalid t a_9 (1 : ℤ) → Memory.separated a_8 A_thread_variables_properties.l_size a_5 A_thread_variables_properties.l_size → Cint.is_uint8 a_11 → a_11 = (0 : ℤ) ∨ a_11 = (1 : ℤ) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → (¬a_10 (Memory.shift a_7 i_1) = (0 : ℤ)) = (¬a_10 (Memory.shift a_4 i_1) = (0 : ℤ))) → Memory.included a_9 (1 : ℤ) a_8 A_thread_variables_properties.l_size
  := sorry
end cpumask_copy_Why3_ide_VCcpumask_copy_loop_assign_part3_goal10
