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
  # Base class for all errors in this module.
  class PangoCairoError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # Flags

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    Cairo.raise_exception(error)
    Pango.raise_exception(error)
    GObject.raise_exception(error)
  end

  extend self
end

# Extra includes
