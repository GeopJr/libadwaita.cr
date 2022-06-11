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
  # For instance, the built-in GTK input method `Gtk#IMContextSimple`
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
  # `Gtk#IMMulticontext`.
  @[GObject::GeneratedWrapper]
  class IMContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::IMContextClass), class_init,
        sizeof(LibGtk::IMContext), instance_init, 0)
    end

    GICrystal.define_new_method(IMContext, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `IMContext`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !input_hints.nil?
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if !input_purpose.nil?
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IMContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::InputHints.new(value)
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
      Gtk::InputPurpose.new(value)
    end

    # Asks the widget that the input context is attached to delete
    # characters around the cursor position by emitting the
    # `::delete_surrounding` signal.
    #
    # Note that @offset and @n_chars are in characters not in bytes
    # which differs from the usage other places in `GtkIMContext`.
    #
    # In order to use this function, you should first call
    # `Gtk::IMContext#surrounding` to get the current context,
    # and call this function immediately afterwards to make sure that you
    # know what you are deleting. You should also account for the fact
    # that even if the signal was handled, the input context might not
    # have deleted all the characters that were requested to be deleted.
    #
    # This function is used by an input method that wants to make
    # subsitutions in the existing text in response to new input.
    # It is not useful for applications.
    def delete_surrounding(offset : Int32, n_chars : Int32) : Bool
      # gtk_im_context_delete_surrounding: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_im_context_delete_surrounding(@pointer, offset, n_chars)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Allow an input method to forward key press and release events
    # to another input method without necessarily having a `GdkEvent`
    # available.
    def filter_key(press : Bool, surface : Gdk::Surface, device : Gdk::Device, time : UInt32, keycode : UInt32, state : Gdk::ModifierType, group : Int32) : Bool
      # gtk_im_context_filter_key: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_im_context_filter_key(@pointer, press, surface, device, time, keycode, state, group)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Allow an input method to internally handle key press and release
    # events.
    #
    # If this function returns %TRUE, then no further processing
    # should be done for this key event.
    def filter_keypress(event : Gdk::Event) : Bool
      # gtk_im_context_filter_keypress: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_im_context_filter_keypress(@pointer, event)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Notify the input method that the widget to which this
    # input context corresponds has gained focus.
    #
    # The input method may, for example, change the displayed
    # feedback to reflect this change.
    def focus_in : Nil
      # gtk_im_context_focus_in: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_focus_in(@pointer)

      # Return value handling
    end

    # Notify the input method that the widget to which this
    # input context corresponds has lost focus.
    #
    # The input method may, for example, change the displayed
    # feedback or reset the contexts state to reflect this change.
    def focus_out : Nil
      # gtk_im_context_focus_out: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_focus_out(@pointer)

      # Return value handling
    end

    # Retrieve the current preedit string for the input context,
    # and a list of attributes to apply to the string.
    #
    # This string should be displayed inserted at the insertion point.
    def preedit_string(str : ::String, attrs : Pango::AttrList, cursor_pos : Int32) : Nil
      # gtk_im_context_get_preedit_string: (Method)
      # @str: (out) (transfer full)
      # @attrs: (out) (transfer full)
      # @cursor_pos: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_get_preedit_string(@pointer, str, attrs, cursor_pos)

      # Return value handling
    end

    # Retrieves context around the insertion point.
    #
    # Input methods typically want context in order to constrain input text
    # based on existing text; this is important for languages such as Thai
    # where only some sequences of characters are allowed.
    #
    # This function is implemented by emitting the
    # [signal@Gtk.IMContext::retrieve-surrounding] signal on the input method;
    # in response to this signal, a widget should provide as much context as
    # is available, up to an entire paragraph, by calling
    # `Gtk::IMContext#surrounding=`.
    #
    # Note that there is no obligation for a widget to respond to the
    # `::retrieve-surrounding` signal, so input methods must be prepared to
    # function without context.
    def surrounding(text : ::String, cursor_index : Int32) : Bool
      # gtk_im_context_get_surrounding: (Method)
      # @text: (out) (transfer full)
      # @cursor_index: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_im_context_get_surrounding(@pointer, text, cursor_index)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves context around the insertion point.
    #
    # Input methods typically want context in order to constrain input
    # text based on existing text; this is important for languages such
    # as Thai where only some sequences of characters are allowed.
    #
    # This function is implemented by emitting the
    # [signal@Gtk.IMContext::retrieve-surrounding] signal on the input method;
    # in response to this signal, a widget should provide as much context as
    # is available, up to an entire paragraph, by calling
    # `Gtk::IMContext#surrounding_with_selection=`.
    #
    # Note that there is no obligation for a widget to respond to the
    # `::retrieve-surrounding` signal, so input methods must be prepared to
    # function without context.
    def surrounding_with_selection(text : ::String, cursor_index : Int32, anchor_index : Int32) : Bool
      # gtk_im_context_get_surrounding_with_selection: (Method)
      # @text: (out) (transfer full)
      # @cursor_index: (out) (transfer full)
      # @anchor_index: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_im_context_get_surrounding_with_selection(@pointer, text, cursor_index, anchor_index)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Notify the input method that a change such as a change in cursor
    # position has been made.
    #
    # This will typically cause the input method to clear the preedit state.
    def reset : Nil
      # gtk_im_context_reset: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_reset(@pointer)

      # Return value handling
    end

    # Set the client widget for the input context.
    #
    # This is the `GtkWidget` holding the input focus. This widget is
    # used in order to correctly position status windows, and may
    # also be used for purposes internal to the input method.
    def client_widget=(widget : Gtk::Widget?) : Nil
      # gtk_im_context_set_client_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_im_context_set_client_widget(@pointer, widget)

      # Return value handling
    end

    # Notify the input method that a change in cursor
    # position has been made.
    #
    # The location is relative to the client widget.
    def cursor_location=(area : Gdk::Rectangle) : Nil
      # gtk_im_context_set_cursor_location: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_set_cursor_location(@pointer, area)

      # Return value handling
    end

    # Sets surrounding context around the insertion point and preedit
    # string.
    #
    # This function is expected to be called in response to the
    # [signal@Gtk.IMContext::retrieve-surrounding] signal, and will
    # likely have no effect if called at other times.
    def set_surrounding(text : ::String, len : Int32, cursor_index : Int32) : Nil
      # gtk_im_context_set_surrounding: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_set_surrounding(@pointer, text, len, cursor_index)

      # Return value handling
    end

    # Sets surrounding context around the insertion point and preedit
    # string. This function is expected to be called in response to the
    # `Gtk::IMContext::#retrieve_surrounding` signal, and will likely
    # have no effect if called at other times.
    def set_surrounding_with_selection(text : ::String, len : Int32, cursor_index : Int32, anchor_index : Int32) : Nil
      # gtk_im_context_set_surrounding_with_selection: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_set_surrounding_with_selection(@pointer, text, len, cursor_index, anchor_index)

      # Return value handling
    end

    # Sets whether the IM context should use the preedit string
    # to display feedback.
    #
    # If @use_preedit is %FALSE (default is %TRUE), then the IM context
    # may use some other method to display feedback, such as displaying
    # it in a child of the root window.
    def use_preedit=(use_preedit : Bool) : Nil
      # gtk_im_context_set_use_preedit: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_set_use_preedit(@pointer, use_preedit)

      # Return value handling
    end

    # The ::commit signal is emitted when a complete input sequence
    # has been entered by the user.
    #
    # If the commit comes after a preediting sequence, the
    # ::commit signal is emitted after ::preedit-end.
    #
    # This can be a single character immediately after a key press or
    # the final result of preediting.
    struct CommitSignal < GObject::Signal
      def name : String
        @detail ? "commit::#{@detail}" : "commit"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_str : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          str = ::String.new(lib_str)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(str)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::IMContext, ::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_str : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::IMContext.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          str = ::String.new(lib_str)
          ::Box(Proc(Gtk::IMContext, ::String, Nil)).unbox(_lib_box).call(_sender, str)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(str : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "commit", str)
      end
    end

    def commit_signal
      CommitSignal.new(self)
    end

    # The ::delete-surrounding signal is emitted when the input method
    # needs to delete all or part of the context surrounding the cursor.
    struct DeleteSurroundingSignal < GObject::Signal
      def name : String
        @detail ? "delete-surrounding::#{@detail}" : "delete-surrounding"
      end

      def connect(*, after : Bool = false, &block : Proc(Int32, Int32, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Int32, Int32, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_offset : Int32, lib_n_chars : Int32, _lib_box : Pointer(Void)) {
          offset = lib_offset
          n_chars = lib_n_chars
          ::Box(Proc(Int32, Int32, Bool)).unbox(_lib_box).call(offset, n_chars)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::IMContext, Int32, Int32, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_offset : Int32, lib_n_chars : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::IMContext.new(_lib_sender, GICrystal::Transfer::None)
          offset = lib_offset
          n_chars = lib_n_chars
          ::Box(Proc(Gtk::IMContext, Int32, Int32, Bool)).unbox(_lib_box).call(_sender, offset, n_chars)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(offset : Int32, n_chars : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-surrounding", offset, n_chars)
      end
    end

    def delete_surrounding_signal
      DeleteSurroundingSignal.new(self)
    end

    # The ::preedit-changed signal is emitted whenever the preedit sequence
    # currently being entered has changed.
    #
    # It is also emitted at the end of a preedit sequence, in which case
    # `Gtk::IMContext#preedit_string` returns the empty string.
    struct PreeditChangedSignal < GObject::Signal
      def name : String
        @detail ? "preedit-changed::#{@detail}" : "preedit-changed"
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

      def connect(handler : Proc(Gtk::IMContext, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IMContext.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-changed")
      end
    end

    def preedit_changed_signal
      PreeditChangedSignal.new(self)
    end

    # The ::preedit-end signal is emitted when a preediting sequence
    # has been completed or canceled.
    struct PreeditEndSignal < GObject::Signal
      def name : String
        @detail ? "preedit-end::#{@detail}" : "preedit-end"
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

      def connect(handler : Proc(Gtk::IMContext, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IMContext.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-end")
      end
    end

    def preedit_end_signal
      PreeditEndSignal.new(self)
    end

    # The ::preedit-start signal is emitted when a new preediting sequence
    # starts.
    struct PreeditStartSignal < GObject::Signal
      def name : String
        @detail ? "preedit-start::#{@detail}" : "preedit-start"
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

      def connect(handler : Proc(Gtk::IMContext, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IMContext.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-start")
      end
    end

    def preedit_start_signal
      PreeditStartSignal.new(self)
    end

    # The ::retrieve-surrounding signal is emitted when the input method
    # requires the context surrounding the cursor.
    #
    # The callback should set the input method surrounding context by
    # calling the `Gtk::IMContext#surrounding=` method.
    struct RetrieveSurroundingSignal < GObject::Signal
      def name : String
        @detail ? "retrieve-surrounding::#{@detail}" : "retrieve-surrounding"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::IMContext, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IMContext.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IMContext, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
