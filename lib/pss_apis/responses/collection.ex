defmodule PSSApis.Responses.Collection do
  defstruct [ :collection_design_id, :collection_name, :min_combo, :max_combo, :enhancement_type, :base_enhancement_value, :flags, 
              :collection_type, :collection_description, :sprite_id, :color_string, :step_enhancement_value, :icon_sprite_id, 
              :halo_animation_id ]
end