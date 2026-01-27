namespace real.Sum
axiom sum : (ℤ -> ℝ) -> ℤ -> ℤ -> ℝ
axiom sum'def (b : ℤ) (a : ℤ) (f : ℤ -> ℝ) : if b ≤ a then sum f a b = (0 : ℝ) else sum f a b = sum f a (b - (1 : ℤ)) + f (b - (1 : ℤ))
end real.Sum
