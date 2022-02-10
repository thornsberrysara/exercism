defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    case volume_pair do
      {:cup, value} -> {:milliliter, value * 240}
      {:fluid_ounce, value} -> {:milliliter, value * 30}
      {:teaspoon, value} -> {:milliliter, value * 5}
      {:tablespoon, value} -> {:milliliter, value * 15}
      {_, _} -> volume_pair
    end
  end

  def from_milliliter(volume_pair, unit = :cup) do
    {unit, get_volume(volume_pair) / 240}
  end

  def from_milliliter(volume_pair, unit = :fluid_ounce) do
    {unit, get_volume(volume_pair) / 30}
  end

  def from_milliliter(volume_pair, unit = :teaspoon) do
    {unit, get_volume(volume_pair) / 5}
  end

  def from_milliliter(volume_pair, unit = :tablespoon) do
    {unit, get_volume(volume_pair) / 15}
  end

  def from_milliliter(volume_pair, unit) do
    {unit, get_volume(volume_pair)}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
