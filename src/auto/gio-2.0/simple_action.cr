require "../g_object-2.0/object"
require "./action"

module Gio
  # A #GSimpleAction is the obvious simple implementation of the #GAction
  # interface. This is the easiest way to create an action for purposes of
  # adding it to a #GSimpleActionGroup.
  #
  # See also #GtkAction.
  @[GObject::GeneratedWrapper]
  class SimpleAction < GObject::Object
    include Action

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(SimpleAction, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SimpleAction`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, enabled : Bool? = nil, name : ::String? = nil, parameter_type : GLib::VariantType? = nil, state : GLib::Variant? = nil, state_type : GLib::VariantType? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !enabled.nil?
        (_names.to_unsafe + _n).value = "enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enabled)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !parameter_type.nil?
        (_names.to_unsafe + _n).value = "parameter-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parameter_type)
        _n += 1
      end
      if !state.nil?
        (_names.to_unsafe + _n).value = "state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state)
        _n += 1
      end
      if !state_type.nil?
        (_names.to_unsafe + _n).value = "state-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SimpleAction.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_action_get_type
    end

    def enabled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enabled", unsafe_value, Pointer(Void).null)
      value
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

    def parameter_type=(value : GLib::VariantType?) : GLib::VariantType?
      unsafe_value = value

      LibGObject.g_object_set(self, "parameter-type", unsafe_value, Pointer(Void).null)
      value
    end

    def parameter_type : GLib::VariantType?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parameter-type", pointerof(value), Pointer(Void).null)
      GLib::VariantType.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def state=(value : GLib::Variant?) : GLib::Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "state", unsafe_value, Pointer(Void).null)
      value
    end

    def state : GLib::Variant?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "state", pointerof(value), Pointer(Void).null)
      GLib::Variant.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def state_type : GLib::VariantType?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "state-type", pointerof(value), Pointer(Void).null)
      GLib::VariantType.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new action.
    #
    # The created action is stateless. See g_simple_action_new_stateful() to create
    # an action that has state.
    def self.new(name : ::String, parameter_type : GLib::VariantType?) : self
      # g_simple_action_new: (Constructor)
      # @parameter_type: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      parameter_type = if parameter_type.nil?
                         Pointer(Void).null
                       else
                         parameter_type.to_unsafe
                       end

      # C call
      _retval = LibGio.g_simple_action_new(name, parameter_type)

      # Return value handling

      Gio::SimpleAction.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new stateful action.
    #
    # All future state values must have the same #GVariantType as the initial
    # @state.
    #
    # If the @state #GVariant is floating, it is consumed.
    def self.new_stateful(name : ::String, parameter_type : GLib::VariantType?, state : _) : self
      # g_simple_action_new_stateful: (Constructor)
      # @parameter_type: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      parameter_type = if parameter_type.nil?
                         Pointer(Void).null
                       else
                         parameter_type.to_unsafe
                       end
      # Generator::HandmadeArgPlan
      state = if !state.is_a?(GLib::Variant)
                GLib::Variant.new(state).to_unsafe
              else
                state.to_unsafe
              end

      # C call
      _retval = LibGio.g_simple_action_new_stateful(name, parameter_type, state)

      # Return value handling

      Gio::SimpleAction.new(_retval, GICrystal::Transfer::Full)
    end

    # Sets the action as enabled or not.
    #
    # An action must be enabled in order to be activated or in order to
    # have its state changed from outside callers.
    #
    # This should only be called by the implementor of the action.  Users
    # of the action should not attempt to modify its enabled flag.
    def enabled=(enabled : Bool) : Nil
      # g_simple_action_set_enabled: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_simple_action_set_enabled(@pointer, enabled)

      # Return value handling
    end

    # Sets the state of the action.
    #
    # This directly updates the 'state' property to the given value.
    #
    # This should only be called by the implementor of the action.  Users
    # of the action should not attempt to directly modify the 'state'
    # property.  Instead, they should call g_action_change_state() to
    # request the change.
    #
    # If the @value GVariant is floating, it is consumed.
    def state=(value : _) : Nil
      # g_simple_action_set_state: (Method | Setter)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_simple_action_set_state(@pointer, value)

      # Return value handling
    end

    # Sets the state hint for the action.
    #
    # See g_action_get_state_hint() for more information about
    # action state hints.
    def state_hint=(state_hint : _?) : Nil
      # g_simple_action_set_state_hint: (Method)
      # @state_hint: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      state_hint = if state_hint.nil?
                     Pointer(Void).null
                   elsif !state_hint.is_a?(GLib::Variant)
                     GLib::Variant.new(state_hint).to_unsafe
                   else
                     state_hint.to_unsafe
                   end

      # C call
      LibGio.g_simple_action_set_state_hint(@pointer, state_hint)

      # Return value handling
    end

    # Indicates that the action was just activated.
    #
    # @parameter will always be of the expected type, i.e. the parameter type
    # specified when the action was created. If an incorrect type is given when
    # activating the action, this signal is not emitted.
    #
    # Since GLib 2.40, if no handler is connected to this signal then the
    # default behaviour for boolean-stated actions with a %NULL parameter
    # type is to toggle them via the #GSimpleAction::change-state signal.
    # For stateful actions where the state type is equal to the parameter
    # type, the default is to forward them directly to
    # #GSimpleAction::change-state.  This should allow almost all users
    # of #GSimpleAction to connect only one handler or the other.
    struct ActivateSignal < GObject::Signal
      def name : String
        @detail ? "activate::#{@detail}" : "activate"
      end

      def connect(*, after : Bool = false, &block : Proc(GLib::Variant?, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(GLib::Variant?, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_parameter : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none) unless lib_parameter.null?
          ::Box(Proc(GLib::Variant?, Nil)).unbox(_lib_box).call(parameter)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::SimpleAction, GLib::Variant?, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_parameter : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SimpleAction.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none) unless lib_parameter.null?
          ::Box(Proc(Gio::SimpleAction, GLib::Variant?, Nil)).unbox(_lib_box).call(_sender, parameter)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(parameter : _?) : Nil
        # Generator::HandmadeArgPlan
        parameter = if parameter.nil?
                      Pointer(Void).null
                    elsif !parameter.is_a?(GLib::Variant)
                      GLib::Variant.new(parameter).to_unsafe
                    else
                      parameter.to_unsafe
                    end

        LibGObject.g_signal_emit_by_name(@source, "activate", parameter)
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    # Indicates that the action just received a request to change its
    # state.
    #
    # @value will always be of the correct state type, i.e. the type of the
    # initial state passed to g_simple_action_new_stateful(). If an incorrect
    # type is given when requesting to change the state, this signal is not
    # emitted.
    #
    # If no handler is connected to this signal then the default
    # behaviour is to call g_simple_action_set_state() to set the state
    # to the requested value. If you connect a signal handler then no
    # default action is taken. If the state should change then you must
    # call g_simple_action_set_state() from the handler.
    #
    # An example of a 'change-state' handler:
    # |[<!-- language="C" -->
    # static void
    # change_volume_state (GSimpleAction *action,
    #                      GVariant      *value,
    #                      gpointer       user_data)
    # {
    #   gint requested;
    #
    #   requested = g_variant_get_int32 (value);
    #
    #   // Volume only goes from 0 to 10
    #   if (0 <= requested && requested <= 10)
    #     g_simple_action_set_state (action, value);
    # }
    # ]|
    #
    # The handler need not set the state to the requested value.
    # It could set it to any value at all, or take some other action.
    struct ChangeStateSignal < GObject::Signal
      def name : String
        @detail ? "change-state::#{@detail}" : "change-state"
      end

      def connect(*, after : Bool = false, &block : Proc(GLib::Variant?, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(GLib::Variant?, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          value = GLib::Variant.new(lib_value, :none) unless lib_value.null?
          ::Box(Proc(GLib::Variant?, Nil)).unbox(_lib_box).call(value)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::SimpleAction, GLib::Variant?, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SimpleAction.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          value = GLib::Variant.new(lib_value, :none) unless lib_value.null?
          ::Box(Proc(Gio::SimpleAction, GLib::Variant?, Nil)).unbox(_lib_box).call(_sender, value)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(value : _?) : Nil
        # Generator::HandmadeArgPlan
        value = if value.nil?
                  Pointer(Void).null
                elsif !value.is_a?(GLib::Variant)
                  GLib::Variant.new(value).to_unsafe
                else
                  value.to_unsafe
                end

        LibGObject.g_signal_emit_by_name(@source, "change-state", value)
      end
    end

    def change_state_signal
      ChangeStateSignal.new(self)
    end
  end
end
