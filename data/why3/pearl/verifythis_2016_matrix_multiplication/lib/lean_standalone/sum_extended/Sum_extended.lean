namespace Sum_extended
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
axiom sumf : (ℤ -> ℤ -> ℤ) -> ℤ -> ℤ -> ℤ -> ℤ
axiom sumf'def (f : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) (x : ℤ) : sumf f a b x = int.Sum.sum (f x) a b
end Sum_extended
