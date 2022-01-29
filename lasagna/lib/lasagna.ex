defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(r) do
    expected_minutes_in_oven() - r
  end

  def preparation_time_in_minutes(l) do
    l * 2
  end

  def total_time_in_minutes(l, r) do
    preparation_time_in_minutes(l) + (expected_minutes_in_oven() - remaining_minutes_in_oven(r))
  end

  def alarm() do
    "Ding!"
  end
end
