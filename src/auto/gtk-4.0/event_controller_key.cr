require "./event_controller"

module Gtk
  # `GtkEventControllerKey` is an event controller that provides access
  # to key events.
  @[GObject::GeneratedWrapper]
  class EventControllerKey < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EventControllerKeyClass), class_init,
        sizeof(LibGtk::EventControllerKey), instance_init, 0)
    end

    GICrystal.define_new_method(EventControllerKey, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EventControllerKey`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !propagation_limit.nil?
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if !propagation_phase.nil?
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EventControllerKey.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_key_get_type
    end

    # Forwards the current event of this @controller to a @widget.
    #
    # This function can only be used in handlers for the
    # [signal@Gtk.EventControllerKey::key-pressed],
    # [signal@Gtk.EventControllerKey::key-released]
    # or `Gtk::EventControllerKey::#modifiers` signals.
    def forward(widget : Gtk::Widget) : Bool
      # gtk_event_controller_key_forward: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_key_forward(@pointer, widget)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the key group of the current event of this @controller.
    #
    # See `Gdk::KeyEvent#layout`.
    def group : UInt32
      # gtk_event_controller_key_get_group: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_key_get_group(@pointer)

      # Return value handling

      _retval
    end

    # Gets the input method context of the key @controller.
    def im_context : Gtk::IMContext?
      # gtk_event_controller_key_get_im_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_key_get_im_context(@pointer)

      # Return value handling

      Gtk::IMContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the input method context of the key @controller.
    def im_context=(im_context : Gtk::IMContext?) : Nil
      # gtk_event_controller_key_set_im_context: (Method)
      # @im_context: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      im_context = if im_context.nil?
                     Pointer(Void).null
                   else
                     im_context.to_unsafe
                   end

      # C call
      LibGtk.gtk_event_controller_key_set_im_context(@pointer, im_context)

      # Return value handling
    end

    # Emitted whenever the input method context filters away
    # a keypress and prevents the @controller receiving it.
    #
    # See `Gtk::EventControllerKey#im_context=` and
    # `Gtk::IMContext#filter_keypress`.
    struct ImUpdateSignal < GObject::Signal
      def name : String
        @detail ? "im-update::#{@detail}" : "im-update"
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

      def connect(handler : Proc(Gtk::EventControllerKey, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerKey.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerKey, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "im-update")
      end
    end

    def im_update_signal
      ImUpdateSignal.new(self)
    end

    # Emitted whenever a key is pressed.
    struct KeyPressedSignal < GObject::Signal
      def name : String
        @detail ? "key-pressed::#{@detail}" : "key-pressed"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, UInt32, Gdk::ModifierType, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, UInt32, Gdk::ModifierType, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_keyval : UInt32, lib_keycode : UInt32, lib_state : UInt32, _lib_box : Pointer(Void)) {
          keyval = lib_keyval
          keycode = lib_keycode
          # Generator::BuiltInTypeArgPlan
          state = Gdk::ModifierType.new(lib_state)
          ::Box(Proc(UInt32, UInt32, Gdk::ModifierType, Bool)).unbox(_lib_box).call(keyval, keycode, state)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_keyval : UInt32, lib_keycode : UInt32, lib_state : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerKey.new(_lib_sender, GICrystal::Transfer::None)
          keyval = lib_keyval
          keycode = lib_keycode
          # Generator::BuiltInTypeArgPlan
          state = Gdk::ModifierType.new(lib_state)
          ::Box(Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Bool)).unbox(_lib_box).call(_sender, keyval, keycode, state)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "key-pressed", keyval, keycode, state)
      end
    end

    def key_pressed_signal
      KeyPressedSignal.new(self)
    end

    # Emitted whenever a key is released.
    struct KeyReleasedSignal < GObject::Signal
      def name : String
        @detail ? "key-released::#{@detail}" : "key-released"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, UInt32, Gdk::ModifierType, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, UInt32, Gdk::ModifierType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_keyval : UInt32, lib_keycode : UInt32, lib_state : UInt32, _lib_box : Pointer(Void)) {
          keyval = lib_keyval
          keycode = lib_keycode
          # Generator::BuiltInTypeArgPlan
          state = Gdk::ModifierType.new(lib_state)
          ::Box(Proc(UInt32, UInt32, Gdk::ModifierType, Nil)).unbox(_lib_box).call(keyval, keycode, state)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_keyval : UInt32, lib_keycode : UInt32, lib_state : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerKey.new(_lib_sender, GICrystal::Transfer::None)
          keyval = lib_keyval
          keycode = lib_keycode
          # Generator::BuiltInTypeArgPlan
          state = Gdk::ModifierType.new(lib_state)
          ::Box(Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Nil)).unbox(_lib_box).call(_sender, keyval, keycode, state)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "key-released", keyval, keycode, state)
      end
    end

    def key_released_signal
      KeyReleasedSignal.new(self)
    end

    # Emitted whenever the state of modifier keys and pointer buttons change.
    struct ModifiersSignal < GObject::Signal
      def name : String
        @detail ? "modifiers::#{@detail}" : "modifiers"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::ModifierType, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::ModifierType, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_keyval : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          keyval = Gdk::ModifierType.new(lib_keyval)
          ::Box(Proc(Gdk::ModifierType, Bool)).unbox(_lib_box).call(keyval)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::EventControllerKey, Gdk::ModifierType, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_keyval : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerKey.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          keyval = Gdk::ModifierType.new(lib_keyval)
          ::Box(Proc(Gtk::EventControllerKey, Gdk::ModifierType, Bool)).unbox(_lib_box).call(_sender, keyval)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(keyval : Gdk::ModifierType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "modifiers", keyval)
      end
    end

    def modifiers_signal
      ModifiersSignal.new(self)
    end
  end
end
