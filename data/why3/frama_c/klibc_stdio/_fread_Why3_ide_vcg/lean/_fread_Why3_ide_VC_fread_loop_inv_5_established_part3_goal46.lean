import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace _fread_Why3_ide_VC_fread_loop_inv_5_established_part3_goal46
theorem goal46 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_6 : Memory.addr) (a_13 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (a_3 : Memory.addr) (a_9 : Memory.addr) (a_2 : Memory.addr) (a_8 : Memory.addr) (a_1 : Memory.addr) (a_7 : Memory.addr) (i : ℤ) (a_10 : Memory.addr) (a_4 : Memory.addr) (a_12 : Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (a_5 : Memory.addr) (a_11 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a (9 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_6 (9 : ℤ)); let a_14 : Memory.addr := Memory.shift a_13 (0 : ℤ); let a_15 : Memory.addr := t_3 (Memory.shift a_3 (4 : ℤ)); let a_16 : Memory.addr := t_3 (Memory.shift a_9 (4 : ℤ)); let a_17 : Memory.addr := t_3 (Memory.shift a_2 (3 : ℤ)); let a_18 : Memory.addr := t_3 (Memory.shift a_8 (3 : ℤ)); let a_19 : Memory.addr := Memory.shift (t_3 (Memory.shift a_1 (5 : ℤ))) (0 : ℤ); let x_2 : ℤ := (32 : ℤ) + x; let a_20 : Memory.addr := Memory.shift (t_3 (Memory.shift a_7 (5 : ℤ))) (0 : ℤ); let x_3 : ℤ := (32 : ℤ) + x_1; ¬i = (0 : ℤ) → Memory.shift a_10 (0 : ℤ) = Memory.shift a_4 (0 : ℤ) → t_1 (Memory.shift a_12 (8 : ℤ)) = (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a_10) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_13) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 x → Cint.is_uint32 x_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_5 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_11 → Memory.valid_rw t a_14 i → Memory.separated a_14 i a_15 (11 : ℤ) → Memory.separated a_14 i a_16 (11 : ℤ) → Memory.separated a_14 i a_17 (11 : ℤ) → Memory.separated a_14 i a_18 (11 : ℤ) → Memory.separated a_15 (11 : ℤ) a_17 (11 : ℤ) → Memory.separated a_16 (11 : ℤ) a_18 (11 : ℤ) → Memory.separated a_14 i a_19 x_2 → Memory.separated a_14 i a_20 x_3 → Memory.separated a_15 (11 : ℤ) a_19 x_2 → Memory.separated a_16 (11 : ℤ) a_20 x_3 → Memory.separated a_17 (11 : ℤ) a_19 x_2 → Memory.separated a_18 (11 : ℤ) a_20 x_3 → Memory.addr_le a_13 a_13
  := sorry
end _fread_Why3_ide_VC_fread_loop_inv_5_established_part3_goal46
