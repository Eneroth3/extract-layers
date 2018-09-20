module Eneroth
module ExtractLayers

  def self.extract_layers
    path = UI.savepanel("Extract Layers", "Layers.skp", "")
    return unless path

    model = Sketchup.active_model
    model.start_operation("_", true)
    draw_layer_component.save_as(path)
    model.abort_operation
  end

  def self.draw_layer_component
    model = Sketchup.active_model
    definition = model.definitions.add
    side = Math.sqrt(model.layers.size).ceil
    grid = 1.m
    model.layers.each_with_index do |layer, i|
      row = i % side
      col = i / side
      face = definition.entities.add_face(
        Geom::Point3d.new(col * grid, row * grid, 0),
        Geom::Point3d.new((col + 1) * grid, row * grid, 0),
        Geom::Point3d.new((col + 1) * grid, (row + 1) * grid, 0),
        Geom::Point3d.new(col * grid, (row + 1) * grid, 0),
      )
      face.layer = layer
    end

    definition
  end

  unless @loaded
    @loaded = true
    UI.menu("Plugins").add_item(EXTENSION.name) { extract_layers }
  end

end
end
