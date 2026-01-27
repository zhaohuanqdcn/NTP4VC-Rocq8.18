import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strndup_Why3_ide_VCstrndup_call_memcpy_pre_2_goal3
theorem goal3 (i_1 : ℤ) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := Cint.to_uint32 ((1 : ℤ) + i_1); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → ((0 : ℤ) < x → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) x) → ((∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬t_1 (Memory.shift a i_2) = (0 : ℤ)) → i_1 = i) → ((∃(i_2 : ℤ), t_1 (Memory.shift a i_2) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_2 ∧ i_2 < i) → i_1 ≤ i) → (0 : ℤ) ≤ i_1
  := sorry
end strndup_Why3_ide_VCstrndup_call_memcpy_pre_2_goal3
