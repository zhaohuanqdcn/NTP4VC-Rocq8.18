namespace Fact
axiom fact : ℤ -> ℤ
axiom fact'def (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then fact n = (1 : ℤ) else fact n = n * fact (n - (1 : ℤ))
end Fact
