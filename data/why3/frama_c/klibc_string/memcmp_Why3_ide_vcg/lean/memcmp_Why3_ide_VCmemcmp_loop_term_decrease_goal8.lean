import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcmp_Why3_ide_VCmemcmp_loop_term_decrease_goal8
theorem goal8 (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_5 : Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) : let x : ℤ := i_1 - i; let x_1 : ℤ := t_1 (Memory.shift a_3 x); let x_2 : ℤ := t_1 (Memory.shift a_2 x); let a_6 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_7 : Memory.addr := Memory.shift a_5 (0 : ℤ); ¬i = (0 : ℤ) → x_1 = x_2 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_5) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_6 i_1 → Memory.valid_rw t a_7 i_1 → Memory.separated a_7 i_1 a_6 i_1 → Cint.is_uint8 x_2 → Cint.is_uint8 x_1 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i < i_1 → t_1 (Memory.shift a_1 i_2) = t_1 (Memory.shift a i_2)) → Cint.to_uint32 (i - (1 : ℤ)) < i
  := sorry
end memcmp_Why3_ide_VCmemcmp_loop_term_decrease_goal8
