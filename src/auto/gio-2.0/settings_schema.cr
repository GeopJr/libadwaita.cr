module Gio
  # The #GSettingsSchemaSource and #GSettingsSchema APIs provide a
  # mechanism for advanced control over the loading of schemas and a
  # mechanism for introspecting their content.
  #
  # Plugin loading systems that wish to provide plugins a way to access
  # settings face the problem of how to make the schemas for these
  # settings visible to GSettings.  Typically, a plugin will want to ship
  # the schema along with itself and it won't be installed into the
  # standard system directories for schemas.
  #
  # #GSettingsSchemaSource provides a mechanism for dealing with this by
  # allowing the creation of a new 'schema source' from which schemas can
  # be acquired.  This schema source can then become part of the metadata
  # associated with the plugin and queried whenever the plugin requires
  # access to some settings.
  #
  # Consider the following example:
  #
  # |[<!-- language="C" -->
  # typedef struct
  # {
  #    ...
  #    GSettingsSchemaSource *schema_source;
  #    ...
  # } Plugin;
  #
  # Plugin *
  # initialise_plugin (const gchar *dir)
  # {
  #   Plugin *plugin;
  #
  #   ...
  #
  #   plugin->schema_source =
  #     g_settings_schema_source_new_from_directory (dir,
  #       g_settings_schema_source_get_default (), FALSE, NULL);
  #
  #   ...
  #
  #   return plugin;
  # }
  #
  # ...
  #
  # GSettings *
  # plugin_get_settings (Plugin      *plugin,
  #                      const gchar *schema_id)
  # {
  #   GSettingsSchema *schema;
  #
  #   if (schema_id == NULL)
  #     schema_id = plugin->identifier;
  #
  #   schema = g_settings_schema_source_lookup (plugin->schema_source,
  #                                             schema_id, FALSE);
  #
  #   if (schema == NULL)
  #     {
  #       ... disable the plugin or abort, etc ...
  #     }
  #
  #   return g_settings_new_full (schema, NULL, NULL);
  # }
  # ]|
  #
  # The code above shows how hooks should be added to the code that
  # initialises (or enables) the plugin to create the schema source and
  # how an API can be added to the plugin system to provide a convenient
  # way for the plugin to access its settings, using the schemas that it
  # ships.
  #
  # From the standpoint of the plugin, it would need to ensure that it
  # ships a gschemas.compiled file as part of itself, and then simply do
  # the following:
  #
  # |[<!-- language="C" -->
  # {
  #   GSettings *settings;
  #   gint some_value;
  #
  #   settings = plugin_get_settings (self, NULL);
  #   some_value = g_settings_get_int (settings, "some-value");
  #   ...
  # }
  # ]|
  #
  # It's also possible that the plugin system expects the schema source
  # files (ie: .gschema.xml files) instead of a gschemas.compiled file.
  # In that case, the plugin loading system must compile the schemas for
  # itself before attempting to create the settings source.
  class SettingsSchema
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(SettingsSchema.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(SettingsSchema.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_settings_schema_get_type
    end

    def id : ::String
      # g_settings_schema_get_id: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_settings_schema_get_id(self)
      ::String.new(_retval)
    end

    def key(name : ::String) : Gio::SettingsSchemaKey
      # g_settings_schema_get_key: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_settings_schema_get_key(self, name)
      Gio::SettingsSchemaKey.new(_retval, GICrystal::Transfer::Full)
    end

    def path : ::String?
      # g_settings_schema_get_path: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_settings_schema_get_path(self)
      ::String.new(_retval) unless _retval.null?
    end

    def has_key(name : ::String) : Bool
      # g_settings_schema_has_key: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_settings_schema_has_key(self, name)
      GICrystal.to_bool(_retval)
    end

    def list_children : Enumerable(::String)
      # g_settings_schema_list_children: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_settings_schema_list_children(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def list_keys : Enumerable(::String)
      # g_settings_schema_list_keys: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_settings_schema_list_keys(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def ref : Gio::SettingsSchema
      # g_settings_schema_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_settings_schema_ref(self)
      Gio::SettingsSchema.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_settings_schema_unref: (Method)
      # Returns: (transfer none)

      LibGio.g_settings_schema_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
