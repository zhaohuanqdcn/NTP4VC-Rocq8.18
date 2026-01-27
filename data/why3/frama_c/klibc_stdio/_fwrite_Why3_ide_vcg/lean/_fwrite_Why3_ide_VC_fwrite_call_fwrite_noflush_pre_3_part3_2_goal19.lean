import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace _fwrite_Why3_ide_VC_fwrite_call_fwrite_noflush_pre_3_part3_2_goal19
theorem goal19 (i : ℤ) (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_5 : Memory.addr) (a_4 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (fact0 : ¬i = (0 : ℤ)) (fact1 : Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ)) (fact2 : t_1 (Memory.shift a_5 (10 : ℤ)) = (1 : ℤ)) (fact3 : (0 : ℤ) ≤ i) (fact4 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact5 : Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ)) (fact6 : Memory.framed t_3) (fact7 : Memory.linked t) (fact8 : Memory.sconst t_2) (fact9 : Cint.is_uint32 i) (fact10 : Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1) (fact11 : Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3) (fact12 : Memory.valid_rw t (Memory.shift a_4 (0 : ℤ)) i) (fact13 : ∀(i_1 : ℤ), (0 : ℤ) < i_1 → i_1 ≤ i → ¬t_2 (Memory.shift a_4 (i_1 - (1 : ℤ))) = (10 : ℤ)) : Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_5
  := sorry
end _fwrite_Why3_ide_VC_fwrite_call_fwrite_noflush_pre_3_part3_2_goal19
