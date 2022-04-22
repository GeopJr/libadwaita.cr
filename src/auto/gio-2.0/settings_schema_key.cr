module Gio
  # #GSettingsSchemaKey is an opaque data structure and can only be accessed
  # using the following functions.
  class SettingsSchemaKey
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(SettingsSchemaKey.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(SettingsSchemaKey.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::SettingsSchemaKey)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_settings_schema_key_get_type
    end

    def default_value : GLib::Variant
      # g_settings_schema_key_get_default_value: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_schema_key_get_default_value(self)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def description : ::String?
      # g_settings_schema_key_get_description: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_schema_key_get_description(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def name : ::String
      # g_settings_schema_key_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_schema_key_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    def range : GLib::Variant
      # g_settings_schema_key_get_range: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_schema_key_get_range(self)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def summary : ::String?
      # g_settings_schema_key_get_summary: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_schema_key_get_summary(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def value_type : GLib::VariantType
      # g_settings_schema_key_get_value_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_schema_key_get_value_type(self)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None)
    end

    def range_check(value : _) : Bool
      # g_settings_schema_key_range_check: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGio.g_settings_schema_key_range_check(self, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def ref : Gio::SettingsSchemaKey
      # g_settings_schema_key_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_schema_key_ref(self)

      # Return value handling

      Gio::SettingsSchemaKey.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_settings_schema_key_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_schema_key_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
