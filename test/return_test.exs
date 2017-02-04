defmodule ReturnTest do
  use ExUnit.Case
  doctest Return

  require Return
  import Return

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

  function simple_fn do
    if true, do: return :ok
    :error
  end

  function equals(x, y) do
    if x == y, do: return :ok
    :error
  end

  function list?(value) when is_list(value) do 
    return true
    :error
  end

  function list?(_) do
    return false
    :error
  end

  function return_expression do
    return if true, do: :ok
    :error 
  end
end
