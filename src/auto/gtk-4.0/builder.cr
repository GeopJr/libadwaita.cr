require "../g_object-2.0/object"

module Gtk
  # A `GtkBuilder` reads XML descriptions of a user interface and
  # instantiates the described objects.
  #
  # To create a `GtkBuilder` from a user interface description, call
  # `Gtk::Builder#new_from_file`, `Gtk::Builder#new_from_resource`
  # or `Gtk::Builder#new_from_string`.
  #
  # In the (unusual) case that you want to add user interface
  # descriptions from multiple sources to the same `GtkBuilder` you can
  # call `Gtk::Builder.new` to get an empty builder and populate it by
  # (multiple) calls to `Gtk::Builder#add_from_file`,
  # `Gtk::Builder#add_from_resource` or
  # `Gtk::Builder#add_from_string`.
  #
  # A `GtkBuilder` holds a reference to all objects that it has constructed
  # and drops these references when it is finalized. This finalization can
  # cause the destruction of non-widget objects or widgets which are not
  # contained in a toplevel window. For toplevel windows constructed by a
  # builder, it is the responsibility of the user to call
  # `Gtk::Window#destroy` to get rid of them and all the widgets
  # they contain.
  #
  # The functions `Gtk::Builder#object` and
  # `Gtk::Builder#objects` can be used to access the widgets in
  # the interface by the names assigned to them inside the UI description.
  # Toplevel windows returned by these functions will stay around until the
  # user explicitly destroys them with `Gtk::Window#destroy`. Other
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
  # calling `Gtk::Builder#translation_domain=` on the builder.
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
  # `Gtk::Builder#object`. An id is also necessary to use the
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
  # and colors (in a format understood by `Gdk::RGBA#parse`).
  #
  # `GVariant`s can be specified in the format understood by
  # g_variant_parse(), and pixbufs can be specified as a filename of an
  # image file to load.
  #
  # Objects can be referred to by their name and by default refer to
  # objects declared in the local XML fragment and objects exposed via
  # `Gtk::Builder#expose_object`. In general, `GtkBuilder` allows
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
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
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
  @[GObject::GeneratedWrapper]
  class Builder < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::BuilderClass), class_init,
        sizeof(LibGtk::Builder), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, current_object : GObject::Object? = nil, scope : Gtk::BuilderScope? = nil, translation_domain : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !current_object.nil?
        (_names.to_unsafe + _n).value = "current-object".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, current_object)
        _n += 1
      end
      if !scope.nil?
        (_names.to_unsafe + _n).value = "scope".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scope)
        _n += 1
      end
      if !translation_domain.nil?
        (_names.to_unsafe + _n).value = "translation-domain".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, translation_domain)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Builder.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new empty builder object.
    #
    # This function is only useful if you intend to make multiple calls
    # to `Gtk::Builder#add_from_file`, `Gtk::Builder#add_from_resource`
    # or `Gtk::Builder#add_from_string` in order to merge multiple UI
    # descriptions into a single builder.
    def initialize
      # gtk_builder_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_builder_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Parses the UI definition in the file @filename.
    #
    # If there is an error opening the file or parsing the description then
    # the program will be aborted. You should only ever attempt to parse
    # user interface descriptions that are shipped as part of your program.
    def self.new_from_file(filename : ::String) : self
      # gtk_builder_new_from_file: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_builder_new_from_file(filename)

      # Return value handling

      Gtk::Builder.new(_retval, GICrystal::Transfer::Full)
    end

    # Parses the UI definition at @resource_path.
    #
    # If there is an error locating the resource or parsing the
    # description, then the program will be aborted.
    def self.new_from_resource(resource_path : ::String) : self
      # gtk_builder_new_from_resource: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_builder_new_from_resource(resource_path)

      # Return value handling

      Gtk::Builder.new(_retval, GICrystal::Transfer::Full)
    end

    # Parses the UI definition in @string.
    #
    # If @string is %NULL-terminated, then @length should be -1.
    # If @length is not -1, then it is the length of @string.
    #
    # If there is an error parsing @string then the program will be
    # aborted. You should not attempt to parse user interface description
    # from untrusted sources.
    def self.new_from_string(string : ::String, length : Int64) : self
      # gtk_builder_new_from_string: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_builder_new_from_string(string, length)

      # Return value handling

      Gtk::Builder.new(_retval, GICrystal::Transfer::Full)
    end

    # Parses a file containing a UI definition and merges it with
    # the current contents of @builder.
    #
    # This function is useful if you need to call
    # `Gtk::Builder#current_object=`) to add user data to
    # callbacks before loading GtkBuilder UI. Otherwise, you probably
    # want `Gtk::Builder#new_from_file` instead.
    #
    # If an error occurs, 0 will be returned and @error will be assigned a
    # `GError` from the `GTK_BUILDER_ERROR`, `G_MARKUP_ERROR` or `G_FILE_ERROR`
    # domains.
    #
    # It’s not really reasonable to attempt to handle failures of this
    # call. You should not use this function with untrusted files (ie:
    # files that are not part of your application). Broken `GtkBuilder`
    # files can easily crash your program, and it’s possible that memory
    # was leaked leading up to the reported failure. The only reasonable
    # thing to do when an error is detected is to call `g_error()`.
    def add_from_file(filename : ::String) : Bool
      # gtk_builder_add_from_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_builder_add_from_file(self, filename, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Parses a resource file containing a UI definition
    # and merges it with the current contents of @builder.
    #
    # This function is useful if you need to call
    # `Gtk::Builder#current_object=` to add user data to
    # callbacks before loading GtkBuilder UI. Otherwise, you probably
    # want `Gtk::Builder#new_from_resource` instead.
    #
    # If an error occurs, 0 will be returned and @error will be assigned a
    # `GError` from the %GTK_BUILDER_ERROR, %G_MARKUP_ERROR or %G_RESOURCE_ERROR
    # domain.
    #
    # It’s not really reasonable to attempt to handle failures of this
    # call.  The only reasonable thing to do when an error is detected is
    # to call g_error().
    def add_from_resource(resource_path : ::String) : Bool
      # gtk_builder_add_from_resource: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_builder_add_from_resource(self, resource_path, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Parses a string containing a UI definition and merges it
    # with the current contents of @builder.
    #
    # This function is useful if you need to call
    # `Gtk::Builder#current_object=` to add user data to
    # callbacks before loading `GtkBuilder` UI. Otherwise, you probably
    # want `Gtk::Builder#new_from_string` instead.
    #
    # Upon errors %FALSE will be returned and @error will be assigned a
    # `GError` from the %GTK_BUILDER_ERROR, %G_MARKUP_ERROR or
    # %G_VARIANT_PARSE_ERROR domain.
    #
    # It’s not really reasonable to attempt to handle failures of this
    # call.  The only reasonable thing to do when an error is detected is
    # to call g_error().
    def add_from_string(buffer : ::String, length : Int64) : Bool
      # gtk_builder_add_from_string: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_builder_add_from_string(self, buffer, length, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Parses a file containing a UI definition building only the
    # requested objects and merges them with the current contents
    # of @builder.
    #
    # Upon errors, 0 will be returned and @error will be assigned a
    # `GError` from the %GTK_BUILDER_ERROR, %G_MARKUP_ERROR or %G_FILE_ERROR
    # domain.
    #
    # If you are adding an object that depends on an object that is not
    # its child (for instance a `GtkTreeView` that depends on its
    # `GtkTreeModel`), you have to explicitly list all of them in @object_ids.
    def add_objects_from_file(filename : ::String, object_ids : Enumerable(::String)) : Bool
      # gtk_builder_add_objects_from_file: (Method | Throws)
      # @object_ids: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayArgPlan
      object_ids = object_ids.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGtk.gtk_builder_add_objects_from_file(self, filename, object_ids, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Parses a resource file containing a UI definition, building
    # only the requested objects and merges them with the current
    # contents of @builder.
    #
    # Upon errors, 0 will be returned and @error will be assigned a
    # `GError` from the %GTK_BUILDER_ERROR, %G_MARKUP_ERROR or %G_RESOURCE_ERROR
    # domain.
    #
    # If you are adding an object that depends on an object that is not
    # its child (for instance a `GtkTreeView` that depends on its
    # `GtkTreeModel`), you have to explicitly list all of them in @object_ids.
    def add_objects_from_resource(resource_path : ::String, object_ids : Enumerable(::String)) : Bool
      # gtk_builder_add_objects_from_resource: (Method | Throws)
      # @object_ids: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayArgPlan
      object_ids = object_ids.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGtk.gtk_builder_add_objects_from_resource(self, resource_path, object_ids, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Parses a string containing a UI definition, building only the
    # requested objects and merges them with the current contents of
    # @builder.
    #
    # Upon errors %FALSE will be returned and @error will be assigned a
    # `GError` from the %GTK_BUILDER_ERROR or %G_MARKUP_ERROR domain.
    #
    # If you are adding an object that depends on an object that is not
    # its child (for instance a `GtkTreeView` that depends on its
    # `GtkTreeModel`), you have to explicitly list all of them in @object_ids.
    def add_objects_from_string(buffer : ::String, length : Int64, object_ids : Enumerable(::String)) : Bool
      # gtk_builder_add_objects_from_string: (Method | Throws)
      # @object_ids: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayArgPlan
      object_ids = object_ids.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGtk.gtk_builder_add_objects_from_string(self, buffer, length, object_ids, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a closure to invoke the function called @function_name.
    #
    # This is using the create_closure() implementation of @builder's
    # `Gtk#BuilderScope`.
    #
    # If no closure could be created, %NULL will be returned and @error
    # will be set.
    def create_closure(function_name : ::String, flags : Gtk::BuilderClosureFlags, object : GObject::Object?) : GObject::Closure?
      # gtk_builder_create_closure: (Method | Throws)
      # @object: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      object = if object.nil?
                 Pointer(Void).null
               else
                 object.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_builder_create_closure(self, function_name, flags, object, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GObject::Closure.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Add @object to the @builder object pool so it can be
    # referenced just like any other object built by builder.
    def expose_object(name : ::String, object : GObject::Object) : Nil
      # gtk_builder_expose_object: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_builder_expose_object(self, name, object)

      # Return value handling
    end

    # Main private entry point for building composite components
    # from template XML.
    #
    # This is exported purely to let `gtk-builder-tool` validate
    # templates, applications have no need to call this function.
    def extend_with_template(object : GObject::Object, template_type : UInt64, buffer : ::String, length : Int64) : Bool
      # gtk_builder_extend_with_template: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_builder_extend_with_template(self, object, template_type, buffer, length, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the current object set via gtk_builder_set_current_object().
    def current_object : GObject::Object?
      # gtk_builder_get_current_object: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_builder_get_current_object(self)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the object named @name.
    #
    # Note that this function does not increment the reference count
    # of the returned object.
    def object(name : ::String) : GObject::Object?
      # gtk_builder_get_object: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_builder_get_object(self, name)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets all objects that have been constructed by @builder.
    #
    # Note that this function does not increment the reference
    # counts of the returned objects.
    def objects : GLib::SList
      # gtk_builder_get_objects: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_builder_get_objects(self)

      # Return value handling

      GLib::SList(GObject::Object).new(_retval, GICrystal::Transfer::Container)
    end

    # Gets the scope in use that was set via gtk_builder_set_scope().
    def scope : Gtk::BuilderScope
      # gtk_builder_get_scope: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_builder_get_scope(self)

      # Return value handling

      Gtk::BuilderScope__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the translation domain of @builder.
    def translation_domain : ::String?
      # gtk_builder_get_translation_domain: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_builder_get_translation_domain(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Looks up a type by name.
    #
    # This is using the virtual function that `GtkBuilder` has
    # for that purpose. This is mainly used when implementing
    # the `GtkBuildable` interface on a type.
    def type_from_name(type_name : ::String) : UInt64
      # gtk_builder_get_type_from_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_builder_get_type_from_name(self, type_name)

      # Return value handling

      _retval
    end

    # Sets the current object for the @builder.
    #
    # The current object can be thought of as the `this` object that the
    # builder is working for and will often be used as the default object
    # when an object is optional.
    #
    # `Gtk::Widget#init_template` for example will set the current
    # object to the widget the template is inited for. For functions like
    # `Gtk::Builder#new_from_resource`, the current object will be %NULL.
    def current_object=(current_object : GObject::Object?) : Nil
      # gtk_builder_set_current_object: (Method | Setter)
      # @current_object: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      current_object = if current_object.nil?
                         Pointer(Void).null
                       else
                         current_object.to_unsafe
                       end

      # C call
      LibGtk.gtk_builder_set_current_object(self, current_object)

      # Return value handling
    end

    # Sets the scope the builder should operate in.
    #
    # If @scope is %NULL, a new `Gtk#BuilderCScope` will be created.
    def scope=(scope : Gtk::BuilderScope?) : Nil
      # gtk_builder_set_scope: (Method | Setter)
      # @scope: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      scope = if scope.nil?
                Pointer(Void).null
              else
                scope.to_unsafe
              end

      # C call
      LibGtk.gtk_builder_set_scope(self, scope)

      # Return value handling
    end

    # Sets the translation domain of @builder.
    def translation_domain=(domain : ::String?) : Nil
      # gtk_builder_set_translation_domain: (Method | Setter)
      # @domain: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      domain = if domain.nil?
                 Pointer(LibC::Char).null
               else
                 domain.to_unsafe
               end

      # C call
      LibGtk.gtk_builder_set_translation_domain(self, domain)

      # Return value handling
    end

    # Demarshals a value from a string.
    #
    # This function calls g_value_init() on the @value argument,
    # so it need not be initialised beforehand.
    #
    # Can handle char, uchar, boolean, int, uint, long,
    # ulong, enum, flags, float, double, string, `GdkRGBA` and
    # `GtkAdjustment` type values.
    #
    # Upon errors %FALSE will be returned and @error will be
    # assigned a `GError` from the %GTK_BUILDER_ERROR domain.
    def value_from_string(pspec : GObject::ParamSpec, string : ::String) : GObject::Value
      # gtk_builder_value_from_string: (Method | Throws)
      # @value: (out) (caller-allocates)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::CallerAllocatesPlan
      value = GObject::Value.new
      # C call
      _retval = LibGtk.gtk_builder_value_from_string(self, pspec, string, value, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      value
    end

    # Demarshals a value from a string.
    #
    # Unlike `Gtk::Builder#value_from_string`, this function
    # takes a `GType` instead of `GParamSpec`.
    #
    # Calls g_value_init() on the @value argument, so it
    # need not be initialised beforehand.
    #
    # Upon errors %FALSE will be returned and @error will be
    # assigned a `GError` from the %GTK_BUILDER_ERROR domain.
    def value_from_string_type(type : UInt64, string : ::String) : GObject::Value
      # gtk_builder_value_from_string_type: (Method | Throws)
      # @value: (out) (caller-allocates)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::CallerAllocatesPlan
      value = GObject::Value.new
      # C call
      _retval = LibGtk.gtk_builder_value_from_string_type(self, type, string, value, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      value
    end
  end
end
