module Gtk
  # `GtkColorChooser` is an interface that is implemented by widgets
  # for choosing colors.
  #
  # Depending on the situation, colors may be allowed to have alpha (translucency).
  #
  # In GTK, the main widgets that implement this interface are
  # `Gtk#ColorChooserWidget`, `Gtk#ColorChooserDialog` and
  # `Gtk#ColorButton`.
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

      # Generator::ArrayLengthArgPlan
      n_colors = colors.try(&.size) || 0 # Generator::NullableArrayPlan
      colors = if colors.nil?
                 Pointer(Void).null
               else
                 colors.to_a.map(&.to_unsafe).to_unsafe
               end

      # C call
      LibGtk.gtk_color_chooser_add_palette(@pointer, orientation, colors_per_line, n_colors, colors)

      # Return value handling
    end

    def rgba : Gdk::RGBA
      # gtk_color_chooser_get_rgba: (Method | Getter)
      # @color: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      color = Gdk::RGBA.new
      # C call
      LibGtk.gtk_color_chooser_get_rgba(@pointer, color)

      # Return value handling

      color
    end

    def use_alpha : Bool
      # gtk_color_chooser_get_use_alpha: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_color_chooser_get_use_alpha(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def rgba=(color : Gdk::RGBA) : Nil
      # gtk_color_chooser_set_rgba: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_color_chooser_set_rgba(@pointer, color)

      # Return value handling
    end

    def use_alpha=(use_alpha : Bool) : Nil
      # gtk_color_chooser_set_use_alpha: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_color_chooser_set_use_alpha(@pointer, use_alpha)

      # Return value handling
    end

    struct ColorActivatedSignal < GObject::Signal
      def name : String
        @detail ? "color-activated::#{@detail}" : "color-activated"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::RGBA, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::RGBA, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_color : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          color = Gdk::RGBA.new(lib_color, :none)
          ::Box(Proc(Gdk::RGBA, Nil)).unbox(_lib_box).call(color)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::ColorChooser, Gdk::RGBA, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_color : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractColorChooser.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          color = Gdk::RGBA.new(lib_color, :none)
          ::Box(Proc(Gtk::ColorChooser, Gdk::RGBA, Nil)).unbox(_lib_box).call(_sender, color)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(color : Gdk::RGBA) : Nil
        LibGObject.g_signal_emit_by_name(@source, "color-activated", color)
      end
    end

    def color_activated_signal
      ColorActivatedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractColorChooser < GObject::Object
    include ColorChooser

    GICrystal.define_new_method(Gtk::AbstractColorChooser, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

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
