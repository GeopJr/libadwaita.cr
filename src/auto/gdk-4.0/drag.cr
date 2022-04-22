require "../g_object-2.0/object"

module Gdk
  # The `GdkDrag` object represents the source of an ongoing DND operation.
  #
  # A `GdkDrag` is created when a drag is started, and stays alive for duration of
  # the DND operation. After a drag has been started with `Gdk::Drag#begin`,
  # the caller gets informed about the status of the ongoing drag operation
  # with signals on the `GdkDrag` object.
  #
  # GTK provides a higher level abstraction based on top of these functions,
  # and so they are not normally needed in GTK applications. See the
  # "Drag and Drop" section of the GTK documentation for more information.
  @[GObject::GeneratedWrapper]
  class Drag < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::Drag), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, content : Gdk::ContentProvider? = nil, device : Gdk::Device? = nil, display : Gdk::Display? = nil, formats : Gdk::ContentFormats? = nil, selected_action : Gdk::DragAction? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if !actions.nil?
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if !content.nil?
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
        _n += 1
      end
      if !device.nil?
        (_names.to_unsafe + _n).value = "device".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, device)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !formats.nil?
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if !selected_action.nil?
        (_names.to_unsafe + _n).value = "selected-action".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected_action)
        _n += 1
      end
      if !surface.nil?
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Drag.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_drag_get_type
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

    def content=(value : Gdk::ContentProvider?) : Gdk::ContentProvider?
      unsafe_value = value

      LibGObject.g_object_set(self, "content", unsafe_value, Pointer(Void).null)
      value
    end

    def content : Gdk::ContentProvider?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "content", pointerof(value), Pointer(Void).null)
      Gdk::ContentProvider.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def device=(value : Gdk::Device?) : Gdk::Device?
      unsafe_value = value

      LibGObject.g_object_set(self, "device", unsafe_value, Pointer(Void).null)
      value
    end

    def device : Gdk::Device?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "device", pointerof(value), Pointer(Void).null)
      Gdk::Device.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
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

    def selected_action=(value : Gdk::DragAction) : Gdk::DragAction
      unsafe_value = value

      LibGObject.g_object_set(self, "selected-action", unsafe_value, Pointer(Void).null)
      value
    end

    def selected_action : Gdk::DragAction
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "selected-action", pointerof(value), Pointer(Void).null)
      Gdk::DragAction.new(value)
    end

    def surface=(value : Gdk::Surface?) : Gdk::Surface?
      unsafe_value = value

      LibGObject.g_object_set(self, "surface", unsafe_value, Pointer(Void).null)
      value
    end

    def surface : Gdk::Surface?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "surface", pointerof(value), Pointer(Void).null)
      Gdk::Surface.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Starts a drag and creates a new drag context for it.
    #
    # This function is called by the drag source. After this call, you
    # probably want to set up the drag icon using the surface returned
    # by `Gdk::Drag#drag_surface`.
    #
    # This function returns a reference to the `Gdk#Drag` object,
    # but GTK keeps its own reference as well, as long as the DND operation
    # is going on.
    #
    # Note: if @actions include %GDK_ACTION_MOVE, you need to listen for
    # the [signal@Gdk.Drag::dnd-finished] signal and delete the data at
    # the source if `Gdk::Drag#selected_action` returns
    # %GDK_ACTION_MOVE.
    def self._begin(surface : Gdk::Surface, device : Gdk::Device, content : Gdk::ContentProvider, actions : Gdk::DragAction, dx : Float64, dy : Float64) : Gdk::Drag?
      # gdk_drag_begin: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_drag_begin(surface, device, content, actions, dx, dy)

      # Return value handling

      Gdk::Drag.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Informs GDK that the drop ended.
    #
    # Passing %FALSE for @success may trigger a drag cancellation
    # animation.
    #
    # This function is called by the drag source, and should be the
    # last call before dropping the reference to the @drag.
    #
    # The `GdkDrag` will only take the first `Gdk::Drag#drop_done`
    # call as effective, if this function is called multiple times,
    # all subsequent calls will be ignored.
    def drop_done(success : Bool) : Nil
      # gdk_drag_drop_done: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_drag_drop_done(self, success)

      # Return value handling
    end

    # Determines the bitmask of possible actions proposed by the source.
    def actions : Gdk::DragAction
      # gdk_drag_get_actions: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_actions(self)

      # Return value handling

      Gdk::DragAction.new(_retval)
    end

    # Returns the `GdkContentProvider` associated to the `GdkDrag` object.
    def content : Gdk::ContentProvider
      # gdk_drag_get_content: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_content(self)

      # Return value handling

      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the `GdkDevice` associated to the `GdkDrag` object.
    def device : Gdk::Device
      # gdk_drag_get_device: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_device(self)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the `GdkDisplay` that the drag object was created for.
    def display : Gdk::Display
      # gdk_drag_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the surface on which the drag icon should be rendered
    # during the drag operation.
    #
    # Note that the surface may not be available until the drag operation
    # has begun. GDK will move the surface in accordance with the ongoing
    # drag operation. The surface is owned by @drag and will be destroyed
    # when the drag operation is over.
    def drag_surface : Gdk::Surface?
      # gdk_drag_get_drag_surface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_drag_surface(self)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the formats supported by this `GdkDrag` object.
    def formats : Gdk::ContentFormats
      # gdk_drag_get_formats: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_formats(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::None)
    end

    # Determines the action chosen by the drag destination.
    def selected_action : Gdk::DragAction
      # gdk_drag_get_selected_action: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_selected_action(self)

      # Return value handling

      Gdk::DragAction.new(_retval)
    end

    # Returns the `GdkSurface` where the drag originates.
    def surface : Gdk::Surface
      # gdk_drag_get_surface: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_get_surface(self)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    # Sets the position of the drag surface that will be kept
    # under the cursor hotspot.
    #
    # Initially, the hotspot is at the top left corner of the drag surface.
    def set_hotspot(hot_x : Int32, hot_y : Int32) : Nil
      # gdk_drag_set_hotspot: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_drag_set_hotspot(self, hot_x, hot_y)

      # Return value handling
    end

    # Emitted when the drag operation is cancelled.
    struct CancelSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cancel::#{@detail}" : "cancel"
      end

      def connect(&block : Proc(Gdk::DragCancelReason, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::DragCancelReason, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::DragCancelReason, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::DragCancelReason.new(lib_arg0)
          ::Box(Proc(Gdk::DragCancelReason, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::DragCancelReason, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::DragCancelReason.new(lib_arg0)
          ::Box(Proc(Gdk::DragCancelReason, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Drag, Gdk::DragCancelReason, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gdk::Drag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DragCancelReason.new(lib_arg0)
          ::Box(Proc(Gdk::Drag, Gdk::DragCancelReason, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drag, Gdk::DragCancelReason, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gdk::Drag.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DragCancelReason.new(lib_arg0)
          ::Box(Proc(Gdk::Drag, Gdk::DragCancelReason, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(reason : Gdk::DragCancelReason) : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancel", reason)
      end
    end

    def cancel_signal
      CancelSignal.new(self)
    end

    # Emitted when the destination side has finished reading all data.
    #
    # The drag object can now free all miscellaneous data.
    struct DndFinishedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "dnd-finished::#{@detail}" : "dnd-finished"
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

      def connect(block : Proc(Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Drag.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drag, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Drag.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drag, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "dnd-finished")
      end
    end

    def dnd_finished_signal
      DndFinishedSignal.new(self)
    end

    # Emitted when the drop operation is performed on an accepting client.
    struct DropPerformedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drop-performed::#{@detail}" : "drop-performed"
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

      def connect(block : Proc(Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Drag.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drag, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Drag.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drag, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "drop-performed")
      end
    end

    def drop_performed_signal
      DropPerformedSignal.new(self)
    end
  end
end
