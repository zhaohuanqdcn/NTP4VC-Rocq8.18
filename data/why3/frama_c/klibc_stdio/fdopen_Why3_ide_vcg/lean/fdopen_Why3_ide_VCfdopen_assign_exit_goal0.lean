import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace fdopen_Why3_ide_VCfdopen_assign_exit_goal0
theorem goal0 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_sint32 i) : ¬(Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∨ (∃(i_1 : ℤ), Axiomatic.p_length_of_str_is t t_1 a i_1))
  := sorry
end fdopen_Why3_ide_VCfdopen_assign_exit_goal0
