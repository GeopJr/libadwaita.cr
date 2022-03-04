require "../g_object-2.0/object"

module Gio
  # The #GSettings class provides a convenient API for storing and retrieving
  # application settings.
  #
  # Reads and writes can be considered to be non-blocking.  Reading
  # settings with #GSettings is typically extremely fast: on
  # approximately the same order of magnitude (but slower than) a
  # #GHashTable lookup.  Writing settings is also extremely fast in terms
  # of time to return to your application, but can be extremely expensive
  # for other threads and other processes.  Many settings backends
  # (including dconf) have lazy initialisation which means in the common
  # case of the user using their computer without modifying any settings
  # a lot of work can be avoided.  For dconf, the D-Bus service doesn't
  # even need to be started in this case.  For this reason, you should
  # only ever modify #GSettings keys in response to explicit user action.
  # Particular care should be paid to ensure that modifications are not
  # made during startup -- for example, when setting the initial value
  # of preferences widgets.  The built-in g_settings_bind() functionality
  # is careful not to write settings in response to notify signals as a
  # result of modifications that it makes to widgets.
  #
  # When creating a GSettings instance, you have to specify a schema
  # that describes the keys in your settings and their types and default
  # values, as well as some other information.
  #
  # Normally, a schema has a fixed path that determines where the settings
  # are stored in the conceptual global tree of settings. However, schemas
  # can also be '[relocatable][gsettings-relocatable]', i.e. not equipped with
  # a fixed path. This is
  # useful e.g. when the schema describes an 'account', and you want to be
  # able to store a arbitrary number of accounts.
  #
  # Paths must start with and end with a forward slash character ('/')
  # and must not contain two sequential slash characters.  Paths should
  # be chosen based on a domain name associated with the program or
  # library to which the settings belong.  Examples of paths are
  # "/org/gtk/settings/file-chooser/" and "/ca/desrt/dconf-editor/".
  # Paths should not start with "/apps/", "/desktop/" or "/system/" as
  # they often did in GConf.
  #
  # Unlike other configuration systems (like GConf), GSettings does not
  # restrict keys to basic types like strings and numbers. GSettings stores
  # values as #GVariant, and allows any #GVariantType for keys. Key names
  # are restricted to lowercase characters, numbers and '-'. Furthermore,
  # the names must begin with a lowercase character, must not end
  # with a '-', and must not contain consecutive dashes.
  #
  # Similar to GConf, the default values in GSettings schemas can be
  # localized, but the localized values are stored in gettext catalogs
  # and looked up with the domain that is specified in the
  # `gettext-domain` attribute of the <schemalist> or <schema>
  # elements and the category that is specified in the `l10n` attribute of
  # the <default> element. The string which is translated includes all text in
  # the <default> element, including any surrounding quotation marks.
  #
  # The `l10n` attribute must be set to `messages` or `time`, and sets the
  # [locale category for
  # translation](https://www.gnu.org/software/gettext/manual/html_node/Aspects.html#index-locale-categories-1).
  # The `messages` category should be used by default; use `time` for
  # translatable date or time formats. A translation comment can be added as an
  # XML comment immediately above the <default> element — it is recommended to
  # add these comments to aid translators understand the meaning and
  # implications of the default value. An optional translation `context`
  # attribute can be set on the <default> element to disambiguate multiple
  # defaults which use the same string.
  #
  # For example:
  # |[
  #  <!-- Translators: A list of words which are not allowed to be typed, in
  #       GVariant serialization syntax.
  #       See: https://developer.gnome.org/glib/stable/gvariant-text.html -->
  #  <default l10n='messages' context='Banned words'>['bad', 'words']</default>
  # ]|
  #
  # Translations of default values must remain syntactically valid serialized
  # #GVariants (e.g. retaining any surrounding quotation marks) or runtime
  # errors will occur.
  #
  # GSettings uses schemas in a compact binary form that is created
  # by the [glib-compile-schemas][glib-compile-schemas]
  # utility. The input is a schema description in an XML format.
  #
  # A DTD for the gschema XML format can be found here:
  # [gschema.dtd](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/gschema.dtd)
  #
  # The [glib-compile-schemas][glib-compile-schemas] tool expects schema
  # files to have the extension `.gschema.xml`.
  #
  # At runtime, schemas are identified by their id (as specified in the
  # id attribute of the <schema> element). The convention for schema
  # ids is to use a dotted name, similar in style to a D-Bus bus name,
  # e.g. "org.gnome.SessionManager". In particular, if the settings are
  # for a specific service that owns a D-Bus bus name, the D-Bus bus name
  # and schema id should match. For schemas which deal with settings not
  # associated with one named application, the id should not use
  # StudlyCaps, e.g. "org.gnome.font-rendering".
  #
  # In addition to #GVariant types, keys can have types that have
  # enumerated types. These can be described by a <choice>,
  # <enum> or <flags> element, as seen in the
  # [example][schema-enumerated]. The underlying type of such a key
  # is string, but you can use g_settings_get_enum(), g_settings_set_enum(),
  # g_settings_get_flags(), g_settings_set_flags() access the numeric values
  # corresponding to the string value of enum and flags keys.
  #
  # An example for default value:
  # |[
  # <schemalist>
  #   <schema id="org.gtk.Test" path="/org/gtk/Test/" gettext-domain="test">
  #
  #     <key name="greeting" type="s">
  #       <default l10n="messages">"Hello, earthlings"</default>
  #       <summary>A greeting</summary>
  #       <description>
  #         Greeting of the invading martians
  #       </description>
  #     </key>
  #
  #     <key name="box" type="(ii)">
  #       <default>(20,30)</default>
  #     </key>
  #
  #     <key name="empty-string" type="s">
  #       <default>""</default>
  #       <summary>Empty strings have to be provided in GVariant form</summary>
  #     </key>
  #
  #   </schema>
  # </schemalist>
  # ]|
  #
  # An example for ranges, choices and enumerated types:
  # |[
  # <schemalist>
  #
  #   <enum id="org.gtk.Test.myenum">
  #     <value nick="first" value="1"/>
  #     <value nick="second" value="2"/>
  #   </enum>
  #
  #   <flags id="org.gtk.Test.myflags">
  #     <value nick="flag1" value="1"/>
  #     <value nick="flag2" value="2"/>
  #     <value nick="flag3" value="4"/>
  #   </flags>
  #
  #   <schema id="org.gtk.Test">
  #
  #     <key name="key-with-range" type="i">
  #       <range min="1" max="100"/>
  #       <default>10</default>
  #     </key>
  #
  #     <key name="key-with-choices" type="s">
  #       <choices>
  #         <choice value='Elisabeth'/>
  #         <choice value='Annabeth'/>
  #         <choice value='Joe'/>
  #       </choices>
  #       <aliases>
  #         <alias value='Anna' target='Annabeth'/>
  #         <alias value='Beth' target='Elisabeth'/>
  #       </aliases>
  #       <default>'Joe'</default>
  #     </key>
  #
  #     <key name='enumerated-key' enum='org.gtk.Test.myenum'>
  #       <default>'first'</default>
  #     </key>
  #
  #     <key name='flags-key' flags='org.gtk.Test.myflags'>
  #       <default>["flag1","flag2"]</default>
  #     </key>
  #   </schema>
  # </schemalist>
  # ]|
  #
  # ## Vendor overrides
  #
  # Default values are defined in the schemas that get installed by
  # an application. Sometimes, it is necessary for a vendor or distributor
  # to adjust these defaults. Since patching the XML source for the schema
  # is inconvenient and error-prone,
  # [glib-compile-schemas][glib-compile-schemas] reads so-called vendor
  # override' files. These are keyfiles in the same directory as the XML
  # schema sources which can override default values. The schema id serves
  # as the group name in the key file, and the values are expected in
  # serialized GVariant form, as in the following example:
  # |[
  #     [org.gtk.Example]
  #     key1='string'
  #     key2=1.5
  # ]|
  #
  # glib-compile-schemas expects schema files to have the extension
  # `.gschema.override`.
  #
  # ## Binding
  #
  # A very convenient feature of GSettings lets you bind #GObject properties
  # directly to settings, using g_settings_bind(). Once a GObject property
  # has been bound to a setting, changes on either side are automatically
  # propagated to the other side. GSettings handles details like mapping
  # between GObject and GVariant types, and preventing infinite cycles.
  #
  # This makes it very easy to hook up a preferences dialog to the
  # underlying settings. To make this even more convenient, GSettings
  # looks for a boolean property with the name "sensitivity" and
  # automatically binds it to the writability of the bound setting.
  # If this 'magic' gets in the way, it can be suppressed with the
  # #G_SETTINGS_BIND_NO_SENSITIVITY flag.
  #
  # ## Relocatable schemas # {#gsettings-relocatable}
  #
  # A relocatable schema is one with no `path` attribute specified on its
  # <schema> element. By using g_settings_new_with_path(), a #GSettings object
  # can be instantiated for a relocatable schema, assigning a path to the
  # instance. Paths passed to g_settings_new_with_path() will typically be
  # constructed dynamically from a constant prefix plus some form of instance
  # identifier; but they must still be valid GSettings paths. Paths could also
  # be constant and used with a globally installed schema originating from a
  # dependency library.
  #
  # For example, a relocatable schema could be used to store geometry information
  # for different windows in an application. If the schema ID was
  # `org.foo.MyApp.Window`, it could be instantiated for paths
  # `/org/foo/MyApp/main/`, `/org/foo/MyApp/document-1/`,
  # `/org/foo/MyApp/document-2/`, etc. If any of the paths are well-known
  # they can be specified as <child> elements in the parent schema, e.g.:
  # |[
  # <schema id="org.foo.MyApp" path="/org/foo/MyApp/">
  #   <child name="main" schema="org.foo.MyApp.Window"/>
  # </schema>
  # ]|
  #
  # ## Build system integration # {#gsettings-build-system}
  #
  # GSettings comes with autotools integration to simplify compiling and
  # installing schemas. To add GSettings support to an application, add the
  # following to your `configure.ac`:
  # |[
  # GLIB_GSETTINGS
  # ]|
  #
  # In the appropriate `Makefile.am`, use the following snippet to compile and
  # install the named schema:
  # |[
  # gsettings_SCHEMAS = org.foo.MyApp.gschema.xml
  # EXTRA_DIST = $(gsettings_SCHEMAS)
  #
  # @GSETTINGS_RULES@
  # ]|
  #
  # No changes are needed to the build system to mark a schema XML file for
  # translation. Assuming it sets the `gettext-domain` attribute, a schema may
  # be marked for translation by adding it to `POTFILES.in`, assuming gettext
  # 0.19 is in use (the preferred method for translation):
  # |[
  # data/org.foo.MyApp.gschema.xml
  # ]|
  #
  # Alternatively, if intltool 0.50.1 is in use:
  # |[
  # [type: gettext/gsettings]data/org.foo.MyApp.gschema.xml
  # ]|
  #
  # GSettings will use gettext to look up translations for the <summary> and
  # <description> elements, and also any <default> elements which have a `l10n`
  # attribute set. Translations must not be included in the `.gschema.xml` file
  # by the build system, for example by using intltool XML rules with a
  # `.gschema.xml.in` template.
  #
  # If an enumerated type defined in a C header file is to be used in a GSettings
  # schema, it can either be defined manually using an <enum> element in the
  # schema XML, or it can be extracted automatically from the C header. This
  # approach is preferred, as it ensures the two representations are always
  # synchronised. To do so, add the following to the relevant `Makefile.am`:
  # |[
  # gsettings_ENUM_NAMESPACE = org.foo.MyApp
  # gsettings_ENUM_FILES = my-app-enums.h my-app-misc.h
  # ]|
  #
  # `gsettings_ENUM_NAMESPACE` specifies the schema namespace for the enum files,
  # which are specified in `gsettings_ENUM_FILES`. This will generate a
  # `org.foo.MyApp.enums.xml` file containing the extracted enums, which will be
  # automatically included in the schema compilation, install and uninstall
  # rules. It should not be committed to version control or included in
  # `EXTRA_DIST`.
  class Settings < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, backend : Gio::SettingsBackend? = nil, delay_apply : Bool? = nil, has_unapplied : Bool? = nil, path : ::String? = nil, schema : ::String? = nil, schema_id : ::String? = nil, settings_schema : Gio::SettingsSchema? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if backend
        (_names.to_unsafe + _n).value = "backend".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, backend)
        _n += 1
      end
      if delay_apply
        (_names.to_unsafe + _n).value = "delay-apply".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, delay_apply)
        _n += 1
      end
      if has_unapplied
        (_names.to_unsafe + _n).value = "has-unapplied".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_unapplied)
        _n += 1
      end
      if path
        (_names.to_unsafe + _n).value = "path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, path)
        _n += 1
      end
      if schema
        (_names.to_unsafe + _n).value = "schema".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, schema)
        _n += 1
      end
      if schema_id
        (_names.to_unsafe + _n).value = "schema-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, schema_id)
        _n += 1
      end
      if settings_schema
        (_names.to_unsafe + _n).value = "settings-schema".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, settings_schema)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Settings.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_settings_get_type
    end

    def backend=(value : Gio::SettingsBackend?) : Gio::SettingsBackend?
      unsafe_value = value

      LibGObject.g_object_set(self, "backend", unsafe_value, Pointer(Void).null)
      value
    end

    def backend : Gio::SettingsBackend?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "backend", pointerof(value), Pointer(Void).null)
      Gio::SettingsBackend.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def delay_apply? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "delay-apply", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_unapplied? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-unapplied", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "path", unsafe_value, Pointer(Void).null)
      value
    end

    def path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def schema=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "schema", unsafe_value, Pointer(Void).null)
      value
    end

    def schema : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "schema", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def schema_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "schema-id", unsafe_value, Pointer(Void).null)
      value
    end

    def schema_id : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "schema-id", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def settings_schema=(value : Gio::SettingsSchema?) : Gio::SettingsSchema?
      unsafe_value = value

      LibGObject.g_object_set(self, "settings-schema", unsafe_value, Pointer(Void).null)
      value
    end

    def settings_schema : Gio::SettingsSchema?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "settings-schema", pointerof(value), Pointer(Void).null)
      Gio::SettingsSchema.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(schema_id : ::String)
      # g_settings_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_new(schema_id)

      # Return value handling
      @pointer = _retval
    end

    def self.new_full(schema : Gio::SettingsSchema, backend : Gio::SettingsBackend?, path : ::String?) : self
      # g_settings_new_full: (Constructor)
      # @backend: (nullable)
      # @path: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      backend = if backend.nil?
                  Pointer(Void).null
                else
                  backend.to_unsafe
                end
      path = if path.nil?
               Pointer(LibC::Char).null
             else
               path.to_unsafe
             end

      # C call
      _retval = LibGio.g_settings_new_full(schema, backend, path)

      # Return value handling
      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_backend(schema_id : ::String, backend : Gio::SettingsBackend) : self
      # g_settings_new_with_backend: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_new_with_backend(schema_id, backend)

      # Return value handling
      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_backend_and_path(schema_id : ::String, backend : Gio::SettingsBackend, path : ::String) : self
      # g_settings_new_with_backend_and_path: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_new_with_backend_and_path(schema_id, backend, path)

      # Return value handling
      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_path(schema_id : ::String, path : ::String) : self
      # g_settings_new_with_path: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_new_with_path(schema_id, path)

      # Return value handling
      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    def self.list_relocatable_schemas : Enumerable(::String)
      # g_settings_list_relocatable_schemas: (None)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_list_relocatable_schemas

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def self.list_schemas : Enumerable(::String)
      # g_settings_list_schemas: (None)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_list_schemas

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def self.sync : Nil
      # g_settings_sync: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_sync

      # Return value handling
    end

    def self.unbind(object : GObject::Object, property : ::String) : Nil
      # g_settings_unbind: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_unbind(object, property)

      # Return value handling
    end

    def apply : Nil
      # g_settings_apply: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_apply(self)

      # Return value handling
    end

    def bind(key : ::String, object : GObject::Object, property : ::String, flags : Gio::SettingsBindFlags) : Nil
      # g_settings_bind: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_bind(self, key, object, property, flags)

      # Return value handling
    end

    def bind_writable(key : ::String, object : GObject::Object, property : ::String, inverted : Bool) : Nil
      # g_settings_bind_writable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_bind_writable(self, key, object, property, inverted)

      # Return value handling
    end

    def create_action(key : ::String) : Gio::Action
      # g_settings_create_action: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_create_action(self, key)

      # Return value handling
      Gio::Action__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def delay : Nil
      # g_settings_delay: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_delay(self)

      # Return value handling
    end

    def boolean(key : ::String) : Bool
      # g_settings_get_boolean: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_boolean(self, key)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def child(name : ::String) : Gio::Settings
      # g_settings_get_child: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_child(self, name)

      # Return value handling
      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    def default_value(key : ::String) : GLib::Variant?
      # g_settings_get_default_value: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_default_value(self, key)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def double(key : ::String) : Float64
      # g_settings_get_double: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_double(self, key)

      # Return value handling
      _retval
    end

    def enum(key : ::String) : Int32
      # g_settings_get_enum: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_enum(self, key)

      # Return value handling
      _retval
    end

    def flags(key : ::String) : UInt32
      # g_settings_get_flags: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_flags(self, key)

      # Return value handling
      _retval
    end

    def has_unapplied : Bool
      # g_settings_get_has_unapplied: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_has_unapplied(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def int(key : ::String) : Int32
      # g_settings_get_int: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_int(self, key)

      # Return value handling
      _retval
    end

    def int64(key : ::String) : Int64
      # g_settings_get_int64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_int64(self, key)

      # Return value handling
      _retval
    end

    def mapped(key : ::String, mapping : Pointer(Void), user_data : Pointer(Void)?) : Pointer(Void)?
      # g_settings_get_mapped: (Method)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGio.g_settings_get_mapped(self, key, mapping, user_data)

      # Return value handling
      _retval unless _retval.null?
    end

    def range(key : ::String) : GLib::Variant
      # g_settings_get_range: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_range(self, key)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def string(key : ::String) : ::String
      # g_settings_get_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_string(self, key)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def strv(key : ::String) : Enumerable(::String)
      # g_settings_get_strv: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_strv(self, key)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def uint(key : ::String) : UInt32
      # g_settings_get_uint: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_uint(self, key)

      # Return value handling
      _retval
    end

    def uint64(key : ::String) : UInt64
      # g_settings_get_uint64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_uint64(self, key)

      # Return value handling
      _retval
    end

    def user_value(key : ::String) : GLib::Variant?
      # g_settings_get_user_value: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_user_value(self, key)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def value(key : ::String) : GLib::Variant
      # g_settings_get_value: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_get_value(self, key)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def is_writable(name : ::String) : Bool
      # g_settings_is_writable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_is_writable(self, name)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def list_children : Enumerable(::String)
      # g_settings_list_children: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_list_children(self)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def list_keys : Enumerable(::String)
      # g_settings_list_keys: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_list_keys(self)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def range_check(key : ::String, value : _) : Bool
      # g_settings_range_check: (Method)
      # Returns: (transfer none)

      # Handle parameters
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      # C call
      _retval = LibGio.g_settings_range_check(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def reset(key : ::String) : Nil
      # g_settings_reset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_reset(self, key)

      # Return value handling
    end

    def revert : Nil
      # g_settings_revert: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_revert(self)

      # Return value handling
    end

    def set_boolean(key : ::String, value : Bool) : Bool
      # g_settings_set_boolean: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_boolean(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_double(key : ::String, value : Float64) : Bool
      # g_settings_set_double: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_double(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_enum(key : ::String, value : Int32) : Bool
      # g_settings_set_enum: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_enum(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_flags(key : ::String, value : UInt32) : Bool
      # g_settings_set_flags: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_flags(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_int(key : ::String, value : Int32) : Bool
      # g_settings_set_int: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_int(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_int64(key : ::String, value : Int64) : Bool
      # g_settings_set_int64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_int64(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_string(key : ::String, value : ::String) : Bool
      # g_settings_set_string: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_string(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_strv(key : ::String, value : Enumerable(::String)?) : Bool
      # g_settings_set_strv: (Method)
      # @value: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Handle parameters
      value = if value.nil?
                Pointer(Pointer(LibC::Char)).null
              else
                value.to_a.map(&.to_unsafe).to_unsafe
              end

      # C call
      _retval = LibGio.g_settings_set_strv(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_uint(key : ::String, value : UInt32) : Bool
      # g_settings_set_uint: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_uint(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_uint64(key : ::String, value : UInt64) : Bool
      # g_settings_set_uint64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_set_uint64(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_value(key : ::String, value : _) : Bool
      # g_settings_set_value: (Method)
      # Returns: (transfer none)

      # Handle parameters
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      # C call
      _retval = LibGio.g_settings_set_value(self, key, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    struct ChangeEventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "change-event::#{@detail}" : "change-event"
      end

      def connect(&block : Proc(Enumerable(UInt32)?, Int32, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Enumerable(UInt32)?, Int32, Bool))
        connect(block)
      end

      def connect(block : Proc(Enumerable(UInt32)?, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(UInt32), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : GICrystal.transfer_array(lib_arg0, n_keys, GICrystal::Transfer::None))
          arg1 = lib_arg1
          ::Box(Proc(Enumerable(UInt32)?, Int32, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Enumerable(UInt32)?, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(UInt32), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : GICrystal.transfer_array(lib_arg0, n_keys, GICrystal::Transfer::None))
          arg1 = lib_arg1
          ::Box(Proc(Enumerable(UInt32)?, Int32, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Settings, Enumerable(UInt32)?, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(UInt32), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : GICrystal.transfer_array(lib_arg0, n_keys, GICrystal::Transfer::None))
          arg1 = lib_arg1
          ::Box(Proc(Gio::Settings, Enumerable(UInt32)?, Int32, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Settings, Enumerable(UInt32)?, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(UInt32), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : GICrystal.transfer_array(lib_arg0, n_keys, GICrystal::Transfer::None))
          arg1 = lib_arg1
          ::Box(Proc(Gio::Settings, Enumerable(UInt32)?, Int32, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(keys : Enumerable(UInt32)?, n_keys : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "change-event", keys, n_keys)
      end
    end

    def change_event_signal
      ChangeEventSignal.new(self)
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Settings, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::Settings, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Settings, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::Settings, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(key : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed", key)
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    struct WritableChangeEventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "writable-change-event::#{@detail}" : "writable-change-event"
      end

      def connect(&block : Proc(UInt32, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, Bool))
        connect(block)
      end

      def connect(block : Proc(UInt32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(UInt32, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(UInt32, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Settings, UInt32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gio::Settings, UInt32, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Settings, UInt32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gio::Settings, UInt32, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(key : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "writable-change-event", key)
      end
    end

    def writable_change_event_signal
      WritableChangeEventSignal.new(self)
    end

    struct WritableChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "writable-changed::#{@detail}" : "writable-changed"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Settings, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::Settings, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Settings, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::Settings.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::Settings, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(key : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "writable-changed", key)
      end
    end

    def writable_changed_signal
      WritableChangedSignal.new(self)
    end
  end
end
