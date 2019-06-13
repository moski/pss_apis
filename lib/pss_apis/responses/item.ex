defmodule PSSApis.Responses.Item do
  defstruct [ :item_design_id, :item_design_name, :item_design_key, :item_design_description, :image_sprite_id, :logo_sprite_id, 
              :item_space, :item_type, :gas_cost, :mineral_cost, :rank, :min_room_level, :build_time, :root_item_design_id, 
              :item_sub_type, :enhancement_type, :enhancement_value, :market_price, :drop_chance, :ingredients, :rarity, :module_type, 
              :module_argument, :flags, :fair_price, :min_ship_level, :manufacture_cost, :item_design_name_en, :content, 
              :race_id, :required_research_design_id, :parent_item_design_id, :craft_design_id, :missile_design_id, 
              :character_part_id, :active_animation_id, :animation_id, :border_sprite_id, :sound_file_id, :character_design_id, :training_design_id ]
end