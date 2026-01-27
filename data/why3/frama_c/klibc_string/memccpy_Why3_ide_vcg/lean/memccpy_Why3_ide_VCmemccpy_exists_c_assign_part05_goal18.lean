import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_PosOfChar.A_PosOfChar
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace memccpy_Why3_ide_VCmemccpy_exists_c_assign_part05_goal18
theorem goal18 (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); t_1 (Memory.shift a i_2) = Cint.to_sint8 i_3 → (0 : ℤ) < i_1 → i < i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_3 → i_3 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_3 → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_3 i_1 → ¬Memory.invalid t a_3 (i_1 - i) → Memory.separated a_2 i_1 a_3 i_1 → i_1 ≤ (1 : ℤ) + i + A_PosOfChar.l_posofchar t_1 a i_3
  := sorry
end memccpy_Why3_ide_VCmemccpy_exists_c_assign_part05_goal18
