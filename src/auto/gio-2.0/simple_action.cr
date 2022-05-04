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

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::SimpleAction), instance_init, 0)
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
    def initialize(name : ::String, parameter_type : GLib::VariantType?)
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

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      LibGio.g_simple_action_set_enabled(self, enabled)

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
      LibGio.g_simple_action_set_state(self, value)

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
      LibGio.g_simple_action_set_state_hint(self, state_hint)

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

      def connect(&block : Proc(GLib::Variant?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(GLib::Variant?, Nil))
        connect(block)
      end

      def connect(handler : Proc(GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_parameter : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          # Generator::GObjectArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          ::Box(Proc(GLib::Variant?, Nil)).unbox(_lib_box).call(parameter)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_parameter : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          # Generator::GObjectArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          ::Box(Proc(GLib::Variant?, Nil)).unbox(_lib_box).call(parameter)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::SimpleAction, GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_parameter : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SimpleAction.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          # Generator::GObjectArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant?, Nil)).unbox(_lib_box).call(_sender, parameter)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SimpleAction, GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_parameter : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SimpleAction.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          # Generator::GObjectArgPlan
          parameter = GLib::Variant.new(lib_parameter, :none)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant?, Nil)).unbox(_lib_box).call(_sender, parameter)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(parameter : _?) : Nil
        parameter = GLib::Variant.new(parameter) unless parameter.is_a?(GLib::Variant)
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

      def connect(&block : Proc(GLib::Variant?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(GLib::Variant?, Nil))
        connect(block)
      end

      def connect(handler : Proc(GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          value = GLib::Variant.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GLib::Variant.new(lib_value, :none)
          ::Box(Proc(GLib::Variant?, Nil)).unbox(_lib_box).call(value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          value = GLib::Variant.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GLib::Variant.new(lib_value, :none)
          ::Box(Proc(GLib::Variant?, Nil)).unbox(_lib_box).call(value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::SimpleAction, GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SimpleAction.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          value = GLib::Variant.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GLib::Variant.new(lib_value, :none)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant?, Nil)).unbox(_lib_box).call(_sender, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SimpleAction, GLib::Variant?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SimpleAction.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          value = GLib::Variant.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GLib::Variant.new(lib_value, :none)
          ::Box(Proc(Gio::SimpleAction, GLib::Variant?, Nil)).unbox(_lib_box).call(_sender, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(value : _?) : Nil
        value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "change-state", value)
      end
    end

    def change_state_signal
      ChangeStateSignal.new(self)
    end
  end
end
