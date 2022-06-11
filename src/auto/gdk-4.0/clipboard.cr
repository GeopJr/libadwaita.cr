require "../g_object-2.0/object"

module Gdk
  # The `GdkClipboard` object represents data shared between applications or
  # inside an application.
  #
  # To get a `GdkClipboard` object, use `Gdk::Display#clipboard` or
  # `Gdk::Display#primary_clipboard`. You can find out about the data
  # that is currently available in a clipboard using
  # `Gdk::Clipboard#formats`.
  #
  # To make text or image data available in a clipboard, use
  # `Gdk::Clipboard#text=` or `Gdk::Clipboard#texture=`.
  # For other data, you can use `Gdk::Clipboard#content=`, which
  # takes a `Gdk#ContentProvider` object.
  #
  # To read textual or image data from a clipboard, use
  # `Gdk::Clipboard#read_text_async` or
  # `Gdk::Clipboard#read_texture_async`. For other data, use
  # `Gdk::Clipboard#read_async`, which provides a `GInputStream` object.
  @[GObject::GeneratedWrapper]
  class Clipboard < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Clipboard, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Clipboard`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, content : Gdk::ContentProvider? = nil, display : Gdk::Display? = nil, formats : Gdk::ContentFormats? = nil, local : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !content.nil?
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
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
      if !local.nil?
        (_names.to_unsafe + _n).value = "local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, local)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Clipboard.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_clipboard_get_type
    end

    def content : Gdk::ContentProvider?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "content", pointerof(value), Pointer(Void).null)
      Gdk::ContentProvider.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def formats : Gdk::ContentFormats?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "formats", pointerof(value), Pointer(Void).null)
      Gdk::ContentFormats.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def local? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "local", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Returns the `GdkContentProvider` currently set on @clipboard.
    #
    # If the @clipboard is empty or its contents are not owned by the
    # current process, %NULL will be returned.
    def content : Gdk::ContentProvider?
      # gdk_clipboard_get_content: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_clipboard_get_content(@pointer)

      # Return value handling

      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GdkDisplay` that the clipboard was created for.
    def display : Gdk::Display
      # gdk_clipboard_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_clipboard_get_display(@pointer)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the formats that the clipboard can provide its current contents in.
    def formats : Gdk::ContentFormats
      # gdk_clipboard_get_formats: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_clipboard_get_formats(@pointer)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::None)
    end

    # Returns if the clipboard is local.
    #
    # A clipboard is considered local if it was last claimed
    # by the running application.
    #
    # Note that `Gdk::Clipboard#content` may return %NULL
    # even on a local clipboard. In this case the clipboard is empty.
    def is_local : Bool
      # gdk_clipboard_is_local: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_clipboard_is_local(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronously requests an input stream to read the @clipboard's
    # contents from.
    #
    # When the operation is finished @callback will be called. You must then
    # call `Gdk::Clipboard#read_finish` to get the result of the operation.
    #
    # The clipboard will choose the most suitable mime type from the given list
    # to fulfill the request, preferring the ones listed first.
    def read_async(mime_types : Enumerable(::String), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_clipboard_read_async: (Method)
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
      LibGdk.gdk_clipboard_read_async(@pointer, mime_types, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous clipboard read.
    #
    # See `Gdk::Clipboard#read_async`.
    def read_finish(result : Gio::AsyncResult) : Gio::InputStream?
      # gdk_clipboard_read_finish: (Method | Throws)
      # @out_mime_type: (out) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      out_mime_type = Pointer(Pointer(LibC::Char)).null
      # C call
      _retval = LibGdk.gdk_clipboard_read_finish(@pointer, result, out_mime_type, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Asynchronously request the @clipboard contents converted to a string.
    #
    # When the operation is finished @callback will be called. You must then
    # call `Gdk::Clipboard#read_text_finish` to get the result.
    #
    # This is a simple wrapper around `Gdk::Clipboard#read_value_async`.
    # Use that function or `Gdk::Clipboard#read_async` directly if you
    # need more control over the operation.
    def read_text_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_clipboard_read_text_async: (Method)
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
      LibGdk.gdk_clipboard_read_text_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous clipboard read.
    #
    # See `Gdk::Clipboard#read_text_async`.
    def read_text_finish(result : Gio::AsyncResult) : ::String?
      # gdk_clipboard_read_text_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_clipboard_read_text_finish(@pointer, result, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Asynchronously request the @clipboard contents converted to a `GdkPixbuf`.
    #
    # When the operation is finished @callback will be called. You must then
    # call `Gdk::Clipboard#read_texture_finish` to get the result.
    #
    # This is a simple wrapper around `Gdk::Clipboard#read_value_async`.
    # Use that function or `Gdk::Clipboard#read_async` directly if you
    # need more control over the operation.
    def read_texture_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_clipboard_read_texture_async: (Method)
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
      LibGdk.gdk_clipboard_read_texture_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous clipboard read.
    #
    # See `Gdk::Clipboard#read_texture_async`.
    def read_texture_finish(result : Gio::AsyncResult) : Gdk::Texture?
      # gdk_clipboard_read_texture_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_clipboard_read_texture_finish(@pointer, result, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Asynchronously request the @clipboard contents converted to the given
    # @type.
    #
    # When the operation is finished @callback will be called. You must then call
    # `Gdk::Clipboard#read_value_finish` to get the resulting `GValue`.
    #
    # For local clipboard contents that are available in the given `GType`,
    # the value will be copied directly. Otherwise, GDK will try to use
    # `#content_deserialize_async` to convert the clipboard's data.
    def read_value_async(type : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_clipboard_read_value_async: (Method)
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
      LibGdk.gdk_clipboard_read_value_async(@pointer, type, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous clipboard read.
    #
    # See `Gdk::Clipboard#read_value_async`.
    def read_value_finish(result : Gio::AsyncResult) : GObject::Value
      # gdk_clipboard_read_value_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_clipboard_read_value_finish(@pointer, result, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    # Sets a new content provider on @clipboard.
    #
    # The clipboard will claim the `GdkDisplay`'s resources and advertise
    # these new contents to other applications.
    #
    # In the rare case of a failure, this function will return %FALSE. The
    # clipboard will then continue reporting its old contents and ignore
    # @provider.
    #
    # If the contents are read by either an external application or the
    # @clipboard's read functions, @clipboard will select the best format to
    # transfer the contents and then request that format from @provider.
    def content=(provider : Gdk::ContentProvider?) : Bool
      # gdk_clipboard_set_content: (Method)
      # @provider: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      provider = if provider.nil?
                   Pointer(Void).null
                 else
                   provider.to_unsafe
                 end

      # C call
      _retval = LibGdk.gdk_clipboard_set_content(@pointer, provider)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the clipboard to contain the value collected from the given varargs.
    #
    # Values should be passed the same way they are passed to other value
    # collecting APIs, such as [`method@GObject.Object.set`] or
    # [`func@GObject.signal_emit`].
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # gdk_clipboard_set (clipboard, GTK_TYPE_STRING, "Hello World");
    #
    # gdk_clipboard_set (clipboard, GDK_TYPE_TEXTURE, some_texture);
    # ```
    def set(value : _) : Nil
      # gdk_clipboard_set_value: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGdk.gdk_clipboard_set_value(@pointer, value)

      # Return value handling
    end

    # Asynchronously instructs the @clipboard to store its contents remotely.
    #
    # If the clipboard is not local, this function does nothing but report success.
    #
    # The @callback must call `Gdk::Clipboard#store_finish`.
    #
    # The purpose of this call is to preserve clipboard contents beyond the
    # lifetime of an application, so this function is typically called on
    # exit. Depending on the platform, the functionality may not be available
    # unless a "clipboard manager" is running.
    #
    # This function is called automatically when a `Gtk#Application` is
    # shut down, so you likely don't need to call it.
    def store_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_clipboard_store_async: (Method)
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
      LibGdk.gdk_clipboard_store_async(@pointer, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous clipboard store.
    #
    # See `Gdk::Clipboard#store_async`.
    def store_finish(result : Gio::AsyncResult) : Bool
      # gdk_clipboard_store_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_clipboard_store_finish(@pointer, result, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted when the clipboard changes ownership.
    struct ChangedSignal < GObject::Signal
      def name : String
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gdk::Clipboard, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Clipboard.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Clipboard, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
