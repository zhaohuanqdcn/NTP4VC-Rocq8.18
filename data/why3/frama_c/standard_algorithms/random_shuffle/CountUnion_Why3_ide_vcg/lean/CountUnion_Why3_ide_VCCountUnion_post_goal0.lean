import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.random_shuffle.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.random_shuffle.lib.lean.Compound.Compound
import frama_c.standard_algorithms.random_shuffle.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.random_shuffle.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace CountUnion_Why3_ide_VCCountUnion_post_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (i_2 : ℤ) (t : Memory.addr -> ℤ) (fact0 : i_1 ≤ i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Cint.is_uint32 i) (fact4 : Cint.is_uint32 i_1) (fact5 : Cint.is_sint32 i_2) (fact6 : ∀(i_3 : ℤ), Cint.is_sint32 i_3 → A_Count.l_count_1' t a (0 : ℤ) i_1 i_3 + A_Count.l_count_1' t a i_1 i i_3 = A_Count.l_count_1' t a (0 : ℤ) i i_3) : A_Count.l_count_1' t a (0 : ℤ) i_1 i_2 + A_Count.l_count_1' t a i_1 i i_2 = A_Count.l_count_1' t a (0 : ℤ) i i_2
  := sorry
end CountUnion_Why3_ide_VCCountUnion_post_goal0
