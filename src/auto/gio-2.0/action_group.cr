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

      LibGio.g_action_group_action_added(self, action_name)
    end

    def action_enabled_changed(action_name : ::String, enabled : Bool) : Nil
      # g_action_group_action_enabled_changed: (Method)
      # Returns: (transfer none)

      LibGio.g_action_group_action_enabled_changed(self, action_name, enabled)
    end

    def action_removed(action_name : ::String) : Nil
      # g_action_group_action_removed: (Method)
      # Returns: (transfer none)

      LibGio.g_action_group_action_removed(self, action_name)
    end

    def action_state_changed(action_name : ::String, state : _) : Nil
      # g_action_group_action_state_changed: (Method)
      # Returns: (transfer none)

      state = GLib::Variant.new(state) unless state.is_a?(GLib::Variant)

      LibGio.g_action_group_action_state_changed(self, action_name, state)
    end

    def activate_action(action_name : ::String, parameter : _?) : Nil
      # g_action_group_activate_action: (Method)
      # @parameter: (nullable)
      # Returns: (transfer none)

      parameter = if parameter.nil?
                    Pointer(Void).null
                  else
                    parameter.to_unsafe
                  end
      parameter = GLib::Variant.new(parameter) unless parameter.is_a?(GLib::Variant)

      LibGio.g_action_group_activate_action(self, action_name, parameter)
    end

    def change_action_state(action_name : ::String, value : _) : Nil
      # g_action_group_change_action_state: (Method)
      # Returns: (transfer none)

      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      LibGio.g_action_group_change_action_state(self, action_name, value)
    end

    def action_enabled(action_name : ::String) : Bool
      # g_action_group_get_action_enabled: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_action_group_get_action_enabled(self, action_name)
      GICrystal.to_bool(_retval)
    end

    def action_parameter_type(action_name : ::String) : GLib::VariantType?
      # g_action_group_get_action_parameter_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_action_group_get_action_parameter_type(self, action_name)
      GLib::VariantType.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def action_state(action_name : ::String) : GLib::Variant?
      # g_action_group_get_action_state: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_action_group_get_action_state(self, action_name)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def action_state_hint(action_name : ::String) : GLib::Variant?
      # g_action_group_get_action_state_hint: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_action_group_get_action_state_hint(self, action_name)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def action_state_type(action_name : ::String) : GLib::VariantType?
      # g_action_group_get_action_state_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_action_group_get_action_state_type(self, action_name)
      GLib::VariantType.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def has_action(action_name : ::String) : Bool
      # g_action_group_has_action: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_action_group_has_action(self, action_name)
      GICrystal.to_bool(_retval)
    end

    def list_actions : Enumerable(::String)
      # g_action_group_list_actions: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_action_group_list_actions(self)
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

      parameter_type = Pointer(Pointer(Void)).null
      state_type = Pointer(Pointer(Void)).null
      state_hint = Pointer(Pointer(Void)).null
      state = Pointer(Pointer(Void)).null

      _retval = LibGio.g_action_group_query_action(self, action_name, enabled, parameter_type, state_type, state_hint, state)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class ActionGroup__Impl
    include ActionGroup

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

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
