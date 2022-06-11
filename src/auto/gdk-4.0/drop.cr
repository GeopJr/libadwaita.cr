require "../g_object-2.0/object"

module Gdk
  # The `GdkDrop` object represents the target of an ongoing DND operation.
  #
  # Possible drop sites get informed about the status of the ongoing drag
  # operation with events of type %GDK_DRAG_ENTER, %GDK_DRAG_LEAVE,
  # %GDK_DRAG_MOTION and %GDK_DROP_START. The `GdkDrop` object can be obtained
  # from these `Gdk#Event` types using `Gdk::DNDEvent#drop`.
  #
  # The actual data transfer is initiated from the target side via an async
  # read, using one of the `GdkDrop` methods for this purpose:
  # `Gdk::Drop#read_async` or `Gdk::Drop#read_value_async`.
  #
  # GTK provides a higher level abstraction based on top of these functions,
  # and so they are not normally needed in GTK applications. See the
  # "Drag and Drop" section of the GTK documentation for more information.
  @[GObject::GeneratedWrapper]
  class Drop < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Drop, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Drop`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, device : Gdk::Device? = nil, display : Gdk::Display? = nil, drag : Gdk::Drag? = nil, formats : Gdk::ContentFormats? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !actions.nil?
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
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
      if !drag.nil?
        (_names.to_unsafe + _n).value = "drag".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, drag)
        _n += 1
      end
      if !formats.nil?
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if !surface.nil?
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Drop.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gdk::DragAction.new(value)
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

    # Ends the drag operation after a drop.
    #
    # The @action must be a single action selected from the actions
    # available via `Gdk::Drop#actions`.
    def finish(action : Gdk::DragAction) : Nil
      # gdk_drop_finish: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_drop_finish(@pointer, action)

      # Return value handling
    end

    # Returns the possible actions for this `GdkDrop`.
    #
    # If this value contains multiple actions - i.e.
    # `Gdk::DragAction#is_unique?` returns %FALSE for the result -
    # `Gdk::Drop#finish` must choose the action to use when
    # accepting the drop. This will only happen if you passed
    # %GDK_ACTION_ASK as one of the possible actions in
    # `Gdk::Drop#status`. %GDK_ACTION_ASK itself will not
    # be included in the actions returned by this function.
    #
    # This value may change over the lifetime of the `Gdk#Drop`
    # both as a response to source side actions as well as to calls to
    # `Gdk::Drop#status` or `Gdk::Drop#finish`. The source
    # side will not change this value anymore once a drop has started.
    def actions : Gdk::DragAction
      # gdk_drop_get_actions: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drop_get_actions(@pointer)

      # Return value handling

      Gdk::DragAction.new(_retval)
    end

    # Returns the `GdkDevice` performing the drop.
    def device : Gdk::Device
      # gdk_drop_get_device: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drop_get_device(@pointer)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the `GdkDisplay` that @self was created for.
    def display : Gdk::Display
      # gdk_drop_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drop_get_display(@pointer)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # If this is an in-app drag-and-drop operation, returns the `GdkDrag`
    # that corresponds to this drop.
    #
    # If it is not, %NULL is returned.
    def drag : Gdk::Drag?
      # gdk_drop_get_drag: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drop_get_drag(@pointer)

      # Return value handling

      Gdk::Drag.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the `GdkContentFormats` that the drop offers the data
    # to be read in.
    def formats : Gdk::ContentFormats
      # gdk_drop_get_formats: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drop_get_formats(@pointer)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the `GdkSurface` performing the drop.
    def surface : Gdk::Surface
      # gdk_drop_get_surface: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drop_get_surface(@pointer)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    # Asynchronously read the dropped data from a `GdkDrop`
    # in a format that complies with one of the mime types.
    def read_async(mime_types : Enumerable(::String), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_drop_read_async: (Method)
      # @mime_types: (array zero-terminated=1 element-type Utf8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      mime_types = mime_types.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGdk.gdk_drop_read_async(@pointer, mime_types, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async drop read operation.
    #
    # Note that you must not use blocking read calls on the returned stream
    # in the GTK thread, since some platforms might require communication with
    # GTK to complete the data transfer. You can use async APIs such as
    # g_input_stream_read_bytes_async().
    #
    # See `Gdk::Drop#read_async`.
    def read_finish(result : Gio::AsyncResult, out_mime_type : ::String) : Gio::InputStream?
      # gdk_drop_read_finish: (Method | Throws)
      # @out_mime_type: (out) (transfer full)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_drop_read_finish(@pointer, result, out_mime_type, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Asynchronously request the drag operation's contents converted
    # to the given @type.
    #
    # When the operation is finished @callback will be called. You must
    # then call `Gdk::Drop#read_value_finish` to get the resulting
    # `GValue`.
    #
    # For local drag-and-drop operations that are available in the given
    # `GType`, the value will be copied directly. Otherwise, GDK will
    # try to use `Gdk#content_deserialize_async` to convert the data.
    def read_value_async(type : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_drop_read_value_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGdk.gdk_drop_read_value_async(@pointer, type, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async drop read.
    #
    # See `Gdk::Drop#read_value_async`.
    def read_value_finish(result : Gio::AsyncResult) : GObject::Value
      # gdk_drop_read_value_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_drop_read_value_finish(@pointer, result, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    # Selects all actions that are potentially supported by the destination.
    #
    # When calling this function, do not restrict the passed in actions to
    # the ones provided by `Gdk::Drop#actions`. Those actions may
    # change in the future, even depending on the actions you provide here.
    #
    # The @preferred action is a hint to the drag-and-drop mechanism about which
    # action to use when multiple actions are possible.
    #
    # This function should be called by drag destinations in response to
    # %GDK_DRAG_ENTER or %GDK_DRAG_MOTION events. If the destination does
    # not yet know the exact actions it supports, it should set any possible
    # actions first and then later call this function again.
    def status(actions : Gdk::DragAction, preferred : Gdk::DragAction) : Nil
      # gdk_drop_status: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_drop_status(@pointer, actions, preferred)

      # Return value handling
    end
  end
end
