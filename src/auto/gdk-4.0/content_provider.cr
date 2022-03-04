require "../g_object-2.0/object"

module Gdk
  # A `GdkContentProvider` is used to provide content for the clipboard or
  # for drag-and-drop operations in a number of formats.
  #
  # To create a `GdkContentProvider`, use [ctor@Gdk.ContentProvider.new_for_value]
  # or [ctor@Gdk.ContentProvider.new_for_bytes].
  #
  # GDK knows how to handle common text and image formats out-of-the-box. See
  # [class@Gdk.ContentSerializer] and [class@Gdk.ContentDeserializer] if you want
  # to add support for application-specific data formats.
  class ContentProvider < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, formats : Gdk::ContentFormats? = nil, storable_formats : Gdk::ContentFormats? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if formats
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if storable_formats
        (_names.to_unsafe + _n).value = "storable-formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, storable_formats)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ContentProvider.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_content_provider_get_type
    end

    def formats : Gdk::ContentFormats?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "formats", pointerof(value), Pointer(Void).null)
      Gdk::ContentFormats.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def storable_formats : Gdk::ContentFormats?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "storable-formats", pointerof(value), Pointer(Void).null)
      Gdk::ContentFormats.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.new_for_bytes(mime_type : ::String, bytes : GLib::Bytes) : self
      # gdk_content_provider_new_for_bytes: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_provider_new_for_bytes(mime_type, bytes)

      # Return value handling
      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_value(value : _) : self
      # gdk_content_provider_new_for_value: (Constructor)
      # Returns: (transfer full)

      # Handle parameters
      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      # C call
      _retval = LibGdk.gdk_content_provider_new_for_value(value)

      # Return value handling
      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_union(providers : Enumerable(Gdk::ContentProvider)?) : self
      # gdk_content_provider_new_union: (Constructor)
      # @providers: (transfer full) (nullable) (array length=n_providers element-type Interface)
      # Returns: (transfer full)

      # Handle parameters
      n_providers = providers.try(&.size) || 0
      providers = if providers.nil?
                    Pointer(Pointer(Void)).null
                  else
                    providers.to_a.map(&.to_unsafe).to_unsafe
                  end

      # C call
      _retval = LibGdk.gdk_content_provider_new_union(providers, n_providers)

      # Return value handling
      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_union(*providers : Gdk::ContentProvider)
      self.new_union(providers)
    end

    def content_changed : Nil
      # gdk_content_provider_content_changed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_content_provider_content_changed(self)

      # Return value handling
    end

    def value(value : _) : Bool
      # gdk_content_provider_get_value: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      # C call
      _retval = LibGdk.gdk_content_provider_get_value(self, value, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def ref_formats : Gdk::ContentFormats
      # gdk_content_provider_ref_formats: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_provider_ref_formats(self)

      # Return value handling
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def ref_storable_formats : Gdk::ContentFormats
      # gdk_content_provider_ref_storable_formats: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_provider_ref_storable_formats(self)

      # Return value handling
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def write_mime_type_async(mime_type : ::String, stream : Gio::OutputStream, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # gdk_content_provider_write_mime_type_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGdk.gdk_content_provider_write_mime_type_async(self, mime_type, stream, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def write_mime_type_finish(result : Gio::AsyncResult) : Bool
      # gdk_content_provider_write_mime_type_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_provider_write_mime_type_finish(self, result, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    struct ContentChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "content-changed::#{@detail}" : "content-changed"
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

      def connect(block : Proc(Gdk::ContentProvider, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::ContentProvider.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::ContentProvider, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::ContentProvider, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::ContentProvider.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::ContentProvider, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "content-changed")
      end
    end

    def content_changed_signal
      ContentChangedSignal.new(self)
    end
  end
end
