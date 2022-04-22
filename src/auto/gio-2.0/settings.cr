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
  # %G_SETTINGS_BIND_NO_SENSITIVITY flag.
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
  @[GObject::GeneratedWrapper]
  class Settings < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SettingsClass), class_init,
        sizeof(LibGio::Settings), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, backend : Gio::SettingsBackend? = nil, delay_apply : Bool? = nil, has_unapplied : Bool? = nil, path : ::String? = nil, schema : ::String? = nil, schema_id : ::String? = nil, settings_schema : Gio::SettingsSchema? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if !backend.nil?
        (_names.to_unsafe + _n).value = "backend".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, backend)
        _n += 1
      end
      if !delay_apply.nil?
        (_names.to_unsafe + _n).value = "delay-apply".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, delay_apply)
        _n += 1
      end
      if !has_unapplied.nil?
        (_names.to_unsafe + _n).value = "has-unapplied".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_unapplied)
        _n += 1
      end
      if !path.nil?
        (_names.to_unsafe + _n).value = "path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, path)
        _n += 1
      end
      if !schema.nil?
        (_names.to_unsafe + _n).value = "schema".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, schema)
        _n += 1
      end
      if !schema_id.nil?
        (_names.to_unsafe + _n).value = "schema-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, schema_id)
        _n += 1
      end
      if !settings_schema.nil?
        (_names.to_unsafe + _n).value = "settings-schema".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, settings_schema)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Settings.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a new #GSettings object with the schema specified by
    # @schema_id.
    #
    # It is an error for the schema to not exist: schemas are an
    # essential part of a program, as they provide type information.
    # If schemas need to be dynamically loaded (for example, from an
    # optional runtime dependency), g_settings_schema_source_lookup()
    # can be used to test for their existence before loading them.
    #
    # Signals on the newly created #GSettings object will be dispatched
    # via the thread-default #GMainContext in effect at the time of the
    # call to g_settings_new().  The new #GSettings will hold a reference
    # on the context.  See g_main_context_push_thread_default().
    def initialize(schema_id : ::String)
      # g_settings_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_new(schema_id)

      # Return value handling

      @pointer = _retval
    end

    # Creates a new #GSettings object with a given schema, backend and
    # path.
    #
    # It should be extremely rare that you ever want to use this function.
    # It is made available for advanced use-cases (such as plugin systems
    # that want to provide access to schemas loaded from custom locations,
    # etc).
    #
    # At the most basic level, a #GSettings object is a pure composition of
    # 4 things: a #GSettingsSchema, a #GSettingsBackend, a path within that
    # backend, and a #GMainContext to which signals are dispatched.
    #
    # This constructor therefore gives you full control over constructing
    # #GSettings instances.  The first 3 parameters are given directly as
    # @schema, @backend and @path, and the main context is taken from the
    # thread-default (as per g_settings_new()).
    #
    # If @backend is %NULL then the default backend is used.
    #
    # If @path is %NULL then the path from the schema is used.  It is an
    # error if @path is %NULL and the schema has no path of its own or if
    # @path is non-%NULL and not equal to the path that the schema does
    # have.
    def self.new_full(schema : Gio::SettingsSchema, backend : Gio::SettingsBackend?, path : ::String?) : self
      # g_settings_new_full: (Constructor)
      # @backend: (nullable)
      # @path: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      backend = if backend.nil?
                  Pointer(Void).null
                else
                  backend.to_unsafe
                end

      # Generator::NullableArrayPlan
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

    # Creates a new #GSettings object with the schema specified by
    # @schema_id and a given #GSettingsBackend.
    #
    # Creating a #GSettings object with a different backend allows accessing
    # settings from a database other than the usual one. For example, it may make
    # sense to pass a backend corresponding to the "defaults" settings database on
    # the system to get a settings object that modifies the system default
    # settings instead of the settings for this user.
    def self.new_with_backend(schema_id : ::String, backend : Gio::SettingsBackend) : self
      # g_settings_new_with_backend: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_new_with_backend(schema_id, backend)

      # Return value handling

      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GSettings object with the schema specified by
    # @schema_id and a given #GSettingsBackend and path.
    #
    # This is a mix of g_settings_new_with_backend() and
    # g_settings_new_with_path().
    def self.new_with_backend_and_path(schema_id : ::String, backend : Gio::SettingsBackend, path : ::String) : self
      # g_settings_new_with_backend_and_path: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_new_with_backend_and_path(schema_id, backend, path)

      # Return value handling

      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GSettings object with the relocatable schema specified
    # by @schema_id and a given path.
    #
    # You only need to do this if you want to directly create a settings
    # object with a schema that doesn't have a specified path of its own.
    # That's quite rare.
    #
    # It is a programmer error to call this function for a schema that
    # has an explicitly specified path.
    #
    # It is a programmer error if @path is not a valid path.  A valid path
    # begins and ends with '/' and does not contain two consecutive '/'
    # characters.
    def self.new_with_path(schema_id : ::String, path : ::String) : self
      # g_settings_new_with_path: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_new_with_path(schema_id, path)

      # Return value handling

      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    # Deprecated.
    def self.list_relocatable_schemas : Enumerable(::String)
      # g_settings_list_relocatable_schemas: (None)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_settings_list_relocatable_schemas

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Deprecated.
    def self.list_schemas : Enumerable(::String)
      # g_settings_list_schemas: (None)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_settings_list_schemas

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Ensures that all pending operations are complete for the default backend.
    #
    # Writes made to a #GSettings are handled asynchronously.  For this
    # reason, it is very unlikely that the changes have it to disk by the
    # time g_settings_set() returns.
    #
    # This call will block until all of the writes have made it to the
    # backend.  Since the mainloop is not running, no change notifications
    # will be dispatched during this call (but some may be queued by the
    # time the call is done).
    def self.sync : Nil
      # g_settings_sync: (None)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_sync

      # Return value handling
    end

    # Removes an existing binding for @property on @object.
    #
    # Note that bindings are automatically removed when the
    # object is finalized, so it is rarely necessary to call this
    # function.
    def self.unbind(object : GObject::Object, property : ::String) : Nil
      # g_settings_unbind: (None)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_unbind(object, property)

      # Return value handling
    end

    # Applies any changes that have been made to the settings.  This
    # function does nothing unless @settings is in 'delay-apply' mode;
    # see g_settings_delay().  In the normal case settings are always
    # applied immediately.
    def apply : Nil
      # g_settings_apply: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_apply(self)

      # Return value handling
    end

    # Create a binding between the @key in the @settings object
    # and the property @property of @object.
    #
    # The binding uses the default GIO mapping functions to map
    # between the settings and property values. These functions
    # handle booleans, numeric types and string types in a
    # straightforward way. Use g_settings_bind_with_mapping() if
    # you need a custom mapping, or map between types that are not
    # supported by the default mapping functions.
    #
    # Unless the @flags include %G_SETTINGS_BIND_NO_SENSITIVITY, this
    # function also establishes a binding between the writability of
    # @key and the "sensitive" property of @object (if @object has
    # a boolean property by that name). See g_settings_bind_writable()
    # for more details about writable bindings.
    #
    # Note that the lifecycle of the binding is tied to @object,
    # and that you can have only one binding per object property.
    # If you bind the same property twice on the same object, the second
    # binding overrides the first one.
    def bind(key : ::String, object : GObject::Object, property : ::String, flags : Gio::SettingsBindFlags) : Nil
      # g_settings_bind: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_bind(self, key, object, property, flags)

      # Return value handling
    end

    # Create a binding between the writability of @key in the
    # @settings object and the property @property of @object.
    # The property must be boolean; "sensitive" or "visible"
    # properties of widgets are the most likely candidates.
    #
    # Writable bindings are always uni-directional; changes of the
    # writability of the setting will be propagated to the object
    # property, not the other way.
    #
    # When the @inverted argument is %TRUE, the binding inverts the
    # value as it passes from the setting to the object, i.e. @property
    # will be set to %TRUE if the key is not writable.
    #
    # Note that the lifecycle of the binding is tied to @object,
    # and that you can have only one binding per object property.
    # If you bind the same property twice on the same object, the second
    # binding overrides the first one.
    def bind_writable(key : ::String, object : GObject::Object, property : ::String, inverted : Bool) : Nil
      # g_settings_bind_writable: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_bind_writable(self, key, object, property, inverted)

      # Return value handling
    end

    # Creates a #GAction corresponding to a given #GSettings key.
    #
    # The action has the same name as the key.
    #
    # The value of the key becomes the state of the action and the action
    # is enabled when the key is writable.  Changing the state of the
    # action results in the key being written to.  Changes to the value or
    # writability of the key cause appropriate change notifications to be
    # emitted for the action.
    #
    # For boolean-valued keys, action activations take no parameter and
    # result in the toggling of the value.  For all other types,
    # activations take the new value for the key (which must have the
    # correct type).
    def create_action(key : ::String) : Gio::Action
      # g_settings_create_action: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_create_action(self, key)

      # Return value handling

      Gio::Action__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Changes the #GSettings object into 'delay-apply' mode. In this
    # mode, changes to @settings are not immediately propagated to the
    # backend, but kept locally until g_settings_apply() is called.
    def delay : Nil
      # g_settings_delay: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_delay(self)

      # Return value handling
    end

    # Gets the value that is stored at @key in @settings.
    #
    # A convenience variant of g_settings_get() for booleans.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a boolean type in the schema for @settings.
    def boolean(key : ::String) : Bool
      # g_settings_get_boolean: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_boolean(self, key)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a child settings object which has a base path of
    # `base-path/@name`, where `base-path` is the base path of
    # @settings.
    #
    # The schema for the child settings object must have been declared
    # in the schema of @settings using a `<child>` element.
    #
    # The created child settings object will inherit the #GSettings:delay-apply
    # mode from @settings.
    def child(name : ::String) : Gio::Settings
      # g_settings_get_child: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_get_child(self, name)

      # Return value handling

      Gio::Settings.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the "default value" of a key.
    #
    # This is the value that would be read if g_settings_reset() were to be
    # called on the key.
    #
    # Note that this may be a different value than returned by
    # g_settings_schema_key_get_default_value() if the system administrator
    # has provided a default value.
    #
    # Comparing the return values of g_settings_get_default_value() and
    # g_settings_get_value() is not sufficient for determining if a value
    # has been set because the user may have explicitly set the value to
    # something that happens to be equal to the default.  The difference
    # here is that if the default changes in the future, the user's key
    # will still be set.
    #
    # This function may be useful for adding an indication to a UI of what
    # the default value was before the user set it.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings.
    def default_value(key : ::String) : GLib::Variant?
      # g_settings_get_default_value: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_get_default_value(self, key)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the value that is stored at @key in @settings.
    #
    # A convenience variant of g_settings_get() for doubles.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a 'double' type in the schema for @settings.
    def double(key : ::String) : Float64
      # g_settings_get_double: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_double(self, key)

      # Return value handling

      _retval
    end

    # Gets the value that is stored in @settings for @key and converts it
    # to the enum value that it represents.
    #
    # In order to use this function the type of the value must be a string
    # and it must be marked in the schema file as an enumerated type.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings or is not marked as an enumerated type.
    #
    # If the value stored in the configuration database is not a valid
    # value for the enumerated type then this function will return the
    # default value.
    def enum(key : ::String) : Int32
      # g_settings_get_enum: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_enum(self, key)

      # Return value handling

      _retval
    end

    # Gets the value that is stored in @settings for @key and converts it
    # to the flags value that it represents.
    #
    # In order to use this function the type of the value must be an array
    # of strings and it must be marked in the schema file as a flags type.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings or is not marked as a flags type.
    #
    # If the value stored in the configuration database is not a valid
    # value for the flags type then this function will return the default
    # value.
    def flags(key : ::String) : UInt32
      # g_settings_get_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_flags(self, key)

      # Return value handling

      _retval
    end

    # Returns whether the #GSettings object has any unapplied
    # changes.  This can only be the case if it is in 'delayed-apply' mode.
    def has_unapplied : Bool
      # g_settings_get_has_unapplied: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_has_unapplied(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value that is stored at @key in @settings.
    #
    # A convenience variant of g_settings_get() for 32-bit integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a int32 type in the schema for @settings.
    def int(key : ::String) : Int32
      # g_settings_get_int: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_int(self, key)

      # Return value handling

      _retval
    end

    # Gets the value that is stored at @key in @settings.
    #
    # A convenience variant of g_settings_get() for 64-bit integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a int64 type in the schema for @settings.
    def int64(key : ::String) : Int64
      # g_settings_get_int64: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_int64(self, key)

      # Return value handling

      _retval
    end

    # Gets the value that is stored at @key in @settings, subject to
    # application-level validation/mapping.
    #
    # You should use this function when the application needs to perform
    # some processing on the value of the key (for example, parsing).  The
    # @mapping function performs that processing.  If the function
    # indicates that the processing was unsuccessful (due to a parse error,
    # for example) then the mapping is tried again with another value.
    #
    # This allows a robust 'fall back to defaults' behaviour to be
    # implemented somewhat automatically.
    #
    # The first value that is tried is the user's setting for the key.  If
    # the mapping function fails to map this value, other values may be
    # tried in an unspecified order (system or site defaults, translated
    # schema default values, untranslated schema default values, etc).
    #
    # If the mapping function fails for all possible values, one additional
    # attempt is made: the mapping function is called with a %NULL value.
    # If the mapping function still indicates failure at this point then
    # the application will be aborted.
    #
    # The result parameter for the @mapping function is pointed to a
    # #gpointer which is initially set to %NULL.  The same pointer is given
    # to each invocation of @mapping.  The final value of that #gpointer is
    # what is returned by this function.  %NULL is valid; it is returned
    # just as any other value would be.
    def mapped(key : ::String, mapping : Pointer(Void), user_data : Pointer(Void)?) : Pointer(Void)?
      # g_settings_get_mapped: (Method)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
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

    # Queries the range of a key.
    def range(key : ::String) : GLib::Variant
      # g_settings_get_range: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_get_range(self, key)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the value that is stored at @key in @settings.
    #
    # A convenience variant of g_settings_get() for strings.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a string type in the schema for @settings.
    def string(key : ::String) : ::String
      # g_settings_get_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_get_string(self, key)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # A convenience variant of g_settings_get() for string arrays.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having an array of strings type in the schema for @settings.
    def strv(key : ::String) : Enumerable(::String)
      # g_settings_get_strv: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_settings_get_strv(self, key)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Gets the value that is stored at @key in @settings.
    #
    # A convenience variant of g_settings_get() for 32-bit unsigned
    # integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a uint32 type in the schema for @settings.
    def uint(key : ::String) : UInt32
      # g_settings_get_uint: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_uint(self, key)

      # Return value handling

      _retval
    end

    # Gets the value that is stored at @key in @settings.
    #
    # A convenience variant of g_settings_get() for 64-bit unsigned
    # integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a uint64 type in the schema for @settings.
    def uint64(key : ::String) : UInt64
      # g_settings_get_uint64: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_get_uint64(self, key)

      # Return value handling

      _retval
    end

    # Checks the "user value" of a key, if there is one.
    #
    # The user value of a key is the last value that was set by the user.
    #
    # After calling g_settings_reset() this function should always return
    # %NULL (assuming something is not wrong with the system
    # configuration).
    #
    # It is possible that g_settings_get_value() will return a different
    # value than this function.  This can happen in the case that the user
    # set a value for a key that was subsequently locked down by the system
    # administrator -- this function will return the user's old value.
    #
    # This function may be useful for adding a "reset" option to a UI or
    # for providing indication that a particular value has been changed.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings.
    def user_value(key : ::String) : GLib::Variant?
      # g_settings_get_user_value: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_get_user_value(self, key)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the value that is stored in @settings for @key.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings.
    def value(key : ::String) : GLib::Variant
      # g_settings_get_value: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_get_value(self, key)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Finds out if a key can be written or not
    def is_writable(name : ::String) : Bool
      # g_settings_is_writable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_is_writable(self, name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the list of children on @settings.
    #
    # The list is exactly the list of strings for which it is not an error
    # to call g_settings_get_child().
    #
    # There is little reason to call this function from "normal" code, since
    # you should already know what children are in your schema. This function
    # may still be useful there for introspection reasons, however.
    #
    # You should free the return value with g_strfreev() when you are done
    # with it.
    def list_children : Enumerable(::String)
      # g_settings_list_children: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_settings_list_children(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Introspects the list of keys on @settings.
    #
    # You should probably not be calling this function from "normal" code
    # (since you should already know what keys are in your schema).  This
    # function is intended for introspection reasons.
    #
    # You should free the return value with g_strfreev() when you are done
    # with it.
    def list_keys : Enumerable(::String)
      # g_settings_list_keys: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_settings_list_keys(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Checks if the given @value is of the correct type and within the
    # permitted range for @key.
    def range_check(key : ::String, value : _) : Bool
      # g_settings_range_check: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGio.g_settings_range_check(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Resets @key to its default value.
    #
    # This call resets the key, as much as possible, to its default value.
    # That might be the value specified in the schema or the one set by the
    # administrator.
    def reset(key : ::String) : Nil
      # g_settings_reset: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_reset(self, key)

      # Return value handling
    end

    # Reverts all non-applied changes to the settings.  This function
    # does nothing unless @settings is in 'delay-apply' mode; see
    # g_settings_delay().  In the normal case settings are always applied
    # immediately.
    #
    # Change notifications will be emitted for affected keys.
    def revert : Nil
      # g_settings_revert: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_revert(self)

      # Return value handling
    end

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for booleans.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a boolean type in the schema for @settings.
    def set_boolean(key : ::String, value : Bool) : Bool
      # g_settings_set_boolean: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_boolean(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for doubles.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a 'double' type in the schema for @settings.
    def set_double(key : ::String, value : Float64) : Bool
      # g_settings_set_double: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_double(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Looks up the enumerated type nick for @value and writes it to @key,
    # within @settings.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings or is not marked as an enumerated type, or for
    # @value not to be a valid value for the named type.
    #
    # After performing the write, accessing @key directly with
    # g_settings_get_string() will return the 'nick' associated with
    # @value.
    def set_enum(key : ::String, value : Int32) : Bool
      # g_settings_set_enum: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_enum(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Looks up the flags type nicks for the bits specified by @value, puts
    # them in an array of strings and writes the array to @key, within
    # @settings.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings or is not marked as a flags type, or for @value
    # to contain any bits that are not value for the named type.
    #
    # After performing the write, accessing @key directly with
    # g_settings_get_strv() will return an array of 'nicks'; one for each
    # bit in @value.
    def set_flags(key : ::String, value : UInt32) : Bool
      # g_settings_set_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_flags(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for 32-bit integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a int32 type in the schema for @settings.
    def set_int(key : ::String, value : Int32) : Bool
      # g_settings_set_int: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_int(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for 64-bit integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a int64 type in the schema for @settings.
    def set_int64(key : ::String, value : Int64) : Bool
      # g_settings_set_int64: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_int64(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for strings.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a string type in the schema for @settings.
    def set_string(key : ::String, value : ::String) : Bool
      # g_settings_set_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_string(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for string arrays.  If
    # @value is %NULL, then @key is set to be the empty array.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having an array of strings type in the schema for @settings.
    def set_strv(key : ::String, value : Enumerable(::String)?) : Bool
      # g_settings_set_strv: (Method)
      # @value: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
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

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for 32-bit unsigned
    # integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a uint32 type in the schema for @settings.
    def set_uint(key : ::String, value : UInt32) : Bool
      # g_settings_set_uint: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_uint(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @key in @settings to @value.
    #
    # A convenience variant of g_settings_set() for 64-bit unsigned
    # integers.
    #
    # It is a programmer error to give a @key that isn't specified as
    # having a uint64 type in the schema for @settings.
    def set_uint64(key : ::String, value : UInt64) : Bool
      # g_settings_set_uint64: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_settings_set_uint64(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @key in @settings to @value.
    #
    # It is a programmer error to give a @key that isn't contained in the
    # schema for @settings or for @value to have the incorrect type, per
    # the schema.
    #
    # If @value is floating then this function consumes the reference.
    def set_value(key : ::String, value : _) : Bool
      # g_settings_set_value: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGio.g_settings_set_value(self, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # The "change-event" signal is emitted once per change event that
    # affects this settings object.  You should connect to this signal
    # only if you are interested in viewing groups of changes before they
    # are split out into multiple emissions of the "changed" signal.
    # For most use cases it is more appropriate to use the "changed" signal.
    #
    # In the event that the change event applies to one or more specified
    # keys, @keys will be an array of #GQuark of length @n_keys.  In the
    # event that the change event applies to the #GSettings object as a
    # whole (ie: potentially every key has been changed) then @keys will
    # be %NULL and @n_keys will be 0.
    #
    # The default handler for this signal invokes the "changed" signal
    # for each affected key.  If any other connected handler returns
    # %TRUE then this default functionality will be suppressed.
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
          _retval = ::Box(Proc(Enumerable(UInt32)?, Int32, Bool)).unbox(box).call(arg0, arg1)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Enumerable(UInt32)?, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(UInt32), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : GICrystal.transfer_array(lib_arg0, n_keys, GICrystal::Transfer::None))
          arg1 = lib_arg1
          _retval = ::Box(Proc(Enumerable(UInt32)?, Int32, Bool)).unbox(box).call(arg0, arg1)
          _retval
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

    # The "changed" signal is emitted when a key has potentially changed.
    # You should call one of the g_settings_get() calls to check the new
    # value.
    #
    # This signal supports detailed connections.  You can connect to the
    # detailed signal "changed::x" in order to only receive callbacks
    # when key "x" changes.
    #
    # Note that @settings only emits this signal if you have read @key at
    # least once while a signal handler was already connected for @key.
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

    # The "writable-change-event" signal is emitted once per writability
    # change event that affects this settings object.  You should connect
    # to this signal if you are interested in viewing groups of changes
    # before they are split out into multiple emissions of the
    # "writable-changed" signal.  For most use cases it is more
    # appropriate to use the "writable-changed" signal.
    #
    # In the event that the writability change applies only to a single
    # key, @key will be set to the #GQuark for that key.  In the event
    # that the writability change affects the entire settings object,
    # @key will be 0.
    #
    # The default handler for this signal invokes the "writable-changed"
    # and "changed" signals for each affected key.  This is done because
    # changes in writability might also imply changes in value (if for
    # example, a new mandatory setting is introduced).  If any other
    # connected handler returns %TRUE then this default functionality
    # will be suppressed.
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
          _retval = ::Box(Proc(UInt32, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          _retval = ::Box(Proc(UInt32, Bool)).unbox(box).call(arg0)
          _retval
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

    # The "writable-changed" signal is emitted when the writability of a
    # key has potentially changed.  You should call
    # g_settings_is_writable() in order to determine the new status.
    #
    # This signal supports detailed connections.  You can connect to the
    # detailed signal "writable-changed::x" in order to only receive
    # callbacks when the writability of "x" changes.
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
