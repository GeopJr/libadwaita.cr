require "./gesture_single"

module Gtk
  # `GtkGestureDrag` is a `GtkGesture` implementation for drags.
  #
  # The drag operation itself can be tracked throughout the
  # [signal@Gtk.GestureDrag::drag-begin],
  # [signal@Gtk.GestureDrag::drag-update] and
  # [signal@Gtk.GestureDrag::drag-end] signals, and the relevant
  # coordinates can be extracted through
  # `Gtk::GestureDrag#offset` and
  # `Gtk::GestureDrag#start_point`.
  @[GObject::GeneratedWrapper]
  class GestureDrag < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureDragClass), class_init,
        sizeof(LibGtk::GestureDrag), instance_init, 0)
    end

    GICrystal.define_new_method(GestureDrag, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GestureDrag`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, button : UInt32? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if !button.nil?
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if !exclusive.nil?
        (_names.to_unsafe + _n).value = "exclusive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exclusive)
        _n += 1
      end
      if !n_points.nil?
        (_names.to_unsafe + _n).value = "n-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_points)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !propagation_limit.nil?
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if !propagation_phase.nil?
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if !touch_only.nil?
        (_names.to_unsafe + _n).value = "touch-only".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, touch_only)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GestureDrag.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_drag_get_type
    end

    # Gets the offset from the start point.
    #
    # If the @gesture is active, this function returns %TRUE and
    # fills in @x and @y with the coordinates of the current point,
    # as an offset to the starting drag point.
    def offset(x : Float64?, y : Float64?) : Bool
      # gtk_gesture_drag_get_offset: (Method)
      # @x: (out) (transfer full) (nullable)
      # @y: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      x = if x.nil?
            Float64.null
          else
            x.to_unsafe
          end
      # Generator::NullableArrayPlan
      y = if y.nil?
            Float64.null
          else
            y.to_unsafe
          end

      # C call
      _retval = LibGtk.gtk_gesture_drag_get_offset(@pointer, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the point where the drag started.
    #
    # If the @gesture is active, this function returns %TRUE
    # and fills in @x and @y with the drag start coordinates,
    # in surface-relative coordinates.
    def start_point(x : Float64?, y : Float64?) : Bool
      # gtk_gesture_drag_get_start_point: (Method)
      # @x: (out) (transfer full) (nullable)
      # @y: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      x = if x.nil?
            Float64.null
          else
            x.to_unsafe
          end
      # Generator::NullableArrayPlan
      y = if y.nil?
            Float64.null
          else
            y.to_unsafe
          end

      # C call
      _retval = LibGtk.gtk_gesture_drag_get_start_point(@pointer, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted whenever dragging starts.
    struct DragBeginSignal < GObject::Signal
      def name : String
        @detail ? "drag-begin::#{@detail}" : "drag-begin"
      end

      def connect(*, after : Bool = false, &block : Proc(Float64, Float64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start_x : Float64, lib_start_y : Float64, _lib_box : Pointer(Void)) {
          start_x = lib_start_x
          start_y = lib_start_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(start_x, start_y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::GestureDrag, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start_x : Float64, lib_start_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureDrag.new(_lib_sender, GICrystal::Transfer::None)
          start_x = lib_start_x
          start_y = lib_start_y
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, start_x, start_y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(start_x : Float64, start_y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-begin", start_x, start_y)
      end
    end

    def drag_begin_signal
      DragBeginSignal.new(self)
    end

    # Emitted whenever the dragging is finished.
    struct DragEndSignal < GObject::Signal
      def name : String
        @detail ? "drag-end::#{@detail}" : "drag-end"
      end

      def connect(*, after : Bool = false, &block : Proc(Float64, Float64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_offset_x : Float64, lib_offset_y : Float64, _lib_box : Pointer(Void)) {
          offset_x = lib_offset_x
          offset_y = lib_offset_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(offset_x, offset_y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::GestureDrag, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_offset_x : Float64, lib_offset_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureDrag.new(_lib_sender, GICrystal::Transfer::None)
          offset_x = lib_offset_x
          offset_y = lib_offset_y
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, offset_x, offset_y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(offset_x : Float64, offset_y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-end", offset_x, offset_y)
      end
    end

    def drag_end_signal
      DragEndSignal.new(self)
    end

    # Emitted whenever the dragging point moves.
    struct DragUpdateSignal < GObject::Signal
      def name : String
        @detail ? "drag-update::#{@detail}" : "drag-update"
      end

      def connect(*, after : Bool = false, &block : Proc(Float64, Float64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_offset_x : Float64, lib_offset_y : Float64, _lib_box : Pointer(Void)) {
          offset_x = lib_offset_x
          offset_y = lib_offset_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(offset_x, offset_y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::GestureDrag, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_offset_x : Float64, lib_offset_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureDrag.new(_lib_sender, GICrystal::Transfer::None)
          offset_x = lib_offset_x
          offset_y = lib_offset_y
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, offset_x, offset_y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(offset_x : Float64, offset_y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-update", offset_x, offset_y)
      end
    end

    def drag_update_signal
      DragUpdateSignal.new(self)
    end
  end
end
