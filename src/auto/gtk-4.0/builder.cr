require "../g_object-2.0/object"

module Gtk
  # A `GtkBuilder` reads XML descriptions of a user interface and
  # instantiates the described objects.
  #
  # To create a `GtkBuilder` from a user interface description, call
  # [ctor@Gtk.Builder.new_from_file], [ctor@Gtk.Builder.new_from_resource]
  # or [ctor@Gtk.Builder.new_from_string].
  #
  # In the (unusual) case that you want to add user interface
  # descriptions from multiple sources to the same `GtkBuilder` you can
  # call [ctor@Gtk.Builder.new] to get an empty builder and populate it by
  # (multiple) calls to [method@Gtk.Builder.add_from_file],
  # [method@Gtk.Builder.add_from_resource] or
  # [method@Gtk.Builder.add_from_string].
  #
  # A `GtkBuilder` holds a reference to all objects that it has constructed
  # and drops these references when it is finalized. This finalization can
  # cause the destruction of non-widget objects or widgets which are not
  # contained in a toplevel window. For toplevel windows constructed by a
  # builder, it is the responsibility of the user to call
  # [method@Gtk.Window.destroy] to get rid of them and all the widgets
  # they contain.
  #
  # The functions [method@Gtk.Builder.get_object] and
  # [method@Gtk.Builder.get_objects] can be used to access the widgets in
  # the interface by the names assigned to them inside the UI description.
  # Toplevel windows returned by these functions will stay around until the
  # user explicitly destroys them with [method@Gtk.Window.destroy]. Other
  # widgets will either be part of a larger hierarchy constructed by the
  # builder (in which case you should not have to worry about their lifecycle),
  # or without a parent, in which case they have to be added to some container
  # to make use of them. Non-widget objects need to be reffed with
  # g_object_ref() to keep them beyond the lifespan of the builder.
  #
  # # GtkBuilder UI Definitions
  #
  # `GtkBuilder` parses textual descriptions of user interfaces which are
  # specified in XML format. We refer to these descriptions as “GtkBuilder
  # UI definitions” or just “UI definitions” if the context is clear.
  #
  # The toplevel element is `<interface>`. It optionally takes a “domain”
  # attribute, which will make the builder look for translated strings
  # using `dgettext()` in the domain specified. This can also be done by
  # calling [method@Gtk.Builder.set_translation_domain] on the builder.
  #
  # Objects are described by `<object>` elements, which can contain
  # `<property>` elements to set properties, `<signal>` elements which
  # connect signals to handlers, and `<child>` elements, which describe
  # child objects (most often widgets inside a container, but also e.g.
  # actions in an action group, or columns in a tree model). A `<child>`
  # element contains an `<object>` element which describes the child object.
  #
  # The target toolkit version(s) are described by `<requires>` elements,
  # the “lib” attribute specifies the widget library in question (currently
  # the only supported value is “gtk”) and the “version” attribute specifies
  # the target version in the form “`<major>`.`<minor>`”. `GtkBuilder` will
  # error out if the version requirements are not met.
  #
  # Typically, the specific kind of object represented by an `<object>`
  # element is specified by the “class” attribute. If the type has not
  # been loaded yet, GTK tries to find the `get_type()` function from the
  # class name by applying heuristics. This works in most cases, but if
  # necessary, it is possible to specify the name of the `get_type()`
  # function explicitly with the "type-func" attribute.
  #
  # Objects may be given a name with the “id” attribute, which allows the
  # application to retrieve them from the builder with
  # [method@Gtk.Builder.get_object]. An id is also necessary to use the
  # object as property value in other parts of the UI definition. GTK
  # reserves ids starting and ending with `___` (three consecutive
  # underscores) for its own purposes.
  #
  # Setting properties of objects is pretty straightforward with the
  # `<property>` element: the “name” attribute specifies the name of the
  # property, and the content of the element specifies the value.
  # If the “translatable” attribute is set to a true value, GTK uses
  # `gettext()` (or `dgettext()` if the builder has a translation domain set)
  # to find a translation for the value. This happens before the value
  # is parsed, so it can be used for properties of any type, but it is
  # probably most useful for string properties. It is also possible to
  # specify a context to disambiguate short strings, and comments which
  # may help the translators.
  #
  # `GtkBuilder` can parse textual representations for the most common
  # property types: characters, strings, integers, floating-point numbers,
  # booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted
  # as %TRUE, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted
  # as %FALSE), enumerations (can be specified by their name, nick or
  # integer value), flags (can be specified by their name, nick, integer
  # value, optionally combined with “|”, e.g.
  # “GTK_INPUT_HINT_EMOJI|GTK_INPUT_HINT_LOWERCASE”)
  # and colors (in a format understood by [method@Gdk.RGBA.parse]).
  #
  # `GVariant`s can be specified in the format understood by
  # g_variant_parse(), and pixbufs can be specified as a filename of an
  # image file to load.
  #
  # Objects can be referred to by their name and by default refer to
  # objects declared in the local XML fragment and objects exposed via
  # [method@Gtk.Builder.expose_object]. In general, `GtkBuilder` allows
  # forward references to objects — declared in the local XML; an object
  # doesn’t have to be constructed before it can be referred to. The
  # exception to this rule is that an object has to be constructed before
  # it can be used as the value of a construct-only property.
  #
  # It is also possible to bind a property value to another object's
  # property value using the attributes "bind-source" to specify the
  # source object of the binding, and optionally, "bind-property" and
  # "bind-flags" to specify the source property and source binding flags
  # respectively. Internally, `GtkBuilder` implements this using `GBinding`
  # objects. For more information see g_object_bind_property().
  #
  # Sometimes it is necessary to refer to widgets which have implicitly
  # been constructed by GTK as part of a composite widget, to set
  # properties on them or to add further children (e.g. the content area
  # of a `GtkDialog`). This can be achieved by setting the “internal-child”
  # property of the `<child>` element to a true value. Note that `GtkBuilder`
  # still requires an `<object>` element for the internal child, even if it
  # has already been constructed.
  #
  # A number of widgets have different places where a child can be added
  # (e.g. tabs vs. page content in notebooks). This can be reflected in
  # a UI definition by specifying the “type” attribute on a `<child>`
  # The possible values for the “type” attribute are described in the
  # sections describing the widget-specific portions of UI definitions.
  #
  # # Signal handlers and function pointers
  #
  # Signal handlers are set up with the `<signal>` element. The “name”
  # attribute specifies the name of the signal, and the “handler” attribute
  # specifies the function to connect to the signal.
  # The remaining attributes, “after”, “swapped” and “object”, have the
  # same meaning as the corresponding parameters of the
  # g_signal_connect_object() or g_signal_connect_data() functions. A
  # “last_modification_time” attribute is also allowed, but it does not
  # have a meaning to the builder.
  #
  # If you rely on `GModule` support to lookup callbacks in the symbol table,
  # the following details should be noted:
  #
  # When compiling applications for Windows, you must declare signal callbacks
  # with %G_MODULE_EXPORT, or they will not be put in the symbol table.
  # On Linux and Unix, this is not necessary; applications should instead
  # be compiled with the -Wl,--export-dynamic `CFLAGS`, and linked against
  # `gmodule-export-2.0`.
  #
  # # A GtkBuilder UI Definition
  #
  # ```xml
  # <interface>
  #   <object class="GtkDialog" id="dialog1">
  #     <child internal-child="content_area">
  #       <object class="GtkBox" id="vbox1">
  #         <child internal-child="action_area">
  #           <object class="GtkBox" id="hbuttonbox1">
  #             <child>
  #               <object class="GtkButton" id="ok_button">
  #                 <property name="label" translatable="yes">_Ok</property>
  #                 <property name="use-underline">True</property>
  #                 <signal name="clicked" handler="ok_button_clicked"/>
  #               </object>
  #             </child>
  #           </object>
  #         </child>
  #       </object>
  #     </child>
  #   </object>
  # </interface>
  # ```
  #
  # Beyond this general structure, several object classes define their
  # own XML DTD fragments for filling in the ANY placeholders in the DTD
  # above. Note that a custom element in a <child> element gets parsed by
  # the custom tag handler of the parent object, while a custom element in
  # an <object> element gets parsed by the custom tag handler of the object.
  #
  # These XML fragments are explained in the documentation of the
  # respective objects.
  #
  # A `<template>` tag can be used to define a widget class’s components.
  # See the [GtkWidget documentation](class.Widget.html#building-composite-widgets-from-template-xml) for details.
  class Builder < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, current_object : GObject::Object? = nil, scope : Gtk::BuilderScope? = nil, translation_domain : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if current_object
        (_names.to_unsafe + _n).value = "current-object".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, current_object)
        _n += 1
      end
      if scope
        (_names.to_unsafe + _n).value = "scope".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scope)
        _n += 1
      end
      if translation_domain
        (_names.to_unsafe + _n).value = "translation-domain".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, translation_domain)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Builder.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_builder_get_type
    end

    def current_object=(value : GObject::Object?) : GObject::Object?
      unsafe_value = value

      LibGObject.g_object_set(self, "current-object", unsafe_value, Pointer(Void).null)
      value
    end

    def current_object : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "current-object", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def scope=(value : Gtk::BuilderScope?) : Gtk::BuilderScope?
      unsafe_value = value

      LibGObject.g_object_set(self, "scope", unsafe_value, Pointer(Void).null)
      value
    end

    def scope : Gtk::BuilderScope?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "scope", pointerof(value), Pointer(Void).null)
      Gtk::BuilderScope__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def translation_domain=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "translation-domain", unsafe_value, Pointer(Void).null)
      value
    end

    def translation_domain : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "translation-domain", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize
      # gtk_builder_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_builder_new
      @pointer = _retval
    end

    def self.new_from_file(filename : ::String) : Gtk::Builder
      # gtk_builder_new_from_file: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_builder_new_from_file(filename)
      Gtk::Builder.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_resource(resource_path : ::String) : Gtk::Builder
      # gtk_builder_new_from_resource: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_builder_new_from_resource(resource_path)
      Gtk::Builder.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_string(string : ::String, length : Int64) : Gtk::Builder
      # gtk_builder_new_from_string: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_builder_new_from_string(string, length)
      Gtk::Builder.new(_retval, GICrystal::Transfer::Full)
    end

    def add_from_file(filename : ::String) : Bool
      # gtk_builder_add_from_file: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_add_from_file(self, filename)
      GICrystal.to_bool(_retval)
    end

    def add_from_resource(resource_path : ::String) : Bool
      # gtk_builder_add_from_resource: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_add_from_resource(self, resource_path)
      GICrystal.to_bool(_retval)
    end

    def add_from_string(buffer : ::String, length : Int64) : Bool
      # gtk_builder_add_from_string: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_add_from_string(self, buffer, length)
      GICrystal.to_bool(_retval)
    end

    def add_objects_from_file(filename : ::String, object_ids : Enumerable(::String)) : Bool
      # gtk_builder_add_objects_from_file: (Method | Throws)
      # @object_ids: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      object_ids = object_ids.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGtk.gtk_builder_add_objects_from_file(self, filename, object_ids)
      GICrystal.to_bool(_retval)
    end

    def add_objects_from_resource(resource_path : ::String, object_ids : Enumerable(::String)) : Bool
      # gtk_builder_add_objects_from_resource: (Method | Throws)
      # @object_ids: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      object_ids = object_ids.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGtk.gtk_builder_add_objects_from_resource(self, resource_path, object_ids)
      GICrystal.to_bool(_retval)
    end

    def add_objects_from_string(buffer : ::String, length : Int64, object_ids : Enumerable(::String)) : Bool
      # gtk_builder_add_objects_from_string: (Method | Throws)
      # @object_ids: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      object_ids = object_ids.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGtk.gtk_builder_add_objects_from_string(self, buffer, length, object_ids)
      GICrystal.to_bool(_retval)
    end

    def create_closure(function_name : ::String, flags : Gtk::BuilderClosureFlags, object : GObject::Object?) : GObject::Closure?
      # gtk_builder_create_closure: (Method | Throws)
      # @object: (nullable)
      # Returns: (transfer full)

      object = if object.nil?
                 Pointer(Void).null
               else
                 object.to_unsafe
               end

      _retval = LibGtk.gtk_builder_create_closure(self, function_name, flags, object)
      GObject::Closure.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def expose_object(name : ::String, object : GObject::Object) : Nil
      # gtk_builder_expose_object: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_builder_expose_object(self, name, object)
    end

    def extend_with_template(object : GObject::Object, template_type : UInt64, buffer : ::String, length : Int64) : Bool
      # gtk_builder_extend_with_template: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_extend_with_template(self, object, template_type, buffer, length)
      GICrystal.to_bool(_retval)
    end

    def current_object : GObject::Object?
      # gtk_builder_get_current_object: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_get_current_object(self)
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def object(name : ::String) : GObject::Object?
      # gtk_builder_get_object: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_get_object(self, name)
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def objects : GLib::SList
      # gtk_builder_get_objects: (Method)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_builder_get_objects(self)
      GLib::SList(GObject::Object).new(_retval, GICrystal::Transfer::Container)
    end

    def scope : Gtk::BuilderScope
      # gtk_builder_get_scope: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_get_scope(self)
      Gtk::BuilderScope__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def translation_domain : ::String?
      # gtk_builder_get_translation_domain: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_get_translation_domain(self)
      ::String.new(_retval) unless _retval.null?
    end

    def type_from_name(type_name : ::String) : UInt64
      # gtk_builder_get_type_from_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_builder_get_type_from_name(self, type_name)
      _retval
    end

    def current_object=(current_object : GObject::Object?) : Nil
      # gtk_builder_set_current_object: (Method)
      # @current_object: (nullable)
      # Returns: (transfer none)

      current_object = if current_object.nil?
                         Pointer(Void).null
                       else
                         current_object.to_unsafe
                       end

      LibGtk.gtk_builder_set_current_object(self, current_object)
    end

    def scope=(scope : Gtk::BuilderScope?) : Nil
      # gtk_builder_set_scope: (Method)
      # @scope: (nullable)
      # Returns: (transfer none)

      scope = if scope.nil?
                Pointer(Void).null
              else
                scope.to_unsafe
              end

      LibGtk.gtk_builder_set_scope(self, scope)
    end

    def translation_domain=(domain : ::String?) : Nil
      # gtk_builder_set_translation_domain: (Method)
      # @domain: (nullable)
      # Returns: (transfer none)

      domain = if domain.nil?
                 Pointer(LibC::Char).null
               else
                 domain.to_unsafe
               end

      LibGtk.gtk_builder_set_translation_domain(self, domain)
    end

    def value_from_string(pspec : GObject::ParamSpec, string : ::String) : GObject::Value
      # gtk_builder_value_from_string: (Method | Throws)
      # @value: (out) (caller-allocates)
      # Returns: (transfer none)

      value = GObject::Value.new

      _retval = LibGtk.gtk_builder_value_from_string(self, pspec, string, value)
      value
    end

    def value_from_string_type(type : UInt64, string : ::String) : GObject::Value
      # gtk_builder_value_from_string_type: (Method | Throws)
      # @value: (out) (caller-allocates)
      # Returns: (transfer none)

      value = GObject::Value.new

      _retval = LibGtk.gtk_builder_value_from_string_type(self, type, string, value)
      value
    end
  end
end
