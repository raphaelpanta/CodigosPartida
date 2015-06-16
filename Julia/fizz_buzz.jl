using Base.Test

type FizzBuzz
  result::String

  function FizzBuzz(number::Int)
    number % 15 == 0 ? new("FizzBuzz") : number % 5 == 0 ? new("Buzz") : number % 3 == 0 ? new("Fizz") : new("$(number)")
  end
end

function mapFizzBuzz(list)
  return map((x) -> FizzBuzz(x).result, list)
end

pt_test_handler(r::Test.Success) = println("$(r.expr) executado com successo!")
function pt_test_handler(r::Test.Failure)
  println("$(r.expr) executado com falhas!")
end
pt_test_handler(r::Test.Error) = rethrow(r)

Test.with_handler(pt_test_handler) do
  @test FizzBuzz(1).result == "1"

  @test FizzBuzz(3).result == "Fizz"
  @test FizzBuzz(6).result == "Fizz"
  @test FizzBuzz(9).result == "Fizz"

  @test FizzBuzz(5).result == "Buzz"
  @test FizzBuzz(10).result == "Buzz"
  @test FizzBuzz(20).result == "Buzz"

  @test FizzBuzz(15).result == "FizzBuzz"
  @test FizzBuzz(30).result == "FizzBuzz"
  @test FizzBuzz(60).result == "FizzBuzz"

  @test mapFizzBuzz([1,3,6,9,5,10,20,15,30,60]) == ["1", "Fizz", "Fizz", "Fizz", "Buzz", "Buzz", "Buzz", "FizzBuzz", "FizzBuzz", "FizzBuzz"]
end
