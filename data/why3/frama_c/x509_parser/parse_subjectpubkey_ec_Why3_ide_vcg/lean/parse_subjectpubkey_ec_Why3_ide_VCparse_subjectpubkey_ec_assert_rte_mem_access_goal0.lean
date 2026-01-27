import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_subjectpubkey_ec_Why3_ide_VCparse_subjectpubkey_ec_assert_rte_mem_access_goal0
theorem goal0 (i : ℤ) (i_2 : ℤ) (a_1 : Memory.addr) (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (fact0 : ¬i = (0 : ℤ)) (fact1 : ¬i_2 = (0 : ℤ)) (fact2 : ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1) (fact3 : (0 : ℤ) ≤ i) (fact4 : i_1 ≤ i) (fact5 : i_2 ≤ i) (fact6 : i_1 + i_2 ≤ i) (fact7 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact8 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact9 : (2 : ℤ) ≤ i_1) (fact10 : Memory.framed t_1) (fact11 : Memory.linked t) (fact12 : Cint.is_uint16 i) (fact13 : Cint.is_uint16 i_1) (fact14 : Cint.is_uint16 i_2) (fact15 : (0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : Memory.valid_rd t (Memory.shift a_1 i_1) (1 : ℤ)
  := sorry
end parse_subjectpubkey_ec_Why3_ide_VCparse_subjectpubkey_ec_assert_rte_mem_access_goal0
