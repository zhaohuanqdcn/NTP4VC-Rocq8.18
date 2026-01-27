import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
import pearl.euler002_vcg.lean.euler002.FibSumEven
import pearl.euler002_vcg.lean.euler002.FibOnlyEven
open Classical
open Lean4Why3
namespace euler002_Solve_fqtvc
theorem f'vc (m : ℤ) (fact0 : (0 : ℤ) ≤ m) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) = FibOnlyEven.fib_even (0 : ℤ) ∧ (0 : ℤ) = Fibonacci.fib (0 : ℤ) ∧ (2 : ℤ) = FibOnlyEven.fib_even ((0 : ℤ) + (1 : ℤ)) ∧ (2 : ℤ) = Fibonacci.fib ((0 : ℤ) + (3 : ℤ)) ∧ (0 : ℤ) = FibSumEven.fib_sum_even m (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < (2 : ℤ) ∧ (∀(k : ℤ) (n : ℤ), (0 : ℤ) ≤ n ∧ (0 : ℤ) ≤ k ∧ FibOnlyEven.fib_even n = Fibonacci.fib k ∧ FibOnlyEven.fib_even (n + (1 : ℤ)) = Fibonacci.fib (k + (3 : ℤ)) ∧ (0 : ℤ) ≤ FibOnlyEven.fib_even n ∧ FibOnlyEven.fib_even n < FibOnlyEven.fib_even (n + (1 : ℤ)) → (if FibOnlyEven.fib_even n ≤ m then ((0 : ℤ) ≤ m - FibOnlyEven.fib_even n ∧ m - FibOnlyEven.fib_even (n + (1 : ℤ)) < m - FibOnlyEven.fib_even n) ∧ (0 : ℤ) ≤ n + (1 : ℤ) ∧ (0 : ℤ) ≤ k + (3 : ℤ) ∧ FibOnlyEven.fib_even (n + (1 : ℤ)) = Fibonacci.fib (k + (3 : ℤ)) ∧ (4 : ℤ) * FibOnlyEven.fib_even (n + (1 : ℤ)) + FibOnlyEven.fib_even n = FibOnlyEven.fib_even (n + (1 : ℤ) + (1 : ℤ)) ∧ (4 : ℤ) * FibOnlyEven.fib_even (n + (1 : ℤ)) + FibOnlyEven.fib_even n = Fibonacci.fib (k + (3 : ℤ) + (3 : ℤ)) ∧ FibSumEven.fib_sum_even m k + FibOnlyEven.fib_even n = FibSumEven.fib_sum_even m (k + (3 : ℤ)) ∧ (0 : ℤ) ≤ FibOnlyEven.fib_even (n + (1 : ℤ)) ∧ FibOnlyEven.fib_even (n + (1 : ℤ)) < (4 : ℤ) * FibOnlyEven.fib_even (n + (1 : ℤ)) + FibOnlyEven.fib_even n else ∃(n1 : ℤ), FibSumEven.fib_sum_even m k = FibSumEven.fib_sum_even m n1 ∧ m < Fibonacci.fib n1))
  := sorry
end euler002_Solve_fqtvc
