import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memrchr_Why3_ide_VCmemrchr_loop_inv_3_preserved_goal2
theorem goal2 (i : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i - (1 : ℤ); let x_1 : ℤ := t_1 (Memory.shift a x); let x_2 : ℤ := t_1 (Memory.shift a i_2); ¬i = (0 : ℤ) → ¬x_1 = Cint.to_sint8 x_2 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Cint.to_uint32 x ≤ i_2 → -(128 : ℤ) ≤ x_2 → x_2 ≤ (126 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x_2 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1 → Cint.is_sint8 x_1 → ¬(∀(i_3 : ℤ), i ≤ i_3 → i_3 < i_1 → ¬x_2 = t_1 (Memory.shift a i_3))
  := sorry
end memrchr_Why3_ide_VCmemrchr_loop_inv_3_preserved_goal2
