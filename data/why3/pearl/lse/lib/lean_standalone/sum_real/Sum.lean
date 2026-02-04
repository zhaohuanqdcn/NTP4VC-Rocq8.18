namespace sum_real.Sum
axiom sum : (ℤ -> ℝ) -> ℤ -> ℤ -> ℝ
axiom sum'def (b : ℤ) (a : ℤ) (f : ℤ -> ℝ) : if b ≤ a then sum f a b = (0 : ℝ) else sum f a b = sum f a (b - (1 : ℤ)) + f (b - (1 : ℤ))
axiom abs_fun : (ℤ -> ℝ) -> ℤ -> ℝ
axiom abs_fun'def (f : ℤ -> ℝ) (i : ℤ) : abs_fun f i = abs (f i)
end sum_real.Sum
