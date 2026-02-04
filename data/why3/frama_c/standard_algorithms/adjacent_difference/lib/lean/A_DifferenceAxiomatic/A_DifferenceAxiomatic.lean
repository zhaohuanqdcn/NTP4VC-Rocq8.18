import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_difference.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_difference.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace A_DifferenceAxiomatic
axiom l_difference : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ
axiom Q_TL_Difference (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) : Cint.is_sint32 (l_difference mint_0 a n)
axiom Q_DifferenceEmptyOrSingle (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : n ≤ (0 : ℤ)) : mint_0 (Memory.shift a (0 : ℤ)) = l_difference mint_0 a n
axiom Q_DifferenceNext (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : (0 : ℤ) < n) : mint_0 (Memory.shift a n) = l_difference mint_0 a n + mint_0 (Memory.shift a (n - (1 : ℤ)))
axiom Q_DifferenceRead (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (fact0 : Axiomatic.p_unchanged_1' mint_0 mint_1 a (0 : ℤ) ((1 : ℤ) + n)) : l_difference mint_1 a n = l_difference mint_0 a n
end A_DifferenceAxiomatic
