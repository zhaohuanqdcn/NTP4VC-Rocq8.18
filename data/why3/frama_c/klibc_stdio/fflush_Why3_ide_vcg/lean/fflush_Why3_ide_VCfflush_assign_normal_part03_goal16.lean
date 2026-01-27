import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fflush_Why3_ide_VCfflush_assign_normal_part03_goal16
theorem goal16 (a_2 : Memory.addr) (a_8 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_7 : Memory.addr) (a_4 : Memory.addr) (a_6 : Memory.addr) (a_5 : Memory.addr) : let a_9 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_10 : Memory.addr := Memory.shift a_8 (8 : ℤ); ¬a_9 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → a_9 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → -(1 : ℤ) ≤ i → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_8 → ¬Memory.invalid t a_10 (1 : ℤ) → a_10 = Memory.shift a_7 (7 : ℤ) ∨ a_10 = Memory.shift a_4 (8 : ℤ) ∨ Memory.shift (Memory.shift a_6 (0 : ℤ)) (1 : ℤ) = a_10 ∨ Memory.shift (Memory.shift a_5 (0 : ℤ)) (2 : ℤ) = a_10
  := sorry
end fflush_Why3_ide_VCfflush_assign_normal_part03_goal16
