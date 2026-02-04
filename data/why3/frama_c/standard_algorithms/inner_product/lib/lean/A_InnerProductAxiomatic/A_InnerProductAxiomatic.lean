import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.inner_product.lib.lean.Compound.Compound
import frama_c.standard_algorithms.inner_product.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace A_InnerProductAxiomatic
axiom l_innerproduct : (Memory.addr -> ℤ) -> Memory.addr -> Memory.addr -> ℤ -> ℤ -> ℤ
axiom Q_InnerProductEmpty (n : ℤ) (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (b : Memory.addr) (fact0 : n ≤ (0 : ℤ)) (fact1 : Cint.is_sint32 init_0) : l_innerproduct mint_0 a b n init_0 = init_0
axiom Q_InnerProductNext (n : ℤ) (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (b : Memory.addr) : (0 : ℤ) < n → Cint.is_sint32 init_0 → l_innerproduct mint_0 a b (n - (1 : ℤ)) init_0 + mint_0 (Memory.shift a (n - (1 : ℤ))) * mint_0 (Memory.shift b (n - (1 : ℤ))) = l_innerproduct mint_0 a b n init_0
axiom Q_InnerProductRead (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) (fact0 : Cint.is_sint32 init_0) (fact1 : Axiomatic.p_unchanged_1' mint_0 mint_1 a (0 : ℤ) n) (fact2 : Axiomatic.p_unchanged_1' mint_0 mint_1 b (0 : ℤ) n) : l_innerproduct mint_1 a b n init_0 = l_innerproduct mint_0 a b n init_0
end A_InnerProductAxiomatic
