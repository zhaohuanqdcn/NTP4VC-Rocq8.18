namespace A_Length
axiom l_length : (Memory.addr -> ℤ) -> Memory.addr -> ℤ
axiom Q_string_length (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (n : ℤ) (fact0 : Axiomatic.p_length_of_str_is malloc_0 mchar_0 s n) : l_length mchar_0 s = n
end A_Length
