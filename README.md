# Return

**Here returns the `return`!**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `return` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:return, "~> 0.0.1"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/return](https://hexdocs.pm/return).

## Example

```elixir
defmodule MyModule do
  require Return
  import Return

  func simple do
    if 1 == 1, do: return "It's true"
    IO.puts "This message will never be printed"
  end

  func function_with_params_and_guard(x, y) when is_integer(x) and is_integer(y) do
    if rem(x, y) == 0, do: return :ok
    :error
  end
  
  funcp private_function do
    return :ok
    IO.puts "This message will never be printed"
  end
end
```

## TODO

*  Make anonymous functions that support `return`
*  Find a way to combine the `require` and the `import` into one directive
*  More tests
*  Publish it
