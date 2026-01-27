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
namespace memccpy_Why3_ide_VCmemccpy_exists_c_assign_part11_goal19
theorem goal19 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_2 (Memory.shift a i_2); let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_1 : ℤ := i_1 - i; let a_4 : Memory.addr := Memory.shift a x_1; let a_5 : Memory.addr := Memory.shift a_1 x_1; let a_6 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 x_1; ¬i = (0 : ℤ) → x = Cint.to_sint8 i_3 → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_3 → i_3 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_3 → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_3 i_1 → Memory.separated a_2 i_1 a_3 i_1 → Memory.addr_le a a_4 → Memory.addr_le a_1 a_5 → Memory.addr_le a_4 (Memory.shift a i_1) → Memory.addr_le a_5 (Memory.shift a_1 i_1) → ¬Memory.invalid t a_5 (1 : ℤ) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + i < i_1 → a_6 (Memory.shift a_1 i_4) = a_6 (Memory.shift a i_4)) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + i < i_1 → ¬a_6 (Memory.shift a_1 i_4) = x) → Memory.included a_5 (1 : ℤ) a_3 ((1 : ℤ) + A_PosOfChar.l_posofchar t_2 a i_3)
  := sorry
end memccpy_Why3_ide_VCmemccpy_exists_c_assign_part11_goal19
