module Gdk
  # `GdkDevicePad` is an interface implemented by devices of type
  # %GDK_SOURCE_TABLET_PAD
  #
  # It allows querying the features provided by the pad device.
  #
  # Tablet pads may contain one or more groups, each containing a subset
  # of the buttons/rings/strips available. [method@Gdk.DevicePad.get_n_groups]
  # can be used to obtain the number of groups, [method@Gdk.DevicePad.get_n_features]
  # and [method@Gdk.DevicePad.get_feature_group] can be combined to find out
  # the number of buttons/rings/strips the device has, and how are they grouped.
  #
  # Each of those groups have different modes, which may be used to map each
  # individual pad feature to multiple actions. Only one mode is effective
  # (current) for each given group, different groups may have different
  # current modes. The number of available modes in a group can be found
  # out through [method@Gdk.DevicePad.get_group_n_modes], and the current mode
  # for a given group will be notified through events of type `GDK_PAD_GROUP_MODE`.
  module DevicePad
    def feature_group(feature : Gdk::DevicePadFeature, feature_idx : Int32) : Int32
      # gdk_device_pad_get_feature_group: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_device_pad_get_feature_group(self, feature, feature_idx)

      # Return value handling
      _retval
    end

    def group_n_modes(group_idx : Int32) : Int32
      # gdk_device_pad_get_group_n_modes: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_device_pad_get_group_n_modes(self, group_idx)

      # Return value handling
      _retval
    end

    def n_features(feature : Gdk::DevicePadFeature) : Int32
      # gdk_device_pad_get_n_features: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_device_pad_get_n_features(self, feature)

      # Return value handling
      _retval
    end

    def n_groups : Int32
      # gdk_device_pad_get_n_groups: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_device_pad_get_n_groups(self)

      # Return value handling
      _retval
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DevicePad__Impl < GObject::Object
    include DevicePad

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_device_pad_get_type
    end

    # Cast a `GObject::Object` to `DevicePad`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DevicePad")
    end

    # Cast a `GObject::Object` to `DevicePad`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
