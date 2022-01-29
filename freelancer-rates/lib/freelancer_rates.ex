defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    percent = (100 - discount) / 100
    before_discount * percent
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) * 22
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    days_in_budget = budget / daily_discounted_rate(hourly_rate, discount)
    Float.floor(days_in_budget, 1)
  end

  defp daily_discounted_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
  end
end
