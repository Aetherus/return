defmodule ReturnTest do
  use ExUnit.Case
  doctest Return

  use Return

  test "simple function" do
    assert :ok = simple_fn()
  end

  test "function with params" do
    assert :ok = equals(1, 1)
  end

  test "function with guard" do
    assert true = list?([])
  end

  test "return with expression" do
    assert :ok = return_expression() 
  end

  func simple_fn do
    if true, do: return :ok
    :error
  end

  func equals(x, y) do
    if x == y, do: return :ok
    :error
  end

  func list?(value) when is_list(value) do 
    return true
    :error
  end

  func list?(_) do
    return false
    :error
  end

  func return_expression do
    return if true, do: :ok
    :error 
  end
end
