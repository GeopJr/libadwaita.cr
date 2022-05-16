module Gio
  # The GRemoteActionGroup interface is implemented by #GActionGroup
  # instances that either transmit action invocations to other processes
  # or receive action invocations in the local process from other
  # processes.
  #
  # The interface has `_full` variants of the two
  # methods on #GActionGroup used to activate actions:
  # g_action_group_activate_action() and
  # g_action_group_change_action_state(). These variants allow a
  # "platform data" #GVariant to be specified: a dictionary providing
  # context for the action invocation (for example: timestamps, startup
  # notification IDs, etc).
  #
  # #GDBusActionGroup implements #GRemoteActionGroup.  This provides a
  # mechanism to send platform data for action invocations over D-Bus.
  #
  # Additionally, g_dbus_connection_export_action_group() will check if
  # the exported #GActionGroup implements #GRemoteActionGroup and use the
  # `_full` variants of the calls if available.  This
  # provides a mechanism by which to receive platform data for action
  # invocations that arrive by way of D-Bus.
  module RemoteActionGroup
    def activate_action_full(action_name : ::String, parameter : _?, platform_data : _) : Nil
      # g_remote_action_group_activate_action_full: (Method)
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
      # Generator::HandmadeArgPlan
      platform_data = if !platform_data.is_a?(GLib::Variant)
                        GLib::Variant.new(platform_data).to_unsafe
                      else
                        platform_data.to_unsafe
                      end

      # C call
      LibGio.g_remote_action_group_activate_action_full(@pointer, action_name, parameter, platform_data)

      # Return value handling
    end

    def change_action_state_full(action_name : ::String, value : _, platform_data : _) : Nil
      # g_remote_action_group_change_action_state_full: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end
      # Generator::HandmadeArgPlan
      platform_data = if !platform_data.is_a?(GLib::Variant)
                        GLib::Variant.new(platform_data).to_unsafe
                      else
                        platform_data.to_unsafe
                      end

      # C call
      LibGio.g_remote_action_group_change_action_state_full(@pointer, action_name, value, platform_data)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractRemoteActionGroup < GObject::Object
    include RemoteActionGroup

    GICrystal.define_new_method(Gio::AbstractRemoteActionGroup, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_remote_action_group_get_type
    end

    # Cast a `GObject::Object` to `RemoteActionGroup`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to RemoteActionGroup")
    end

    # Cast a `GObject::Object` to `RemoteActionGroup`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
