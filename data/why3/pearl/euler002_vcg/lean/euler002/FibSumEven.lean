import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace FibSumEven
axiom fib_sum_even : ℤ -> ℤ -> ℤ
axiom SumZero (m : ℤ) : fib_sum_even m (0 : ℤ) = (0 : ℤ)
axiom SumEvenLe (n : ℤ) (m : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : Fibonacci.fib n ≤ m) (fact2 : Int.tmod (Fibonacci.fib n) (2 : ℤ) = (0 : ℤ)) : fib_sum_even m (n + (1 : ℤ)) = fib_sum_even m n + Fibonacci.fib n
axiom SumEvenGt (n : ℤ) (m : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : m < Fibonacci.fib n) (fact2 : Int.tmod (Fibonacci.fib n) (2 : ℤ) = (0 : ℤ)) : fib_sum_even m (n + (1 : ℤ)) = fib_sum_even m n
axiom SumOdd (n : ℤ) (m : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : ¬Int.tmod (Fibonacci.fib n) (2 : ℤ) = (0 : ℤ)) : fib_sum_even m (n + (1 : ℤ)) = fib_sum_even m n
noncomputable def is_fib_sum_even (m : ℤ) (sum : ℤ) := ∃(n : ℤ), sum = fib_sum_even m n ∧ m < Fibonacci.fib n
end FibSumEven
