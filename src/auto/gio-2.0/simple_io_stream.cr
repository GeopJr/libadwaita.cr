require "./io_stream"

module Gio
  # GSimpleIOStream creates a #GIOStream from an arbitrary #GInputStream and
  # #GOutputStream. This allows any pair of input and output streams to be used
  # with #GIOStream methods.
  #
  # This is useful when you obtained a #GInputStream and a #GOutputStream
  # by other means, for instance creating them with platform specific methods as
  # g_unix_input_stream_new() or g_win32_input_stream_new(), and you want
  # to take advantage of the methods provided by #GIOStream.
  @[GObject::GeneratedWrapper]
  class SimpleIOStream < IOStream
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::SimpleIOStream), instance_init, 0)
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

    def initialize(*, closed : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !closed.nil?
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if !input_stream.nil?
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if !output_stream.nil?
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SimpleIOStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_io_stream_get_type
    end

    def input_stream=(value : Gio::InputStream?) : Gio::InputStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "input-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def input_stream : Gio::InputStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "input-stream", pointerof(value), Pointer(Void).null)
      Gio::InputStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def output_stream=(value : Gio::OutputStream?) : Gio::OutputStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "output-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def output_stream : Gio::OutputStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "output-stream", pointerof(value), Pointer(Void).null)
      Gio::OutputStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new #GSimpleIOStream wrapping @input_stream and @output_stream.
    # See also #GIOStream.
    def initialize(input_stream : Gio::InputStream, output_stream : Gio::OutputStream)
      # g_simple_io_stream_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_simple_io_stream_new(input_stream, output_stream)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
