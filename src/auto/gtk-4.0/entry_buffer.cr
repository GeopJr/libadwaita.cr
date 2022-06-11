require "../g_object-2.0/object"

module Gtk
  # A `GtkEntryBuffer` hold the text displayed in a `GtkText` widget.
  #
  # A single `GtkEntryBuffer` object can be shared by multiple widgets
  # which will then share the same text content, but not the cursor
  # position, visibility attributes, icon etc.
  #
  # `GtkEntryBuffer` may be derived from. Such a derived class might allow
  # text to be stored in an alternate location, such as non-pageable memory,
  # useful in the case of important passwords. Or a derived class could
  # integrate with an application’s concept of undo/redo.
  @[GObject::GeneratedWrapper]
  class EntryBuffer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EntryBufferClass), class_init,
        sizeof(LibGtk::EntryBuffer), instance_init, 0)
    end

    GICrystal.define_new_method(EntryBuffer, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EntryBuffer`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, length : UInt32? = nil, max_length : Int32? = nil, text : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !length.nil?
        (_names.to_unsafe + _n).value = "length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, length)
        _n += 1
      end
      if !max_length.nil?
        (_names.to_unsafe + _n).value = "max-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_length)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EntryBuffer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_entry_buffer_get_type
    end

    def length : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "length", pointerof(value), Pointer(Void).null)
      value
    end

    def max_length=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-length", unsafe_value, Pointer(Void).null)
      value
    end

    def max_length : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-length", pointerof(value), Pointer(Void).null)
      value
    end

    def text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "text", unsafe_value, Pointer(Void).null)
      value
    end

    def text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Create a new `GtkEntryBuffer` object.
    #
    # Optionally, specify initial text to set in the buffer.
    def self.new(initial_chars : ::String?, n_initial_chars : Int32) : self
      # gtk_entry_buffer_new: (Constructor)
      # @initial_chars: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      initial_chars = if initial_chars.nil?
                        Pointer(LibC::Char).null
                      else
                        initial_chars.to_unsafe
                      end

      # C call
      _retval = LibGtk.gtk_entry_buffer_new(initial_chars, n_initial_chars)

      # Return value handling

      Gtk::EntryBuffer.new(_retval, GICrystal::Transfer::Full)
    end

    # Deletes a sequence of characters from the buffer.
    #
    # @n_chars characters are deleted starting at @position.
    # If @n_chars is negative, then all characters until the
    # end of the text are deleted.
    #
    # If @position or @n_chars are out of bounds, then they
    # are coerced to sane values.
    #
    # Note that the positions are specified in characters,
    # not bytes.
    def delete_text(position : UInt32, n_chars : Int32) : UInt32
      # gtk_entry_buffer_delete_text: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_buffer_delete_text(@pointer, position, n_chars)

      # Return value handling

      _retval
    end

    # Used when subclassing `GtkEntryBuffer`.
    def emit_deleted_text(position : UInt32, n_chars : UInt32) : Nil
      # gtk_entry_buffer_emit_deleted_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_buffer_emit_deleted_text(@pointer, position, n_chars)

      # Return value handling
    end

    # Used when subclassing `GtkEntryBuffer`.
    def emit_inserted_text(position : UInt32, chars : ::String, n_chars : UInt32) : Nil
      # gtk_entry_buffer_emit_inserted_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_buffer_emit_inserted_text(@pointer, position, chars, n_chars)

      # Return value handling
    end

    # Retrieves the length in bytes of the buffer.
    #
    # See `Gtk::EntryBuffer#length`.
    def bytes : UInt64
      # gtk_entry_buffer_get_bytes: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_buffer_get_bytes(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the length in characters of the buffer.
    def length : UInt32
      # gtk_entry_buffer_get_length: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_buffer_get_length(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the maximum allowed length of the text in @buffer.
    def max_length : Int32
      # gtk_entry_buffer_get_max_length: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_buffer_get_max_length(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the contents of the buffer.
    #
    # The memory pointer returned by this call will not change
    # unless this object emits a signal, or is finalized.
    def text : ::String
      # gtk_entry_buffer_get_text: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_buffer_get_text(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Inserts @n_chars characters of @chars into the contents of the
    # buffer, at position @position.
    #
    # If @n_chars is negative, then characters from chars will be inserted
    # until a null-terminator is found. If @position or @n_chars are out of
    # bounds, or the maximum buffer text length is exceeded, then they are
    # coerced to sane values.
    #
    # Note that the position and length are in characters, not in bytes.
    def insert_text(position : UInt32, chars : ::String, n_chars : Int32) : UInt32
      # gtk_entry_buffer_insert_text: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_buffer_insert_text(@pointer, position, chars, n_chars)

      # Return value handling

      _retval
    end

    # Sets the maximum allowed length of the contents of the buffer.
    #
    # If the current contents are longer than the given length, then
    # they will be truncated to fit.
    def max_length=(max_length : Int32) : Nil
      # gtk_entry_buffer_set_max_length: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_buffer_set_max_length(@pointer, max_length)

      # Return value handling
    end

    # Sets the text in the buffer.
    #
    # This is roughly equivalent to calling
    # `Gtk::EntryBuffer#delete_text` and
    # `Gtk::EntryBuffer#insert_text`.
    #
    # Note that @n_chars is in characters, not in bytes.
    def set_text(chars : ::String, n_chars : Int32) : Nil
      # gtk_entry_buffer_set_text: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_buffer_set_text(@pointer, chars, n_chars)

      # Return value handling
    end

    # The text is altered in the default handler for this signal.
    #
    # If you want access to the text after the text has been modified,
    # use %G_CONNECT_AFTER.
    struct DeletedTextSignal < GObject::Signal
      def name : String
        @detail ? "deleted-text::#{@detail}" : "deleted-text"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_n_chars : UInt32, _lib_box : Pointer(Void)) {
          position = lib_position
          n_chars = lib_n_chars
          ::Box(Proc(UInt32, UInt32, Nil)).unbox(_lib_box).call(position, n_chars)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::EntryBuffer, UInt32, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_n_chars : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::EntryBuffer.new(_lib_sender, GICrystal::Transfer::None)
          position = lib_position
          n_chars = lib_n_chars
          ::Box(Proc(Gtk::EntryBuffer, UInt32, UInt32, Nil)).unbox(_lib_box).call(_sender, position, n_chars)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(position : UInt32, n_chars : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "deleted-text", position, n_chars)
      end
    end

    def deleted_text_signal
      DeletedTextSignal.new(self)
    end

    # This signal is emitted after text is inserted into the buffer.
    struct InsertedTextSignal < GObject::Signal
      def name : String
        @detail ? "inserted-text::#{@detail}" : "inserted-text"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, ::String, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, ::String, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_chars : Pointer(LibC::Char), lib_n_chars : UInt32, _lib_box : Pointer(Void)) {
          position = lib_position
          # Generator::BuiltInTypeArgPlan
          chars = ::String.new(lib_chars)
          n_chars = lib_n_chars
          ::Box(Proc(UInt32, ::String, UInt32, Nil)).unbox(_lib_box).call(position, chars, n_chars)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::EntryBuffer, UInt32, ::String, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_chars : Pointer(LibC::Char), lib_n_chars : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::EntryBuffer.new(_lib_sender, GICrystal::Transfer::None)
          position = lib_position
          # Generator::BuiltInTypeArgPlan
          chars = ::String.new(lib_chars)
          n_chars = lib_n_chars
          ::Box(Proc(Gtk::EntryBuffer, UInt32, ::String, UInt32, Nil)).unbox(_lib_box).call(_sender, position, chars, n_chars)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(position : UInt32, chars : ::String, n_chars : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "inserted-text", position, chars, n_chars)
      end
    end

    def inserted_text_signal
      InsertedTextSignal.new(self)
    end
  end
end
