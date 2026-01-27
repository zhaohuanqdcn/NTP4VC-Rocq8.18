import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace _fwrite_Why3_ide_VC_fwrite_disjoint_def_ionbf_iolbf_iofbf_part4_goal4
theorem goal4 (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a_5 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (i : ℤ) (a_8 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_4 (10 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_5 (10 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a_6 (10 : ℤ)); let x_3 : ℤ := t_1 (Memory.shift a_7 (10 : ℤ)); Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_8) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 x → Cint.is_uint32 x_1 → Cint.is_uint32 x_2 → Cint.is_uint32 x_3 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → Memory.valid_rw t (Memory.shift a_8 (0 : ℤ)) i → x = (2 : ℤ) ∨ x_1 = (1 : ℤ) ∨ x_2 = (0 : ℤ) ∨ ¬x_3 = (2 : ℤ)
  := sorry
end _fwrite_Why3_ide_VC_fwrite_disjoint_def_ionbf_iolbf_iofbf_part4_goal4
