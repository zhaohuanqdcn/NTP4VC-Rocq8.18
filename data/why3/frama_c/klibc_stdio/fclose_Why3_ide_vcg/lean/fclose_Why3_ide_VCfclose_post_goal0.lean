import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fclose_Why3_ide_VCfclose_post_goal0
theorem goal0 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (i : ℤ) (a_5 : Memory.addr) (i_1 : ℤ) (a_6 : Memory.addr) (i_2 : ℤ) (a_7 : Memory.addr) (i_3 : ℤ) (a_10 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_8 : Memory.addr) (a_9 : Memory.addr) : let a_11 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x : ℤ := Function.update (Function.update (Function.update (Function.update t_1 (Memory.shift a_4 (8 : ℤ)) i) (Memory.shift (Memory.shift a_5 (0 : ℤ)) (2 : ℤ)) i_1) (Memory.shift (Memory.shift a_6 (0 : ℤ)) (1 : ℤ)) i_2) (Memory.shift a_7 (7 : ℤ)) i_3 (Memory.shift (Memory.shift a_10 (0 : ℤ)) (0 : ℤ)); a_11 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → (0 : ℤ) ≤ x → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 (1 : ℤ) → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_8 → Cint.is_sint32 x → (1 : ℤ) = -(1 : ℤ) ∨ (1 : ℤ) = (0 : ℤ) → a_11 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ Memory.shift a_9 (0 : ℤ) = a_11 → (1 : ℤ) = (0 : ℤ) ∨ ¬True
  := sorry
end fclose_Why3_ide_VCfclose_post_goal0
