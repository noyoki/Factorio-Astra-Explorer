



--Remove Coal from the oil asteroids. 
  data:extend{
    {
      type = "recipe",
      name = "crude_asteroid_chunk_crushing",
      localised_name = { "recipe-name.crude_asteroid_chunk_crushing" },
      order = "f",
      enabled = false,
      ingredients ={{ type = "item", name = "crude_asteroid_chunk_item", amount = 1 }}, 
      results ={{ type = "item", name = "solid-fuel", amount_min = 35, amount_max = 55 }}
    }
  }


