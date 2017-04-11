defmodule Return do
  @moduledoc """
  Provide the `return` keyword and the context where `return` works.

  ## Example

      defmodule MyModule do
        use Return

        func my_func do
          if true do
            return :ok
          end
          :error
        end
      end
  """

  defmacro __using__(_) do
    quote do
      require unquote(__MODULE__)
      import unquote(__MODULE__)
    end
  end

  @doc """
  Define a public function in which the `return` keyword works.
  """
  defmacro func(signature, do: block) do
    quote do
      def unquote(signature) do
        try do
          unquote(block)
        catch
          {:return, value} -> value
        end
      end
    end
  end

  @doc """
  Define a private function in which the `return` keyword works.
  """
  defmacro funcp(signature, do: block) do
    quote do
      defp unquote(signature) do
        try do
          unquote(block)
        catch
          {:return, value} -> value
        end
      end
    end
  end

  @doc """
  The `return` keyword itself.
  """
  defmacro return(expr) do
    quote do
      throw {:return, unquote(expr)}
    end
  end

end
