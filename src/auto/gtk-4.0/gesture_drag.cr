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
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_drag_get_type
    end

    # Returns a newly created `GtkGesture` that recognizes drags.
    def initialize
      # gtk_gesture_drag_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_gesture_drag_new

      # Return value handling

      @pointer = _retval
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
      _retval = LibGtk.gtk_gesture_drag_get_offset(self, x, y)

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
      _retval = LibGtk.gtk_gesture_drag_get_start_point(self, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted whenever dragging starts.
    struct DragBeginSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-begin::#{@detail}" : "drag-begin"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GestureDrag, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureDrag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GestureDrag, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureDrag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(start_x : Float64, start_y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-begin", start_x, start_y)
      end
    end

    def drag_begin_signal
      DragBeginSignal.new(self)
    end

    # Emitted whenever the dragging is finished.
    struct DragEndSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-end::#{@detail}" : "drag-end"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GestureDrag, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureDrag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GestureDrag, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureDrag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(offset_x : Float64, offset_y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-end", offset_x, offset_y)
      end
    end

    def drag_end_signal
      DragEndSignal.new(self)
    end

    # Emitted whenever the dragging point moves.
    struct DragUpdateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-update::#{@detail}" : "drag-update"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GestureDrag, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureDrag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GestureDrag, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureDrag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GestureDrag, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
