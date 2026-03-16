defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 -> (legacy? && :unknown) || :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> (legacy? && :unknown) || :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      to_label(level, legacy?) in [:error, :fatal] -> :ops
      legacy? and to_label(level, legacy?) == :unknown -> :dev1
      to_label(level, legacy?) == :unknown -> :dev2
      true -> false
    end
  end
end
