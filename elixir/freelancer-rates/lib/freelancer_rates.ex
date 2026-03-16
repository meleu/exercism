defmodule FreelancerRates do
  @working_hours_in_a_day 8.0
  @working_days_in_a_month 22

  def daily_rate(hourly_rate) do
    hourly_rate * @working_hours_in_a_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * @working_days_in_a_month)
    |> apply_discount(discount)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_with_discount =
      daily_rate(hourly_rate)
      |> apply_discount(discount)

    (budget / daily_rate_with_discount)
    |> Float.floor(1)
  end
end
