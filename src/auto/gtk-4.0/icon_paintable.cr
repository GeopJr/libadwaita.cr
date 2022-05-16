require "../g_object-2.0/object"
require "../gdk-4.0/paintable"

require "./symbolic_paintable"

module Gtk
  # Contains information found when looking up an icon in `GtkIconTheme`.
  #
  # `GtkIconPaintable` implements `GdkPaintable`.
  @[GObject::GeneratedWrapper]
  class IconPaintable < GObject::Object
    include Gdk::Paintable
    include SymbolicPaintable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::IconPaintable), instance_init, 0)
    end

    GICrystal.define_new_method(IconPaintable, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `IconPaintable`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, file : Gio::File? = nil, icon_name : ::String? = nil, is_symbolic : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !file.nil?
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
        _n += 1
      end
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if !is_symbolic.nil?
        (_names.to_unsafe + _n).value = "is-symbolic".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_symbolic)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IconPaintable.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_icon_paintable_get_type
    end

    def file=(value : Gio::File?) : Gio::File?
      unsafe_value = value

      LibGObject.g_object_set(self, "file", unsafe_value, Pointer(Void).null)
      value
    end

    def file : Gio::File?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "file", pointerof(value), Pointer(Void).null)
      Gio::AbstractFile.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def is_symbolic=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-symbolic", unsafe_value, Pointer(Void).null)
      value
    end

    def is_symbolic? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-symbolic", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a `GtkIconPaintable` for a file with a given size and scale.
    #
    # The icon can then be rendered by using it as a `GdkPaintable`.
    def self.new_for_file(file : Gio::File, size : Int32, scale : Int32) : self
      # gtk_icon_paintable_new_for_file: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_paintable_new_for_file(file, size, scale)

      # Return value handling

      Gtk::IconPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the `GFile` that was used to load the icon.
    #
    # Returns %NULL if the icon was not loaded from a file.
    def file : Gio::File?
      # gtk_icon_paintable_get_file: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_paintable_get_file(@pointer)

      # Return value handling

      Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Get the icon name being used for this icon.
    #
    # When an icon looked up in the icon theme was not available, the
    # icon theme may use fallback icons - either those specified to
    # gtk_icon_theme_lookup_icon() or the always-available
    # "image-missing". The icon chosen is returned by this function.
    #
    # If the icon was created without an icon theme, this function
    # returns %NULL.
    def icon_name : ::Path?
      # gtk_icon_paintable_get_icon_name: (Method | Getter)
      # Returns: (transfer none Filename)

      # C call
      _retval = LibGtk.gtk_icon_paintable_get_icon_name(@pointer)

      # Return value handling

      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    # Checks if the icon is symbolic or not.
    #
    # This currently uses only the file name and not the file contents
    # for determining this. This behaviour may change in the future.
    #
    # Note that to render a symbolic `GtkIconPaintable` properly (with
    # recoloring), you have to set its icon name on a `GtkImage`.
    def is_symbolic : Bool
      # gtk_icon_paintable_is_symbolic: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_paintable_is_symbolic(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
