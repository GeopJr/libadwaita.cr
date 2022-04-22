require "../g_object-2.0/object"

module Gtk
  # `GtkIconTheme` provides a facility for loading themed icons.
  #
  # The main reason for using a name rather than simply providing a filename
  # is to allow different icons to be used depending on what “icon theme” is
  # selected by the user. The operation of icon themes on Linux and Unix
  # follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
  # There is a fallback icon theme, named `hicolor`, where applications
  # should install their icons, but additional icon themes can be installed
  # as operating system vendors and users choose.
  #
  # In many cases, named themes are used indirectly, via `Gtk#Image`
  # rather than directly, but looking up icons directly is also simple. The
  # `GtkIconTheme` object acts as a database of all the icons in the current
  # theme. You can create new `GtkIconTheme` objects, but it’s much more
  # efficient to use the standard icon theme of the `GtkWidget` so that the
  # icon information is shared with other people looking up icons.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkIconTheme *icon_theme;
  # GtkIconPaintable *icon;
  # GdkPaintable *paintable;
  #
  # icon_theme = gtk_icon_theme_get_for_display (gtk_widget_get_display (my_widget));
  # icon = gtk_icon_theme_lookup_icon (icon_theme,
  #                                    "my-icon-name", // icon name
  #                                    48, // icon size
  #                                    1,  // scale
  #                                    0,  // flags);
  # paintable = GDK_PAINTABLE (icon);
  # // Use the paintable
  # g_object_unref (icon);
  # ```
  @[GObject::GeneratedWrapper]
  class IconTheme < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::IconTheme), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil, icon_names : Enumerable(::String)? = nil, resource_path : Enumerable(::String)? = nil, search_path : Enumerable(::String)? = nil, theme_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !icon_names.nil?
        (_names.to_unsafe + _n).value = "icon-names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_names)
        _n += 1
      end
      if !resource_path.nil?
        (_names.to_unsafe + _n).value = "resource-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource_path)
        _n += 1
      end
      if !search_path.nil?
        (_names.to_unsafe + _n).value = "search-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search_path)
        _n += 1
      end
      if !theme_name.nil?
        (_names.to_unsafe + _n).value = "theme-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, theme_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IconTheme.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_icon_theme_get_type
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def icon_names : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "icon-names", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def resource_path=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "resource-path", unsafe_value, Pointer(Void).null)
      value
    end

    def resource_path : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "resource-path", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def search_path=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "search-path", unsafe_value, Pointer(Void).null)
      value
    end

    def search_path : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "search-path", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def theme_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "theme-name", unsafe_value, Pointer(Void).null)
      value
    end

    def theme_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "theme-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new icon theme object.
    #
    # Icon theme objects are used to lookup up an icon by name
    # in a particular icon theme. Usually, you’ll want to use
    # `Gtk::IconTheme#for_display` rather than creating
    # a new icon theme object for scratch.
    def initialize
      # gtk_icon_theme_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_theme_new

      # Return value handling

      @pointer = _retval
    end

    # Gets the icon theme object associated with @display.
    #
    # If this function has not previously been called for the given
    # display, a new icon theme object will be created and associated
    # with the display. Icon theme objects are fairly expensive to create,
    # so using this function is usually a better choice than calling
    # `Gtk::IconTheme.new` and setting the display yourself; by using
    # this function a single icon theme object will be shared between users.
    def self.for_display(display : Gdk::Display) : Gtk::IconTheme
      # gtk_icon_theme_get_for_display: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_theme_get_for_display(display)

      # Return value handling

      Gtk::IconTheme.new(_retval, GICrystal::Transfer::None)
    end

    # Adds a resource path that will be looked at when looking
    # for icons, similar to search paths.
    #
    # See `Gtk::IconTheme#resource_path=`.
    #
    # This function should be used to make application-specific icons
    # available as part of the icon theme.
    def add_resource_path(path : ::String) : Nil
      # gtk_icon_theme_add_resource_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_theme_add_resource_path(self, path)

      # Return value handling
    end

    # Appends a directory to the search path.
    #
    # See `Gtk::IconTheme#search_path=`.
    def add_search_path(path : ::String) : Nil
      # gtk_icon_theme_add_search_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_theme_add_search_path(self, path)

      # Return value handling
    end

    # Returns the display that the `GtkIconTheme` object was
    # created for.
    def display : Gdk::Display?
      # gtk_icon_theme_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_theme_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Lists the names of icons in the current icon theme.
    def icon_names : Enumerable(::String)
      # gtk_icon_theme_get_icon_names: (Method | Getter)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_icon_theme_get_icon_names(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Returns an array of integers describing the sizes at which
    # the icon is available without scaling.
    #
    # A size of -1 means that the icon is available in a scalable
    # format. The array is zero-terminated.
    def icon_sizes(icon_name : ::String) : Enumerable(Int32)
      # gtk_icon_theme_get_icon_sizes: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Int32)

      # C call
      _retval = LibGtk.gtk_icon_theme_get_icon_sizes(self, icon_name)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Gets the current resource path.
    #
    # See `Gtk::IconTheme#resource_path=`.
    def resource_path : Enumerable(::String)?
      # gtk_icon_theme_get_resource_path: (Method | Getter)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_icon_theme_get_resource_path(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the current search path.
    #
    # See `Gtk::IconTheme#search_path=`.
    def search_path : Enumerable(::String)?
      # gtk_icon_theme_get_search_path: (Method | Getter)
      # Returns: (transfer full) (array zero-terminated=1 element-type Filename)

      # C call
      _retval = LibGtk.gtk_icon_theme_get_search_path(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the current icon theme name.
    #
    # Returns (transfer full): the current icon theme name,
    def theme_name : ::String
      # gtk_icon_theme_get_theme_name: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_theme_get_theme_name(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Checks whether an icon theme includes an icon
    # for a particular `GIcon`.
    def has_gicon(gicon : Gio::Icon) : Bool
      # gtk_icon_theme_has_gicon: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_theme_has_gicon(self, gicon)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks whether an icon theme includes an icon
    # for a particular name.
    def has_icon(icon_name : ::String) : Bool
      # gtk_icon_theme_has_icon: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_theme_has_icon(self, icon_name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Looks up a icon for a desired size and window scale.
    #
    # The icon can then be rendered by using it as a `GdkPaintable`,
    # or you can get information such as the filename and size.
    def lookup_by_gicon(icon : Gio::Icon, size : Int32, scale : Int32, direction : Gtk::TextDirection, flags : Gtk::IconLookupFlags) : Gtk::IconPaintable
      # gtk_icon_theme_lookup_by_gicon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_theme_lookup_by_gicon(self, icon, size, scale, direction, flags)

      # Return value handling

      Gtk::IconPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    # Looks up a named icon for a desired size and window scale,
    # returning a `GtkIconPaintable`.
    #
    # The icon can then be rendered by using it as a `GdkPaintable`,
    # or you can get information such as the filename and size.
    #
    # If the available @icon_name is not available and @fallbacks are
    # provided, they will be tried in order.
    #
    # If no matching icon is found, then a paintable that renders the
    # "missing icon" icon is returned. If you need to do something else
    # for missing icons you need to use `Gtk::IconTheme#has_icon`.
    #
    # Note that you probably want to listen for icon theme changes and
    # update the icon. This is usually done by overriding the
    # GtkWidgetClass.css-changed() function.
    def lookup_icon(icon_name : ::String, fallbacks : Enumerable(::String)?, size : Int32, scale : Int32, direction : Gtk::TextDirection, flags : Gtk::IconLookupFlags) : Gtk::IconPaintable
      # gtk_icon_theme_lookup_icon: (Method)
      # @fallbacks: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      fallbacks = if fallbacks.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    fallbacks.to_a.map(&.to_unsafe).to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_icon_theme_lookup_icon(self, icon_name, fallbacks, size, scale, direction, flags)

      # Return value handling

      Gtk::IconPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    # Sets the resource paths that will be looked at when
    # looking for icons, similar to search paths.
    #
    # The resources are considered as part of the hicolor icon theme
    # and must be located in subdirectories that are defined in the
    # hicolor icon theme, such as `@path/16x16/actions/run.png`
    # or `@path/scalable/actions/run.svg`.
    #
    # Icons that are directly placed in the resource path instead
    # of a subdirectory are also considered as ultimate fallback,
    # but they are treated like unthemed icons.
    def resource_path=(path : Enumerable(::String)?) : Nil
      # gtk_icon_theme_set_resource_path: (Method | Setter)
      # @path: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Pointer(LibC::Char)).null
             else
               path.to_a.map(&.to_unsafe).to_unsafe
             end

      # C call
      LibGtk.gtk_icon_theme_set_resource_path(self, path)

      # Return value handling
    end

    # Sets the search path for the icon theme object.
    #
    # When looking for an icon theme, GTK will search for a subdirectory
    # of one or more of the directories in @path with the same name
    # as the icon theme containing an index.theme file. (Themes from
    # multiple of the path elements are combined to allow themes to be
    # extended by adding icons in the user’s home directory.)
    #
    # In addition if an icon found isn’t found either in the current
    # icon theme or the default icon theme, and an image file with
    # the right name is found directly in one of the elements of
    # @path, then that image will be used for the icon name.
    # (This is legacy feature, and new icons should be put
    # into the fallback icon theme, which is called hicolor,
    # rather than directly on the icon path.)
    def search_path=(path : Enumerable(::String)?) : Nil
      # gtk_icon_theme_set_search_path: (Method | Setter)
      # @path: (nullable) (array zero-terminated=1 element-type Filename)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Pointer(LibC::Char)).null
             else
               path.to_a.map(&.to_unsafe).to_unsafe
             end

      # C call
      LibGtk.gtk_icon_theme_set_search_path(self, path)

      # Return value handling
    end

    # Sets the name of the icon theme that the `GtkIconTheme` object uses
    # overriding system configuration.
    #
    # This function cannot be called on the icon theme objects returned
    # from `Gtk::IconTheme#for_display`.
    def theme_name=(theme_name : ::String?) : Nil
      # gtk_icon_theme_set_theme_name: (Method | Setter)
      # @theme_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      theme_name = if theme_name.nil?
                     Pointer(LibC::Char).null
                   else
                     theme_name.to_unsafe
                   end

      # C call
      LibGtk.gtk_icon_theme_set_theme_name(self, theme_name)

      # Return value handling
    end

    # Emitted when the icon theme changes.
    #
    # This can happen becuase current icon theme is switched or
    # because GTK detects that a change has occurred in the
    # contents of the current icon theme.
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

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::IconTheme, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconTheme.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconTheme, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconTheme, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconTheme.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconTheme, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
