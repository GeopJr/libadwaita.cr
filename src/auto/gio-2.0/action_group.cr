module Gio
  # #GActionGroup represents a group of actions. Actions can be used to
  # expose functionality in a structured way, either from one part of a
  # program to another, or to the outside world. Action groups are often
  # used together with a #GMenuModel that provides additional
  # representation data for displaying the actions to the user, e.g. in
  # a menu.
  #
  # The main way to interact with the actions in a GActionGroup is to
  # activate them with g_action_group_activate_action(). Activating an
  # action may require a #GVariant parameter. The required type of the
  # parameter can be inquired with g_action_group_get_action_parameter_type().
  # Actions may be disabled, see g_action_group_get_action_enabled().
  # Activating a disabled action has no effect.
  #
  # Actions may optionally have a state in the form of a #GVariant. The
  # current state of an action can be inquired with
  # g_action_group_get_action_state(). Activating a stateful action may
  # change its state, but it is also possible to set the state by calling
  # g_action_group_change_action_state().
  #
  # As typical example, consider a text editing application which has an
  # option to change the current font to 'bold'. A good way to represent
  # this would be a stateful action, with a boolean state. Activating the
  # action would toggle the state.
  #
  # Each action in the group has a unique name (which is a string).  All
  # method calls, except g_action_group_list_actions() take the name of
  # an action as an argument.
  #
  # The #GActionGroup API is meant to be the 'public' API to the action
  # group.  The calls here are exactly the interaction that 'external
  # forces' (eg: UI, incoming D-Bus messages, etc.) are supposed to have
  # with actions.  'Internal' APIs (ie: ones meant only to be accessed by
  # the action group implementation) are found on subclasses.  This is
  # why you will find - for example - g_action_group_get_action_enabled()
  # but not an equivalent set() call.
  #
  # Signals are emitted on the action group in response to state changes
  # on individual actions.
  #
  # Implementations of #GActionGroup should provide implementations for
  # the virtual functions g_action_group_list_actions() and
  # g_action_group_query_action().  The other virtual functions should
  # not be implemented - their "wrappers" are actually implemented with
  # calls to g_action_group_query_action().
  module ActionGroup
    def action_added(action_name : ::String) : Nil
      # g_action_group_action_added: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_action_group_action_added(self, action_name)

      # Return value handling
    end

    def action_enabled_changed(action_name : ::String, enabled : Bool) : Nil
      # g_action_group_action_enabled_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_action_group_action_enabled_changed(self, action_name, enabled)

      # Return value handling
    end

    def action_removed(action_name : ::String) : Nil
      # g_action_group_action_removed: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_action_group_action_removed(self, action_name)

      # Return value handling
    end

    def action_state_changed(action_name : ::String, state : _) : Nil
      # g_action_group_action_state_changed: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      state = if !state.is_a?(GLib::Variant)
                GLib::Variant.new(state).to_unsafe
              else
                state.to_unsafe
              end

      # C call
      LibGio.g_action_group_action_state_changed(self, action_name, state)

      # Return value handling
    end

    def activate_action(action_name : ::String, parameter : _?) : Nil
      # g_action_group_activate_action: (Method)
      # @parameter: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      parameter = if parameter.nil?
                    Pointer(Void).null
                  elsif !parameter.is_a?(GLib::Variant)
                    GLib::Variant.new(parameter).to_unsafe
                  else
                    parameter.to_unsafe
                  end

      # C call
      LibGio.g_action_group_activate_action(self, action_name, parameter)

      # Return value handling
    end

    def change_action_state(action_name : ::String, value : _) : Nil
      # g_action_group_change_action_state: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_action_group_change_action_state(self, action_name, value)

      # Return value handling
    end

    def action_enabled(action_name : ::String) : Bool
      # g_action_group_get_action_enabled: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_action_group_get_action_enabled(self, action_name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def action_parameter_type(action_name : ::String) : GLib::VariantType?
      # g_action_group_get_action_parameter_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_action_group_get_action_parameter_type(self, action_name)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def action_state(action_name : ::String) : GLib::Variant?
      # g_action_group_get_action_state: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_action_group_get_action_state(self, action_name)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def action_state_hint(action_name : ::String) : GLib::Variant?
      # g_action_group_get_action_state_hint: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_action_group_get_action_state_hint(self, action_name)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def action_state_type(action_name : ::String) : GLib::VariantType?
      # g_action_group_get_action_state_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_action_group_get_action_state_type(self, action_name)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def has_action(action_name : ::String) : Bool
      # g_action_group_has_action: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_action_group_has_action(self, action_name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def list_actions : Enumerable(::String)
      # g_action_group_list_actions: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_action_group_list_actions(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def query_action(action_name : ::String, enabled : Bool) : Bool
      # g_action_group_query_action: (Method)
      # @enabled: (out) (transfer full)
      # @parameter_type: (out) (transfer full) (optional)
      # @state_type: (out) (transfer full) (optional)
      # @state_hint: (out) (transfer full) (optional)
      # @state: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      parameter_type = Pointer(Pointer(Void)).null
      # Generator::OutArgUsedInReturnPlan
      state_type = Pointer(Pointer(Void)).null
      # Generator::OutArgUsedInReturnPlan
      state_hint = Pointer(Pointer(Void)).null
      # Generator::OutArgUsedInReturnPlan
      state = Pointer(Pointer(Void)).null

      # C call
      _retval = LibGio.g_action_group_query_action(self, action_name, enabled, parameter_type, state_type, state_hint, state)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    struct ActionAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "action-added::#{@detail}" : "action-added"
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

      def connect(block : Proc(Gio::ActionGroup, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::ActionGroup, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::ActionGroup, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::ActionGroup, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(action_name : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "action-added", action_name)
      end
    end

    def action_added_signal
      ActionAddedSignal.new(self)
    end

    struct ActionEnabledChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "action-enabled-changed::#{@detail}" : "action-enabled-changed"
      end

      def connect(&block : Proc(::String, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(::String, Bool, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(::String, Bool, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::ActionGroup, ::String, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gio::ActionGroup, ::String, Bool, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::ActionGroup, ::String, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gio::ActionGroup, ::String, Bool, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(action_name : ::String, enabled : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "action-enabled-changed", action_name, enabled)
      end
    end

    def action_enabled_changed_signal
      ActionEnabledChangedSignal.new(self)
    end

    struct ActionRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "action-removed::#{@detail}" : "action-removed"
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

      def connect(block : Proc(Gio::ActionGroup, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::ActionGroup, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::ActionGroup, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::ActionGroup, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(action_name : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "action-removed", action_name)
      end
    end

    def action_removed_signal
      ActionRemovedSignal.new(self)
    end

    struct ActionStateChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "action-state-changed::#{@detail}" : "action-state-changed"
      end

      def connect(&block : Proc(::String, GLib::Variant, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, GLib::Variant, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(::String, GLib::Variant, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(::String, GLib::Variant, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::ActionGroup, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::ActionGroup, ::String, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::ActionGroup, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::ActionGroup__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::ActionGroup, ::String, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(action_name : ::String, value : _) : Nil
        value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "action-state-changed", action_name, value)
      end
    end

    def action_state_changed_signal
      ActionStateChangedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class ActionGroup__Impl < GObject::Object
    include ActionGroup

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_action_group_get_type
    end

    # Cast a `GObject::Object` to `ActionGroup`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ActionGroup")
    end

    # Cast a `GObject::Object` to `ActionGroup`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
