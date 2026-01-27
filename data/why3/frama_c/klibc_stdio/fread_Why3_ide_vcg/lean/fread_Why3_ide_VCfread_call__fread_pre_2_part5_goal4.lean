import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace fread_Why3_ide_VCfread_call__fread_pre_2_part5_goal4
theorem goal4 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_3 : Memory.addr) (a_4 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_2 : Memory.addr) (a_1 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a (9 : ℤ)); Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 x → Memory.separated (t_2 (Memory.shift a_2 (4 : ℤ))) (11 : ℤ) (Memory.shift (t_2 (Memory.shift a_1 (5 : ℤ))) (0 : ℤ)) ((32 : ℤ) + x)
  := sorry
end fread_Why3_ide_VCfread_call__fread_pre_2_part5_goal4
