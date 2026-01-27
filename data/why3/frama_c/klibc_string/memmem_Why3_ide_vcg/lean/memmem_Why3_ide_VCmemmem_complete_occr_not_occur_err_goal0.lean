import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_complete_occr_not_occur_err_goal0
theorem goal0 (a_4 : Memory.addr) (a_5 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) : let a_6 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_7 : Memory.addr := Memory.shift a_5 (0 : ℤ); (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_5) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_6 i_1 → Memory.valid_rw t a_7 i → Memory.separated a_7 i a_6 i_1 → i = (0 : ℤ) ∨ i_1 = (0 : ℤ) ∨ i < i_1 ∨ ¬i = (0 : ℤ) ∧ ¬i_1 = (0 : ℤ) ∧ i_1 ≤ i ∧ (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i_1 ≤ i → (∃(i_3 : ℤ), ¬t_1 (Memory.shift a_3 (i_3 + i_2)) = t_1 (Memory.shift a_2 i_3) ∧ (0 : ℤ) ≤ i_3 ∧ i_3 < i_1)) ∨ ¬i = (0 : ℤ) ∧ ¬i_1 = (0 : ℤ) ∧ i_1 ≤ i ∧ (∃(i_2 : ℤ), (0 : ℤ) ≤ i_2 ∧ i_2 + i_1 ≤ i ∧ (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → t_1 (Memory.shift a_1 (i_3 + i_2)) = t_1 (Memory.shift a i_3)))
  := sorry
end memmem_Why3_ide_VCmemmem_complete_occr_not_occur_err_goal0
