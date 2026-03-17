defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  # def remove(list) do
  #   List.delete_at(list, 0)
  # end
  #
  # def first(list) do
  #   List.first(list)
  # end

  # idiomatic version
  def remove([_ | tail]) do
    tail
  end

  def first([head | _]) do
    head
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
