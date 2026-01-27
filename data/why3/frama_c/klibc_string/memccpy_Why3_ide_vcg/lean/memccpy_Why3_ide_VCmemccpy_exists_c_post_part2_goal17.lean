import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memccpy_Why3_ide_VCmemccpy_exists_c_post_part2_goal17
theorem goal17 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_2 (Memory.shift a i_1); let a_2 : Memory.addr := Memory.shift a i; let a_3 : Memory.addr := Memory.shift a_1 i; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_6 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_5 i; x = Cint.to_sint8 i_2 → (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_2 → i_2 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_sint32 i_2 → Memory.addr_le a a_2 → Memory.addr_le a_1 a_3 → Memory.addr_le a_2 a_2 → Memory.addr_le a_3 a_3 → Memory.valid_rw t a_4 i → Memory.valid_rw t a_5 i → Memory.separated a_4 i a_5 i → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i → a_6 (Memory.shift a_1 i_3) = a_6 (Memory.shift a i_3)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i → ¬a_6 (Memory.shift a_1 i_3) = x) → (∃(i_3 : ℤ), Memory.shift a_1 ((1 : ℤ) + i_3) = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∧ a_6 (Memory.shift a i_3) = x ∧ (0 : ℤ) ≤ i_3 ∧ i_3 < i ∧ (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 ≤ i_3 → a_6 (Memory.shift a_1 i_4) = a_6 (Memory.shift a i_4)) ∧ (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_3 → ¬a_6 (Memory.shift a i_4) = x))
  := sorry
end memccpy_Why3_ide_VCmemccpy_exists_c_post_part2_goal17
