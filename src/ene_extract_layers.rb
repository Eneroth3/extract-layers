require 'extensions.rb'

# Eneroth Extensions
module Eneroth

# Eneroth ExtractLayers
module ExtractLayers

  path = __FILE__
  path.force_encoding("UTF-8") if path.respond_to?(:force_encoding)

  PLUGIN_ID = File.basename(path, ".*")
  PLUGIN_DIR = File.join(File.dirname(path), PLUGIN_ID)

  EXTENSION = SketchupExtension.new(
    "Eneroth Extract layers",
    File.join(PLUGIN_DIR, "main")
  )
  EXTENSION.creator     = "Eneroth3"
  EXTENSION.description =
    "Extract Layers to new file, e.g. for re-use in new model."
  EXTENSION.version     = "1.0.0"
  EXTENSION.copyright   = "2018, #{EXTENSION.creator}"
  Sketchup.register_extension(EXTENSION, true)

end
end
