namespace A_Count
axiom l_count_1' : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ -> ℤ -> ℤ
axiom Q_CountSectionEmpty (n : ℤ) (m : ℤ) (v : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : n ≤ m) (fact1 : Cint.is_sint32 v) : l_count_1' mint_0 a m n v = (0 : ℤ)
axiom Q_CountSectionHit (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (v : ℤ) (m : ℤ) : mint_0 (Memory.shift a (n - (1 : ℤ))) = v → m < n → Cint.is_sint32 v → (1 : ℤ) + l_count_1' mint_0 a m (n - (1 : ℤ)) v = l_count_1' mint_0 a m n v
axiom Q_CountSectionMiss (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (v : ℤ) (m : ℤ) : ¬mint_0 (Memory.shift a (n - (1 : ℤ))) = v → m < n → Cint.is_sint32 v → l_count_1' mint_0 a m (n - (1 : ℤ)) v = l_count_1' mint_0 a m n v
axiom Q_CountSectionRead (v : ℤ) (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (fact0 : Cint.is_sint32 v) (fact1 : Axiomatic.p_unchanged_1' mint_0 mint_1 a m n) : l_count_1' mint_1 a m n v = l_count_1' mint_0 a m n v
end A_Count
