require "../g_object-2.0/object"
require "../gdk-4.0/paintable"

module Gtk
  # Contains information found when looking up an icon in `GtkIconTheme`.
  #
  # `GtkIconPaintable` implements `GdkPaintable`.
  class IconPaintable < GObject::Object
    include Gdk::Paintable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, file : Gio::File? = nil, icon_name : ::String? = nil, is_symbolic : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if file
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
        _n += 1
      end
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if is_symbolic
        (_names.to_unsafe + _n).value = "is-symbolic".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_symbolic)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IconPaintable.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_icon_paintable_get_type
    end

    def file=(value : File?) : File?
      unsafe_value = value

      LibGObject.g_object_set(self, "file", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def is_symbolic=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-symbolic", unsafe_value, Pointer(Void).null)
      value
    end

    def self.new_for_file(file : Gio::File, size : Int32, scale : Int32) : Gtk::IconPaintable
      # gtk_icon_paintable_new_for_file: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_paintable_new_for_file(file, size, scale)
      Gtk::IconPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    def file : Gio::File?
      # gtk_icon_paintable_get_file: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_paintable_get_file(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def icon_name : ::Path?
      # gtk_icon_paintable_get_icon_name: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGtk.gtk_icon_paintable_get_icon_name(self)
      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    def is_symbolic : Bool
      # gtk_icon_paintable_is_symbolic: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_paintable_is_symbolic(self)
      GICrystal.to_bool(_retval)
    end
  end
end
