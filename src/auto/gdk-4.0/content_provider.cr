require "../g_object-2.0/object"

module Gdk
  # A `GdkContentProvider` is used to provide content for the clipboard or
  # for drag-and-drop operations in a number of formats.
  #
  # To create a `GdkContentProvider`, use `Gdk::ContentProvider#new_for_value`
  # or `Gdk::ContentProvider#new_for_bytes`.
  #
  # GDK knows how to handle common text and image formats out-of-the-box. See
  # `Gdk#ContentSerializer` and `Gdk#ContentDeserializer` if you want
  # to add support for application-specific data formats.
  @[GObject::GeneratedWrapper]
  class ContentProvider < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdk::ContentProviderClass), class_init,
        sizeof(LibGdk::ContentProvider), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, formats : Gdk::ContentFormats? = nil, storable_formats : Gdk::ContentFormats? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !formats.nil?
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if !storable_formats.nil?
        (_names.to_unsafe + _n).value = "storable-formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, storable_formats)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ContentProvider.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Create a content provider that provides the given @bytes as data for
    # the given @mime_type.
    def self.new_for_bytes(mime_type : ::String, bytes : GLib::Bytes) : self
      # gdk_content_provider_new_for_bytes: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_provider_new_for_bytes(mime_type, bytes)

      # Return value handling

      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
    end

    # Create a content provider that provides the given @value.
    def self.new_for_value(value : _) : self
      # gdk_content_provider_new_for_value: (Constructor)
      # Returns: (transfer full)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGdk.gdk_content_provider_new_for_value(value)

      # Return value handling

      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a content provider that represents all the given @providers.
    #
    # Whenever data needs to be written, the union provider will try the given
    # @providers in the given order and the first one supporting a format will
    # be chosen to provide it.
    #
    # This allows an easy way to support providing data in different formats.
    # For example, an image may be provided by its file and by the image
    # contents with a call such as
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # gdk_content_provider_new_union ((GdkContentProvider *[2]) {
    #                                   gdk_content_provider_new_typed (G_TYPE_FILE, file),
    #                                   gdk_content_provider_new_typed (G_TYPE_TEXTURE, texture)
    #                                 }, 2);
    # ```
    def self.new_union(providers : Enumerable(Gdk::ContentProvider)?) : self
      # gdk_content_provider_new_union: (Constructor)
      # @providers: (transfer full) (nullable) (array length=n_providers element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_providers = providers.try(&.size) || 0 # Generator::NullableArrayPlan
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

    # Emits the ::content-changed signal.
    def content_changed : Nil
      # gdk_content_provider_content_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_provider_content_changed(self)

      # Return value handling
    end

    # Gets the contents of @provider stored in @value.
    #
    # The @value will have been initialized to the `GType` the value should be
    # provided in. This given `GType` does not need to be listed in the formats
    # returned by `Gdk::ContentProvider#ref_formats`. However, if the
    # given `GType` is not supported, this operation can fail and
    # `G_IO_ERROR_NOT_SUPPORTED` will be reported.
    def value : GObject::Value
      # gdk_content_provider_get_value: (Method | Throws)
      # @value: (out) (caller-allocates)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::CallerAllocatesPlan
      value = GObject::Value.new
      # C call
      _retval = LibGdk.gdk_content_provider_get_value(self, value, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      value
    end

    # Gets the formats that the provider can provide its current contents in.
    def ref_formats : Gdk::ContentFormats
      # gdk_content_provider_ref_formats: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_provider_ref_formats(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the formats that the provider suggests other applications to store
    # the data in.
    #
    # An example of such an application would be a clipboard manager.
    #
    # This can be assumed to be a subset of `Gdk::ContentProvider#ref_formats`.
    def ref_storable_formats : Gdk::ContentFormats
      # gdk_content_provider_ref_storable_formats: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_provider_ref_storable_formats(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously writes the contents of @provider to @stream in the given
    # @mime_type.
    #
    # When the operation is finished @callback will be called. You must then call
    # `Gdk::ContentProvider#write_mime_type_finish` to get the result
    # of the operation.
    #
    # The given mime type does not need to be listed in the formats returned by
    # `Gdk::ContentProvider#ref_formats`. However, if the given `GType` is
    # not supported, `G_IO_ERROR_NOT_SUPPORTED` will be reported.
    #
    # The given @stream will not be closed.
    def write_mime_type_async(mime_type : ::String, stream : Gio::OutputStream, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_content_provider_write_mime_type_async: (Method)
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
      LibGdk.gdk_content_provider_write_mime_type_async(self, mime_type, stream, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous write operation.
    #
    # See `Gdk::ContentProvider#write_mime_type_async`.
    def write_mime_type_finish(result : Gio::AsyncResult) : Bool
      # gdk_content_provider_write_mime_type_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_content_provider_write_mime_type_finish(self, result, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted whenever the content provided by this provider has changed.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gdk::ContentProvider, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::ContentProvider.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::ContentProvider, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::ContentProvider, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::ContentProvider.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::ContentProvider, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
