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
  # In many cases, named themes are used indirectly, via [class@Gtk.Image]
  # rather than directly, but looking up icons directly is also simple. The
  # `GtkIconTheme` object acts as a database of all the icons in the current
  # theme. You can create new `GtkIconTheme` objects, but it’s much more
  # efficient to use the standard icon theme of the `GtkWidget` so that the
  # icon information is shared with other people looking up icons.
  #
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
  class IconTheme < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil, icon_names : Enumerable(::String)? = nil, resource_path : Enumerable(::String)? = nil, search_path : Enumerable(::String)? = nil, theme_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if icon_names
        (_names.to_unsafe + _n).value = "icon-names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_names)
        _n += 1
      end
      if resource_path
        (_names.to_unsafe + _n).value = "resource-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource_path)
        _n += 1
      end
      if search_path
        (_names.to_unsafe + _n).value = "search-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search_path)
        _n += 1
      end
      if theme_name
        (_names.to_unsafe + _n).value = "theme-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, theme_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IconTheme.g_type, _n, _names, _values)
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

    def initialize
      # gtk_icon_theme_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_theme_new
      @pointer = _retval
    end

    def self.for_display(display : Gdk::Display) : Gtk::IconTheme
      # gtk_icon_theme_get_for_display: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_theme_get_for_display(display)
      Gtk::IconTheme.new(_retval, GICrystal::Transfer::None)
    end

    def add_resource_path(path : ::String) : Nil
      # gtk_icon_theme_add_resource_path: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_theme_add_resource_path(self, path)
    end

    def add_search_path(path : ::String) : Nil
      # gtk_icon_theme_add_search_path: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_theme_add_search_path(self, path)
    end

    def display : Gdk::Display?
      # gtk_icon_theme_get_display: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_theme_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def icon_names : Enumerable(::String)
      # gtk_icon_theme_get_icon_names: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_theme_get_icon_names(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def icon_sizes(icon_name : ::String) : Enumerable(Int32)
      # gtk_icon_theme_get_icon_sizes: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_theme_get_icon_sizes(self, icon_name)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def resource_path : Enumerable(::String)?
      # gtk_icon_theme_get_resource_path: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_theme_get_resource_path(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def search_path : Enumerable(::String)?
      # gtk_icon_theme_get_search_path: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_theme_get_search_path(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def theme_name : ::String
      # gtk_icon_theme_get_theme_name: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_theme_get_theme_name(self)
      GICrystal.transfer_full(_retval)
    end

    def has_gicon(gicon : Gio::Icon) : Bool
      # gtk_icon_theme_has_gicon: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_theme_has_gicon(self, gicon)
      GICrystal.to_bool(_retval)
    end

    def has_icon(icon_name : ::String) : Bool
      # gtk_icon_theme_has_icon: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_theme_has_icon(self, icon_name)
      GICrystal.to_bool(_retval)
    end

    def lookup_by_gicon(icon : Gio::Icon, size : Int32, scale : Int32, direction : Gtk::TextDirection, flags : Gtk::IconLookupFlags) : Gtk::IconPaintable
      # gtk_icon_theme_lookup_by_gicon: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_theme_lookup_by_gicon(self, icon, size, scale, direction, flags)
      Gtk::IconPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_icon(icon_name : ::String, fallbacks : Enumerable(::String)?, size : Int32, scale : Int32, direction : Gtk::TextDirection, flags : Gtk::IconLookupFlags) : Gtk::IconPaintable
      # gtk_icon_theme_lookup_icon: (Method)
      # @fallbacks: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer full)

      fallbacks = if fallbacks.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    fallbacks.to_a.map(&.to_unsafe).to_unsafe
                  end

      _retval = LibGtk.gtk_icon_theme_lookup_icon(self, icon_name, fallbacks, size, scale, direction, flags)
      Gtk::IconPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    def resource_path=(path : Enumerable(::String)?) : Nil
      # gtk_icon_theme_set_resource_path: (Method | Setter)
      # @path: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Pointer(LibC::Char)).null
             else
               path.to_a.map(&.to_unsafe).to_unsafe
             end

      LibGtk.gtk_icon_theme_set_resource_path(self, path)
    end

    def search_path=(path : Enumerable(::String)?) : Nil
      # gtk_icon_theme_set_search_path: (Method | Setter)
      # @path: (nullable) (array zero-terminated=1 element-type Filename)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Pointer(LibC::Char)).null
             else
               path.to_a.map(&.to_unsafe).to_unsafe
             end

      LibGtk.gtk_icon_theme_set_search_path(self, path)
    end

    def theme_name=(theme_name : ::String?) : Nil
      # gtk_icon_theme_set_theme_name: (Method | Setter)
      # @theme_name: (nullable)
      # Returns: (transfer none)

      theme_name = if theme_name.nil?
                     Pointer(LibC::Char).null
                   else
                     theme_name.to_unsafe
                   end

      LibGtk.gtk_icon_theme_set_theme_name(self, theme_name)
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
