# {{cookiecutter.proj_name}}.ex -*- mode: elixir -*-

defmodule Ex{{cookiecutter.proj_name|title}} do
  @moduledoc """
  Documentation for `Ex{{cookiecutter.proj_name|title}}`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> {{cookiecutter.proj_name|title}}.hello()
      :world

  """
  def hello do
    :world
  end
end
