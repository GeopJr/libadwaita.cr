require "../g_object-2.0/object"

module Gdk
  # The `GdkDrop` object represents the target of an ongoing DND operation.
  #
  # Possible drop sites get informed about the status of the ongoing drag
  # operation with events of type %GDK_DRAG_ENTER, %GDK_DRAG_LEAVE,
  # %GDK_DRAG_MOTION and %GDK_DROP_START. The `GdkDrop` object can be obtained
  # from these [class@Gdk.Event] types using [method@Gdk.DNDEvent.get_drop].
  #
  # The actual data transfer is initiated from the target side via an async
  # read, using one of the `GdkDrop` methods for this purpose:
  # [method@Gdk.Drop.read_async] or [method@Gdk.Drop.read_value_async].
  #
  # GTK provides a higher level abstraction based on top of these functions,
  # and so they are not normally needed in GTK applications. See the
  # "Drag and Drop" section of the GTK documentation for more information.
  class Drop < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, device : Gdk::Device? = nil, display : Gdk::Display? = nil, drag : Gdk::Drag? = nil, formats : Gdk::ContentFormats? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if actions
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if device
        (_names.to_unsafe + _n).value = "device".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, device)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if drag
        (_names.to_unsafe + _n).value = "drag".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, drag)
        _n += 1
      end
      if formats
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if surface
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Drop.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_drop_get_type
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
      Gdk::DragAction.from_value(value)
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

    def drag=(value : Gdk::Drag?) : Gdk::Drag?
      unsafe_value = value

      LibGObject.g_object_set(self, "drag", unsafe_value, Pointer(Void).null)
      value
    end

    def drag : Gdk::Drag?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "drag", pointerof(value), Pointer(Void).null)
      Gdk::Drag.new(value, GICrystal::Transfer::None) unless value.null?
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

    def finish(action : Gdk::DragAction) : Nil
      # gdk_drop_finish: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_drop_finish(self, action)
    end

    def actions : Gdk::DragAction
      # gdk_drop_get_actions: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_drop_get_actions(self)
      Gdk::DragAction.from_value(_retval)
    end

    def device : Gdk::Device
      # gdk_drop_get_device: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_drop_get_device(self)
      Gdk::Device.new(_retval, GICrystal::Transfer::None)
    end

    def display : Gdk::Display
      # gdk_drop_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_drop_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def drag : Gdk::Drag?
      # gdk_drop_get_drag: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_drop_get_drag(self)
      Gdk::Drag.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def formats : Gdk::ContentFormats
      # gdk_drop_get_formats: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_drop_get_formats(self)
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::None)
    end

    def surface : Gdk::Surface
      # gdk_drop_get_surface: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_drop_get_surface(self)
      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    def read_async(mime_types : Enumerable(::String), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_drop_read_async: (Method)
      # @mime_types: (array zero-terminated=1 element-type Utf8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      mime_types = mime_types.to_a.map(&.to_unsafe).to_unsafe

      LibGdk.gdk_drop_read_async(self, mime_types, io_priority, cancellable, callback, user_data)
    end

    def read_finish(result : Gio::AsyncResult, out_mime_type : ::String) : Gio::InputStream?
      # gdk_drop_read_finish: (Method | Throws)
      # @out_mime_type: (out) (transfer full)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_drop_read_finish(self, result, out_mime_type)
      Gio::InputStream.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def read_value_async(type : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_drop_read_value_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdk.gdk_drop_read_value_async(self, type, io_priority, cancellable, callback, user_data)
    end

    def read_value_finish(result : Gio::AsyncResult) : GObject::Value
      # gdk_drop_read_value_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_drop_read_value_finish(self, result)
      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    def status(actions : Gdk::DragAction, preferred : Gdk::DragAction) : Nil
      # gdk_drop_status: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_drop_status(self, actions, preferred)
    end
  end
end
