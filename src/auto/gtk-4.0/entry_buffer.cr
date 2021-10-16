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
  class EntryBuffer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, length : UInt32? = nil, max_length : Int32? = nil, text : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if length
        (_names.to_unsafe + _n).value = "length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, length)
        _n += 1
      end
      if max_length
        (_names.to_unsafe + _n).value = "max-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_length)
        _n += 1
      end
      if text
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EntryBuffer.g_type, _n, _names, _values)
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

    def initialize(initial_chars : ::String?, n_initial_chars : Int32)
      # gtk_entry_buffer_new: (Constructor)
      # @initial_chars: (nullable)
      # Returns: (transfer full)

      initial_chars = if initial_chars.nil?
                        Pointer(LibC::Char).null
                      else
                        initial_chars.to_unsafe
                      end

      _retval = LibGtk.gtk_entry_buffer_new(initial_chars, n_initial_chars)
      @pointer = _retval
    end

    def delete_text(position : UInt32, n_chars : Int32) : UInt32
      # gtk_entry_buffer_delete_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_buffer_delete_text(self, position, n_chars)
      _retval
    end

    def emit_deleted_text(position : UInt32, n_chars : UInt32) : Nil
      # gtk_entry_buffer_emit_deleted_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_buffer_emit_deleted_text(self, position, n_chars)
    end

    def emit_inserted_text(position : UInt32, chars : ::String, n_chars : UInt32) : Nil
      # gtk_entry_buffer_emit_inserted_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_buffer_emit_inserted_text(self, position, chars, n_chars)
    end

    def bytes : UInt64
      # gtk_entry_buffer_get_bytes: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_buffer_get_bytes(self)
      _retval
    end

    def length : UInt32
      # gtk_entry_buffer_get_length: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_buffer_get_length(self)
      _retval
    end

    def max_length : Int32
      # gtk_entry_buffer_get_max_length: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_buffer_get_max_length(self)
      _retval
    end

    def text : ::String
      # gtk_entry_buffer_get_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_buffer_get_text(self)
      ::String.new(_retval)
    end

    def insert_text(position : UInt32, chars : ::String, n_chars : Int32) : UInt32
      # gtk_entry_buffer_insert_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_buffer_insert_text(self, position, chars, n_chars)
      _retval
    end

    def max_length=(max_length : Int32) : Nil
      # gtk_entry_buffer_set_max_length: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_buffer_set_max_length(self, max_length)
    end

    def set_text(chars : ::String, n_chars : Int32) : Nil
      # gtk_entry_buffer_set_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_buffer_set_text(self, chars, n_chars)
    end

    struct DeletedTextSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "deleted-text::#{@detail}" : "deleted-text"
      end

      def connect(&block : Proc(UInt32, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(UInt32, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(UInt32, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EntryBuffer, UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EntryBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::EntryBuffer, UInt32, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryBuffer, UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EntryBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::EntryBuffer, UInt32, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(position : UInt32, n_chars : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "deleted-text", position, n_chars)
      end
    end

    def deleted_text_signal
      DeletedTextSignal.new(self)
    end

    struct InsertedTextSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "inserted-text::#{@detail}" : "inserted-text"
      end

      def connect(&block : Proc(UInt32, ::String, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, ::String, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(UInt32, ::String, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(LibC::Char), lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(UInt32, ::String, UInt32, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, ::String, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(LibC::Char), lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(UInt32, ::String, UInt32, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EntryBuffer, UInt32, ::String, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(LibC::Char), lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EntryBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(Gtk::EntryBuffer, UInt32, ::String, UInt32, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryBuffer, UInt32, ::String, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(LibC::Char), lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EntryBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(Gtk::EntryBuffer, UInt32, ::String, UInt32, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
