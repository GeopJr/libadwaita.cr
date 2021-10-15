# Dependencies
require "../cairo-1.0/cairo.cr"
require "../pango-1.0/pango.cr"
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_pango_cairo.cr"

# Wrappers
require "./font.cr"
require "./font_map.cr"

module PangoCairo
  extend self
end

# Extra includes
