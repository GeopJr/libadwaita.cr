require "../g_object-2.0/object"
require "./action"

module Gio
  # A #GSimpleAction is the obvious simple implementation of the #GAction
  # interface. This is the easiest way to create an action for purposes of
  # adding it to a #GSimpleActionGroup.
  #
  # See also #GtkAction.
  class SimpleAction < GObject::Object
    include Action

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, enabled : Bool? = nil, name : ::String? = nil, parameter_type : GLib::VariantType? = nil, state : GLib::Variant? = nil, state_type : GLib::VariantType? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if enabled
        (_names.to_unsafe + _n).value = "enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enabled)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if parameter_type
        (_names.to_unsafe + _n).value = "parameter-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parameter_type)
        _n += 1
      end
      if state
        (_names.to_unsafe + _n).value = "state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state)
        _n += 1
      end
      if state_type
        (_names.to_unsafe + _n).value = "state-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SimpleAction.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_action_get_type
    end

    def enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def parameter_type=(value : VariantType?) : VariantType?
      unsafe_value = value

      LibGObject.g_object_set(self, "parameter-type", unsafe_value, Pointer(Void).null)
      value
    end

    def parameter_type : VariantType?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parameter-type", pointerof(value), Pointer(Void).null)
      GLib::VariantType.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def state : Variant?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "state", pointerof(value), Pointer(Void).null)
      GLib::Variant.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def state_type : VariantType?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "state-type", pointerof(value), Pointer(Void).null)
      GLib::VariantType.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(name : ::String, parameter_type : GLib::VariantType?)
      # g_simple_action_new: (Constructor)
      # @parameter_type: (nullable)
      # Returns: (transfer full)

      parameter_type = if parameter_type.nil?
                         Pointer(Void).null
                       else
                         parameter_type.to_unsafe
                       end

      _retval = LibGio.g_simple_action_new(name, parameter_type)
      @pointer = _retval
    end

    def self.new_stateful(name : ::String, parameter_type : GLib::VariantType?, state : _) : Gio::SimpleAction
      # g_simple_action_new_stateful: (Constructor)
      # @parameter_type: (nullable)
      # Returns: (transfer full)

      parameter_type = if parameter_type.nil?
                         Pointer(Void).null
                       else
                         parameter_type.to_unsafe
                       end
      state = GLib::Variant.new(state) unless state.is_a?(GLib::Variant)

      _retval = LibGio.g_simple_action_new_stateful(name, parameter_type, state)
      Gio::SimpleAction.new(_retval, GICrystal::Transfer::Full)
    end

    def enabled=(enabled : Bool) : Nil
      # g_simple_action_set_enabled: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_simple_action_set_enabled(self, enabled)
    end

    def state=(value : _) : Nil
      # g_simple_action_set_state: (Method | Setter)
      # Returns: (transfer none)

      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      LibGio.g_simple_action_set_state(self, value)
    end

    def state_hint=(state_hint : _?) : Nil
      # g_simple_action_set_state_hint: (Method)
      # @state_hint: (nullable)
      # Returns: (transfer none)

      state_hint = if state_hint.nil?
                     Pointer(Void).null
                   else
                     state_hint.to_unsafe
                   end
      state_hint = GLib::Variant.new(state_hint) unless state_hint.is_a?(GLib::Variant)

      LibGio.g_simple_action_set_state_hint(self, state_hint)
    end

    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
      end

      def connect(&block : Proc(GLib::Variant, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(GLib::Variant, Nil))
        connect(block)
      end

      def connect(block : Proc(GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GLib::Variant, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GLib::Variant, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::SimpleAction, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SimpleAction.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SimpleAction, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SimpleAction.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(parameter : _) : Nil
        parameter = GLib::Variant.new(parameter) unless parameter.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "activate", parameter)
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    struct ChangeStateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "change-state::#{@detail}" : "change-state"
      end

      def connect(&block : Proc(GLib::Variant, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(GLib::Variant, Nil))
        connect(block)
      end

      def connect(block : Proc(GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GLib::Variant, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GLib::Variant, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::SimpleAction, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SimpleAction.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SimpleAction, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SimpleAction.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(value : _) : Nil
        value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "change-state", value)
      end
    end

    def change_state_signal
      ChangeStateSignal.new(self)
    end
  end
end
