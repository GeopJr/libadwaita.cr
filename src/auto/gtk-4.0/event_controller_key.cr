require "./event_controller"

module Gtk
  # `GtkEventControllerKey` is an event controller that provides access
  # to key events.
  class EventControllerKey < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if propagation_limit
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if propagation_phase
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EventControllerKey.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_key_get_type
    end

    def initialize
      # gtk_event_controller_key_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_event_controller_key_new
      @pointer = _retval
    end

    def forward(widget : Gtk::Widget) : Bool
      # gtk_event_controller_key_forward: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_key_forward(self, widget)
      GICrystal.to_bool(_retval)
    end

    def group : UInt32
      # gtk_event_controller_key_get_group: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_key_get_group(self)
      _retval
    end

    def im_context : Gtk::IMContext
      # gtk_event_controller_key_get_im_context: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_event_controller_key_get_im_context(self)
      Gtk::IMContext.new(_retval, GICrystal::Transfer::None)
    end

    def im_context=(im_context : Gtk::IMContext) : Nil
      # gtk_event_controller_key_set_im_context: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_event_controller_key_set_im_context(self, im_context)
    end

    struct ImUpdateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "im-update::#{@detail}" : "im-update"
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

      def connect(block : Proc(Gtk::EventControllerKey, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerKey, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerKey, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerKey, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "im-update")
      end
    end

    def im_update_signal
      ImUpdateSignal.new(self)
    end

    struct KeyPressedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "key-pressed::#{@detail}" : "key-pressed"
      end

      def connect(&block : Proc(UInt32, UInt32, Gdk::ModifierType, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, UInt32, Gdk::ModifierType, Bool))
        connect(block)
      end

      def connect(block : Proc(UInt32, UInt32, Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(UInt32, UInt32, Gdk::ModifierType, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, UInt32, Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(UInt32, UInt32, Gdk::ModifierType, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "key-pressed", keyval, keycode, state)
      end
    end

    def key_pressed_signal
      KeyPressedSignal.new(self)
    end

    struct KeyReleasedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "key-released::#{@detail}" : "key-released"
      end

      def connect(&block : Proc(UInt32, UInt32, Gdk::ModifierType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, UInt32, Gdk::ModifierType, Nil))
        connect(block)
      end

      def connect(block : Proc(UInt32, UInt32, Gdk::ModifierType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(UInt32, UInt32, Gdk::ModifierType, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, UInt32, Gdk::ModifierType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(UInt32, UInt32, Gdk::ModifierType, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          ::Box(Proc(Gtk::EventControllerKey, UInt32, UInt32, Gdk::ModifierType, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "key-released", keyval, keycode, state)
      end
    end

    def key_released_signal
      KeyReleasedSignal.new(self)
    end

    struct ModifiersSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "modifiers::#{@detail}" : "modifiers"
      end

      def connect(&block : Proc(Gdk::ModifierType, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::ModifierType, Bool))
        connect(block)
      end

      def connect(block : Proc(Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::ModifierType.from_value(lib_arg0)
          ::Box(Proc(Gdk::ModifierType, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::ModifierType.from_value(lib_arg0)
          ::Box(Proc(Gdk::ModifierType, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EventControllerKey, Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::ModifierType.from_value(lib_arg0)
          ::Box(Proc(Gtk::EventControllerKey, Gdk::ModifierType, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerKey, Gdk::ModifierType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::EventControllerKey.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::ModifierType.from_value(lib_arg0)
          ::Box(Proc(Gtk::EventControllerKey, Gdk::ModifierType, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
