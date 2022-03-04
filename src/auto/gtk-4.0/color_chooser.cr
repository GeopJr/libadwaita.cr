module Gtk
  # `GtkColorChooser` is an interface that is implemented by widgets
  # for choosing colors.
  #
  # Depending on the situation, colors may be allowed to have alpha (translucency).
  #
  # In GTK, the main widgets that implement this interface are
  # [class@Gtk.ColorChooserWidget], [class@Gtk.ColorChooserDialog] and
  # [class@Gtk.ColorButton].
  module ColorChooser
    def rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def use_alpha=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-alpha", unsafe_value, Pointer(Void).null)
      value
    end

    def use_alpha? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-alpha", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def add_palette(orientation : Gtk::Orientation, colors_per_line : Int32, colors : Enumerable(Gdk::RGBA)?) : Nil
      # gtk_color_chooser_add_palette: (Method)
      # @colors: (nullable) (array length=n_colors element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_colors = colors.try(&.size) || 0
      colors = if colors.nil?
                 Pointer(Void).null
               else
                 colors.to_a.map(&.to_unsafe).to_unsafe
               end

      # C call
      LibGtk.gtk_color_chooser_add_palette(self, orientation, colors_per_line, n_colors, colors)

      # Return value handling
    end

    def rgba : Gdk::RGBA
      # gtk_color_chooser_get_rgba: (Method | Getter)
      # @color: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      color = Gdk::RGBA.new

      # C call
      LibGtk.gtk_color_chooser_get_rgba(self, color)

      # Return value handling
      color
    end

    def use_alpha : Bool
      # gtk_color_chooser_get_use_alpha: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_color_chooser_get_use_alpha(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def rgba=(color : Gdk::RGBA) : Nil
      # gtk_color_chooser_set_rgba: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_color_chooser_set_rgba(self, color)

      # Return value handling
    end

    def use_alpha=(use_alpha : Bool) : Nil
      # gtk_color_chooser_set_use_alpha: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_color_chooser_set_use_alpha(self, use_alpha)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class ColorChooser__Impl < GObject::Object
    include ColorChooser

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_color_chooser_get_type
    end

    # Cast a `GObject::Object` to `ColorChooser`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ColorChooser")
    end

    # Cast a `GObject::Object` to `ColorChooser`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
