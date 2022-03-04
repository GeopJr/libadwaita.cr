module GLib
  # A utility type for constructing container-type #GVariant instances.
  #
  # This is an opaque structure and may only be accessed using the
  # following functions.
  #
  # #GVariantBuilder is not threadsafe in any way.  Do not attempt to
  # access it from more than one thread.
  class VariantBuilder
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(VariantBuilder.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(VariantBuilder.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_variant_builder_get_type
    end

    def initialize(type : GLib::VariantType)
      # g_variant_builder_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGLib.g_variant_builder_new(type)

      # Return value handling
      @pointer = _retval
    end

    def add_value(value : _) : Nil
      # g_variant_builder_add_value: (Method)
      # Returns: (transfer none)

      # Handle parameters
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      # C call
      LibGLib.g_variant_builder_add_value(self, value)

      # Return value handling
    end

    def close : Nil
      # g_variant_builder_close: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_variant_builder_close(self)

      # Return value handling
    end

    def _end : GLib::Variant
      # g_variant_builder_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_variant_builder_end(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    def open(type : GLib::VariantType) : Nil
      # g_variant_builder_open: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_variant_builder_open(self, type)

      # Return value handling
    end

    def ref : GLib::VariantBuilder
      # g_variant_builder_ref: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGLib.g_variant_builder_ref(self)

      # Return value handling
      GLib::VariantBuilder.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_variant_builder_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_variant_builder_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
