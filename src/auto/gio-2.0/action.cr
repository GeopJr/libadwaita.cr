module Gio
  # #GAction represents a single named action.
  #
  # The main interface to an action is that it can be activated with
  # g_action_activate().  This results in the 'activate' signal being
  # emitted.  An activation has a #GVariant parameter (which may be
  # %NULL).  The correct type for the parameter is determined by a static
  # parameter type (which is given at construction time).
  #
  # An action may optionally have a state, in which case the state may be
  # set with g_action_change_state().  This call takes a #GVariant.  The
  # correct type for the state is determined by a static state type
  # (which is given at construction time).
  #
  # The state may have a hint associated with it, specifying its valid
  # range.
  #
  # #GAction is merely the interface to the concept of an action, as
  # described above.  Various implementations of actions exist, including
  # #GSimpleAction.
  #
  # In all cases, the implementing class is responsible for storing the
  # name of the action, the parameter type, the enabled state, the
  # optional state type and the state and emitting the appropriate
  # signals when these change.  The implementor is responsible for filtering
  # calls to g_action_activate() and g_action_change_state() for type
  # safety and for the state being enabled.
  #
  # Probably the only useful thing to do with a #GAction is to put it
  # inside of a #GSimpleActionGroup.
  module Action
    def enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def parameter_type : GLib::VariantType?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parameter-type", pointerof(value), Pointer(Void).null)
      GLib::VariantType.new(value, GICrystal::Transfer::None) unless value.null?
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

    def self.name_is_valid(action_name : ::String) : Bool
      # g_action_name_is_valid: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_action_name_is_valid(action_name)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def parse_detailed_name(detailed_name : ::String, action_name : ::String, target_value : _) : Bool
      # g_action_parse_detailed_name: (Throws)
      # @action_name: (out) (transfer full)
      # @target_value: (out) (transfer full)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      target_value = GLib::Variant.new(target_value) unless target_value.is_a?(GLib::Variant)
      LibGObject.g_object_ref(target_value)

      # C call
      _retval = LibGio.g_action_parse_detailed_name(detailed_name, action_name, target_value, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def self.print_detailed_name(action_name : ::String, target_value : _?) : ::String
      # g_action_print_detailed_name: (None)
      # @target_value: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      target_value = if target_value.nil?
                       Pointer(Void).null
                     else
                       target_value.to_unsafe
                     end
      target_value = GLib::Variant.new(target_value) unless target_value.is_a?(GLib::Variant)

      # C call
      _retval = LibGio.g_action_print_detailed_name(action_name, target_value)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def activate(parameter : _?) : Nil
      # g_action_activate: (Method)
      # @parameter: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      parameter = if parameter.nil?
                    Pointer(Void).null
                  else
                    parameter.to_unsafe
                  end
      parameter = GLib::Variant.new(parameter) unless parameter.is_a?(GLib::Variant)

      # C call
      LibGio.g_action_activate(self, parameter)

      # Return value handling
    end

    def change_state(value : _) : Nil
      # g_action_change_state: (Method)
      # Returns: (transfer none)

      # Handle parameters
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      # C call
      LibGio.g_action_change_state(self, value)

      # Return value handling
    end

    def enabled : Bool
      # g_action_get_enabled: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_action_get_enabled(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def name : ::String
      # g_action_get_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_action_get_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def parameter_type : GLib::VariantType?
      # g_action_get_parameter_type: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_action_get_parameter_type(self)

      # Return value handling
      GLib::VariantType.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def state : GLib::Variant?
      # g_action_get_state: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_action_get_state(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def state_hint : GLib::Variant?
      # g_action_get_state_hint: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_action_get_state_hint(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def state_type : GLib::VariantType?
      # g_action_get_state_type: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_action_get_state_type(self)

      # Return value handling
      GLib::VariantType.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Action__Impl < GObject::Object
    include Action

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_action_get_type
    end

    # Cast a `GObject::Object` to `Action`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Action")
    end

    # Cast a `GObject::Object` to `Action`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
