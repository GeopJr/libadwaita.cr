require "./event_controller"

module Gtk
  # `GtkDropTargetAsync` is an event controller to receive Drag-and-Drop
  # operations, asynchronously.
  #
  # It is the more complete but also more complex method of handling drop
  # operations compared to `Gtk#DropTarget`, and you should only use
  # it if `GtkDropTarget` doesn't provide all the features you need.
  #
  # To use a `GtkDropTargetAsync` to receive drops on a widget, you create
  # a `GtkDropTargetAsync` object, configure which data formats and actions
  # you support, connect to its signals, and then attach it to the widget
  # with `Gtk::Widget#add_controller`.
  #
  # During a drag operation, the first signal that a `GtkDropTargetAsync`
  # emits is `Gtk::DropTargetAsync::#accept`, which is meant to determine
  # whether the target is a possible drop site for the ongoing drop. The
  # default handler for the ::accept signal accepts the drop if it finds
  # a compatible data format and an action that is supported on both sides.
  #
  # If it is, and the widget becomes a target, you will receive a
  # [signal@Gtk.DropTargetAsync::drag-enter] signal, followed by
  # [signal@Gtk.DropTargetAsync::drag-motion] signals as the pointer moves,
  # optionally a `Gtk::DropTargetAsync::#drop` signal when a drop happens,
  # and finally a [signal@Gtk.DropTargetAsync::drag-leave] signal when the
  # pointer moves off the widget.
  #
  # The ::drag-enter and ::drag-motion handler return a `GdkDragAction`
  # to update the status of the ongoing operation. The ::drop handler
  # should decide if it ultimately accepts the drop and if it does, it
  # should initiate the data transfer and finish the operation by calling
  # `Gdk::Drop#finish`.
  #
  # Between the ::drag-enter and ::drag-leave signals the widget is a
  # current drop target, and will receive the %GTK_STATE_FLAG_DROP_ACTIVE
  # state, which can be used by themes to style the widget as a drop target.
  @[GObject::GeneratedWrapper]
  class DropTargetAsync < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::DropTargetAsyncClass), class_init,
        sizeof(LibGtk::DropTargetAsync), instance_init, 0)
    end

    GICrystal.define_new_method(DropTargetAsync, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DropTargetAsync`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, formats : Gdk::ContentFormats? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !actions.nil?
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if !formats.nil?
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
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
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DropTargetAsync.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drop_target_async_get_type
    end

    def actions=(value : Gdk::DragAction) : Gdk::DragAction
      unsafe_value = value

      LibGObject.g_object_set(self, "actions", unsafe_value, Pointer(Void).null)
      value
    end

    def actions : Gdk::DragAction
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "actions", pointerof(value), Pointer(Void).null)
      Gdk::DragAction.new(value)
    end

    def formats=(value : Gdk::ContentFormats?) : Gdk::ContentFormats?
      unsafe_value = value

      LibGObject.g_object_set(self, "formats", unsafe_value, Pointer(Void).null)
      value
    end

    def formats : Gdk::ContentFormats?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "formats", pointerof(value), Pointer(Void).null)
      Gdk::ContentFormats.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkDropTargetAsync` object.
    def self.new(formats : Gdk::ContentFormats?, actions : Gdk::DragAction) : self
      # gtk_drop_target_async_new: (Constructor)
      # @formats: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      formats = if formats.nil?
                  Pointer(Void).null
                else
                  formats.to_unsafe
                end

      # C call
      _retval = LibGtk.gtk_drop_target_async_new(formats, actions)

      # Return value handling

      Gtk::DropTargetAsync.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the actions that this drop target supports.
    def actions : Gdk::DragAction
      # gtk_drop_target_async_get_actions: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_target_async_get_actions(@pointer)

      # Return value handling

      Gdk::DragAction.new(_retval)
    end

    # Gets the data formats that this drop target accepts.
    #
    # If the result is %NULL, all formats are expected to be supported.
    def formats : Gdk::ContentFormats?
      # gtk_drop_target_async_get_formats: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_drop_target_async_get_formats(@pointer)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Sets the @drop as not accepted on this drag site.
    #
    # This function should be used when delaying the decision
    # on whether to accept a drag or not until after reading
    # the data.
    def reject_drop(drop : Gdk::Drop) : Nil
      # gtk_drop_target_async_reject_drop: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_target_async_reject_drop(@pointer, drop)

      # Return value handling
    end

    # Sets the actions that this drop target supports.
    def actions=(actions : Gdk::DragAction) : Nil
      # gtk_drop_target_async_set_actions: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_target_async_set_actions(@pointer, actions)

      # Return value handling
    end

    # Sets the data formats that this drop target will accept.
    def formats=(formats : Gdk::ContentFormats?) : Nil
      # gtk_drop_target_async_set_formats: (Method | Setter)
      # @formats: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      formats = if formats.nil?
                  Pointer(Void).null
                else
                  formats.to_unsafe
                end

      # C call
      LibGtk.gtk_drop_target_async_set_formats(@pointer, formats)

      # Return value handling
    end

    # Emitted on the drop site when a drop operation is about to begin.
    #
    # If the drop is not accepted, %FALSE will be returned and the drop target
    # will ignore the drop. If %TRUE is returned, the drop is accepted for now
    # but may be rejected later via a call to `Gtk::DropTargetAsync#reject_drop`
    # or ultimately by returning %FALSE from a `Gtk::DropTargetAsync::#drop`
    # handler.
    #
    # The default handler for this signal decides whether to accept the drop
    # based on the formats provided by the @drop.
    #
    # If the decision whether the drop will be accepted or rejected needs
    # further processing, such as inspecting the data, this function should
    # return %TRUE and proceed as is @drop was accepted and if it decides to
    # reject the drop later, it should call `Gtk::DropTargetAsync#reject_drop`.
    struct AcceptSignal < GObject::Signal
      def name : String
        @detail ? "accept::#{@detail}" : "accept"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drop, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drop, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gdk::Drop, Bool)).unbox(_lib_box).call(drop)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DropTargetAsync, Gdk::Drop, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTargetAsync.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Bool)).unbox(_lib_box).call(_sender, drop)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drop : Gdk::Drop) : Nil
        LibGObject.g_signal_emit_by_name(@source, "accept", drop)
      end
    end

    def accept_signal
      AcceptSignal.new(self)
    end

    # Emitted on the drop site when the pointer enters the widget.
    #
    # It can be used to set up custom highlighting.
    struct DragEnterSignal < GObject::Signal
      def name : String
        @detail ? "drag-enter::#{@detail}" : "drag-enter"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(drop, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTargetAsync.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(_sender, drop, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drop : Gdk::Drop, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-enter", drop, x, y)
      end
    end

    def drag_enter_signal
      DragEnterSignal.new(self)
    end

    # Emitted on the drop site when the pointer leaves the widget.
    #
    # Its main purpose it to undo things done in
    # `GtkDropTargetAsync`::drag-enter.
    struct DragLeaveSignal < GObject::Signal
      def name : String
        @detail ? "drag-leave::#{@detail}" : "drag-leave"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drop, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drop, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gdk::Drop, Nil)).unbox(_lib_box).call(drop)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DropTargetAsync, Gdk::Drop, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTargetAsync.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Nil)).unbox(_lib_box).call(_sender, drop)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drop : Gdk::Drop) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-leave", drop)
      end
    end

    def drag_leave_signal
      DragLeaveSignal.new(self)
    end

    # Emitted while the pointer is moving over the drop target.
    struct DragMotionSignal < GObject::Signal
      def name : String
        @detail ? "drag-motion::#{@detail}" : "drag-motion"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(drop, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTargetAsync.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(_sender, drop, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drop : Gdk::Drop, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-motion", drop, x, y)
      end
    end

    def drag_motion_signal
      DragMotionSignal.new(self)
    end

    # Emitted on the drop site when the user drops the data onto the widget.
    #
    # The signal handler must determine whether the pointer position is in a
    # drop zone or not. If it is not in a drop zone, it returns %FALSE and no
    # further processing is necessary.
    #
    # Otherwise, the handler returns %TRUE. In this case, this handler will
    # accept the drop. The handler must ensure that `Gdk::Drop#finish`
    # is called to let the source know that the drop is done. The call to
    # `Gdk::Drop#finish` must only be done when all data has been received.
    #
    # To receive the data, use one of the read functions provided by
    # `Gdk#Drop` such as `Gdk::Drop#read_async` or
    # `Gdk::Drop#read_value_async`.
    struct DropSignal < GObject::Signal
      def name : String
        @detail ? "drop::#{@detail}" : "drop"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drop, Float64, Float64, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drop, Float64, Float64, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gdk::Drop, Float64, Float64, Bool)).unbox(_lib_box).call(drop, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTargetAsync.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Bool)).unbox(_lib_box).call(_sender, drop, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drop : Gdk::Drop, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drop", drop, x, y)
      end
    end

    def drop_signal
      DropSignal.new(self)
    end
  end
end
