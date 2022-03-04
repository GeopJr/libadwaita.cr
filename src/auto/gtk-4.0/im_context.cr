require "../g_object-2.0/object"

module Gtk
  # `GtkIMContext` defines the interface for GTK input methods.
  #
  # `GtkIMContext` is used by GTK text input widgets like `GtkText`
  # to map from key events to Unicode character strings.
  #
  # An input method may consume multiple key events in sequence before finally
  # outputting the composed result. This is called *preediting*, and an input
  # method may provide feedback about this process by displaying the intermediate
  # composition states as preedit text. To do so, the `GtkIMContext` will emit
  # [signal@Gtk.IMContext::preedit-start], [signal@Gtk.IMContext::preedit-changed]
  # and [signal@Gtk.IMContext::preedit-end] signals.
  #
  # For instance, the built-in GTK input method [class@Gtk.IMContextSimple]
  # implements the input of arbitrary Unicode code points by holding down the
  # <kbd>Control</kbd> and <kbd>Shift</kbd> keys and then typing <kbd>u</kbd>
  # followed by the hexadecimal digits of the code point. When releasing the
  # <kbd>Control</kbd> and <kbd>Shift</kbd> keys, preediting ends and the
  # character is inserted as text. For example,
  #
  #     Ctrl+Shift+u 2 0 A C
  #
  # results in the € sign.
  #
  # Additional input methods can be made available for use by GTK widgets as
  # loadable modules. An input method module is a small shared library which
  # provides a `GIOExtension` for the extension point named "gtk-im-module".
  #
  # To connect a widget to the users preferred input method, you should use
  # [class@Gtk.IMMulticontext].
  class IMContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if input_hints
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if input_purpose
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IMContext.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_im_context_get_type
    end

    def input_hints=(value : Gtk::InputHints) : Gtk::InputHints
      unsafe_value = value

      LibGObject.g_object_set(self, "input-hints", unsafe_value, Pointer(Void).null)
      value
    end

    def input_hints : Gtk::InputHints
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-hints", pointerof(value), Pointer(Void).null)
      Gtk::InputHints.from_value(value)
    end

    def input_purpose=(value : Gtk::InputPurpose) : Gtk::InputPurpose
      unsafe_value = value

      LibGObject.g_object_set(self, "input-purpose", unsafe_value, Pointer(Void).null)
      value
    end

    def input_purpose : Gtk::InputPurpose
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-purpose", pointerof(value), Pointer(Void).null)
      Gtk::InputPurpose.from_value(value)
    end

    def delete_surrounding(offset : Int32, n_chars : Int32) : Bool
      # gtk_im_context_delete_surrounding: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_im_context_delete_surrounding(self, offset, n_chars)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def filter_key(press : Bool, surface : Gdk::Surface, device : Gdk::Device, time : UInt32, keycode : UInt32, state : Gdk::ModifierType, group : Int32) : Bool
      # gtk_im_context_filter_key: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_im_context_filter_key(self, press, surface, device, time, keycode, state, group)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def filter_keypress(event : Gdk::Event) : Bool
      # gtk_im_context_filter_keypress: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_im_context_filter_keypress(self, event)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def focus_in : Nil
      # gtk_im_context_focus_in: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_im_context_focus_in(self)

      # Return value handling
    end

    def focus_out : Nil
      # gtk_im_context_focus_out: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_im_context_focus_out(self)

      # Return value handling
    end

    def preedit_string(str : ::String, attrs : Pango::AttrList, cursor_pos : Int32) : Nil
      # gtk_im_context_get_preedit_string: (Method)
      # @str: (out) (transfer full)
      # @attrs: (out) (transfer full)
      # @cursor_pos: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(attrs)

      # C call
      LibGtk.gtk_im_context_get_preedit_string(self, str, attrs, cursor_pos)

      # Return value handling
    end

    def surrounding(text : ::String, cursor_index : Int32) : Bool
      # gtk_im_context_get_surrounding: (Method)
      # @text: (out) (transfer full)
      # @cursor_index: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_im_context_get_surrounding(self, text, cursor_index)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def surrounding_with_selection(text : ::String, cursor_index : Int32, anchor_index : Int32) : Bool
      # gtk_im_context_get_surrounding_with_selection: (Method)
      # @text: (out) (transfer full)
      # @cursor_index: (out) (transfer full)
      # @anchor_index: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_im_context_get_surrounding_with_selection(self, text, cursor_index, anchor_index)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def reset : Nil
      # gtk_im_context_reset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_im_context_reset(self)

      # Return value handling
    end

    def client_widget=(widget : Gtk::Widget?) : Nil
      # gtk_im_context_set_client_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_im_context_set_client_widget(self, widget)

      # Return value handling
    end

    def cursor_location=(area : Gdk::Rectangle) : Nil
      # gtk_im_context_set_cursor_location: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_im_context_set_cursor_location(self, area)

      # Return value handling
    end

    def set_surrounding(text : ::String, len : Int32, cursor_index : Int32) : Nil
      # gtk_im_context_set_surrounding: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_im_context_set_surrounding(self, text, len, cursor_index)

      # Return value handling
    end

    def set_surrounding_with_selection(text : ::String, len : Int32, cursor_index : Int32, anchor_index : Int32) : Nil
      # gtk_im_context_set_surrounding_with_selection: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_im_context_set_surrounding_with_selection(self, text, len, cursor_index, anchor_index)

      # Return value handling
    end

    def use_preedit=(use_preedit : Bool) : Nil
      # gtk_im_context_set_use_preedit: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_im_context_set_use_preedit(self, use_preedit)

      # Return value handling
    end

    struct CommitSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "commit::#{@detail}" : "commit"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::IMContext, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::IMContext, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IMContext, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::IMContext, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(str : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "commit", str)
      end
    end

    def commit_signal
      CommitSignal.new(self)
    end

    struct DeleteSurroundingSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "delete-surrounding::#{@detail}" : "delete-surrounding"
      end

      def connect(&block : Proc(Int32, Int32, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Bool))
        connect(block)
      end

      def connect(block : Proc(Int32, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::IMContext, Int32, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::IMContext, Int32, Int32, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IMContext, Int32, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::IMContext, Int32, Int32, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(offset : Int32, n_chars : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-surrounding", offset, n_chars)
      end
    end

    def delete_surrounding_signal
      DeleteSurroundingSignal.new(self)
    end

    struct PreeditChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "preedit-changed::#{@detail}" : "preedit-changed"
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

      def connect(block : Proc(Gtk::IMContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IMContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-changed")
      end
    end

    def preedit_changed_signal
      PreeditChangedSignal.new(self)
    end

    struct PreeditEndSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "preedit-end::#{@detail}" : "preedit-end"
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

      def connect(block : Proc(Gtk::IMContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IMContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-end")
      end
    end

    def preedit_end_signal
      PreeditEndSignal.new(self)
    end

    struct PreeditStartSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "preedit-start::#{@detail}" : "preedit-start"
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

      def connect(block : Proc(Gtk::IMContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IMContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-start")
      end
    end

    def preedit_start_signal
      PreeditStartSignal.new(self)
    end

    struct RetrieveSurroundingSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "retrieve-surrounding::#{@detail}" : "retrieve-surrounding"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::IMContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IMContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IMContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "retrieve-surrounding")
      end
    end

    def retrieve_surrounding_signal
      RetrieveSurroundingSignal.new(self)
    end
  end
end
