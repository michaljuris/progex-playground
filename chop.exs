defmodule Chop do
  def guess(actual, range = low..high) do
    guess = div(low+high, 2)
    IO.puts "Is it #{guess}"
    guess(actual, guess, range)
  end

  def guess(actual, actual, _), do: actual
  def guess(actual, guess, _low..high) when guess < actual, do: guess(actual, guess+1..high)
  def guess(actual, guess, low.._high) when guess > actual, do: guess(actual, low..guess-1)

  def sum([]), do: 0
  def sum([head| tail]), do: head + sum(tail)
end
