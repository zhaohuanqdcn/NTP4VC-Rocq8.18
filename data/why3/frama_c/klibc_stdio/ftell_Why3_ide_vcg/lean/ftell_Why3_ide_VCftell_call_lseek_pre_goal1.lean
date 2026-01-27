import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace ftell_Why3_ide_VCftell_call_lseek_pre_goal1
theorem goal1 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) : let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x : ℤ := t_1 (Memory.shift (Memory.shift a_4 (0 : ℤ)) (0 : ℤ)); a_5 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 (t_1 (Memory.shift a_4 (7 : ℤ))) → Cint.is_uint32 (t_1 (Memory.shift a_4 (8 : ℤ))) → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → Axiomatic3.p_valid_file t t_1 a_5 → Cint.is_sint32 x → (0 : ℤ) ≤ x
  := sorry
end ftell_Why3_ide_VCftell_call_lseek_pre_goal1
