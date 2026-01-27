import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memccpy_Why3_ide_VCmemccpy_not_exists_c_assign_part05_goal23
theorem goal23 (a : Memory.addr) (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) < i_1 → i < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_2 → i_2 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_3 i_1 → ¬Memory.invalid t a_3 (i_1 - i) → Memory.separated a_2 i_1 a_3 i_1 → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → ¬t_1 (Memory.shift a i_3) = Cint.to_sint8 i_2) → (0 : ℤ) ≤ i
  := sorry
end memccpy_Why3_ide_VCmemccpy_not_exists_c_assign_part05_goal23
