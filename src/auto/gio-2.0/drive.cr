module Gio
  # #GDrive - this represent a piece of hardware connected to the machine.
  # It's generally only created for removable hardware or hardware with
  # removable media.
  #
  # #GDrive is a container class for #GVolume objects that stem from
  # the same piece of media. As such, #GDrive abstracts a drive with
  # (or without) removable media and provides operations for querying
  # whether media is available, determining whether media change is
  # automatically detected and ejecting the media.
  #
  # If the #GDrive reports that media isn't automatically detected, one
  # can poll for media; typically one should not do this periodically
  # as a poll for media operation is potentially expensive and may
  # spin up the drive creating noise.
  #
  # #GDrive supports starting and stopping drives with authentication
  # support for the former. This can be used to support a diverse set
  # of use cases including connecting/disconnecting iSCSI devices,
  # powering down external disk enclosures and starting/stopping
  # multi-disk devices such as RAID devices. Note that the actual
  # semantics and side-effects of starting/stopping a #GDrive may vary
  # according to implementation. To choose the correct verbs in e.g. a
  # file manager, use g_drive_get_start_stop_type().
  #
  # For porting from GnomeVFS note that there is no equivalent of
  # #GDrive in that API.
  module Drive
    def can_eject : Bool
      # g_drive_can_eject: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_can_eject(self)
      GICrystal.to_bool(_retval)
    end

    def can_poll_for_media : Bool
      # g_drive_can_poll_for_media: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_can_poll_for_media(self)
      GICrystal.to_bool(_retval)
    end

    def can_start : Bool
      # g_drive_can_start: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_can_start(self)
      GICrystal.to_bool(_retval)
    end

    def can_start_degraded : Bool
      # g_drive_can_start_degraded: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_can_start_degraded(self)
      GICrystal.to_bool(_retval)
    end

    def can_stop : Bool
      # g_drive_can_stop: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_can_stop(self)
      GICrystal.to_bool(_retval)
    end

    def eject(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_drive_eject: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_drive_eject(self, flags, cancellable, callback, user_data)
    end

    def eject_finish(result : Gio::AsyncResult) : Bool
      # g_drive_eject_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_eject_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def eject_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_drive_eject_with_operation: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_drive_eject_with_operation(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def eject_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_drive_eject_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_eject_with_operation_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def enumerate_identifiers : Enumerable(::String)
      # g_drive_enumerate_identifiers: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_drive_enumerate_identifiers(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def icon : Gio::Icon
      # g_drive_get_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_drive_get_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def identifier(kind : ::String) : ::String?
      # g_drive_get_identifier: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_drive_get_identifier(self, kind)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def name : ::String
      # g_drive_get_name: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_drive_get_name(self)
      GICrystal.transfer_full(_retval)
    end

    def sort_key : ::String?
      # g_drive_get_sort_key: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_get_sort_key(self)
      ::String.new(_retval) unless _retval.null?
    end

    def start_stop_type : Gio::DriveStartStopType
      # g_drive_get_start_stop_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_get_start_stop_type(self)
      Gio::DriveStartStopType.from_value(_retval)
    end

    def symbolic_icon : Gio::Icon
      # g_drive_get_symbolic_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_drive_get_symbolic_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def volumes : GLib::List
      # g_drive_get_volumes: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_drive_get_volumes(self)
      GLib::List(Gio::Volume).new(_retval, GICrystal::Transfer::Full)
    end

    def has_media : Bool
      # g_drive_has_media: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_has_media(self)
      GICrystal.to_bool(_retval)
    end

    def has_volumes : Bool
      # g_drive_has_volumes: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_has_volumes(self)
      GICrystal.to_bool(_retval)
    end

    def is_media_check_automatic : Bool
      # g_drive_is_media_check_automatic: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_is_media_check_automatic(self)
      GICrystal.to_bool(_retval)
    end

    def is_media_removable : Bool
      # g_drive_is_media_removable: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_is_media_removable(self)
      GICrystal.to_bool(_retval)
    end

    def is_removable : Bool
      # g_drive_is_removable: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_is_removable(self)
      GICrystal.to_bool(_retval)
    end

    def poll_for_media(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_drive_poll_for_media: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_drive_poll_for_media(self, cancellable, callback, user_data)
    end

    def poll_for_media_finish(result : Gio::AsyncResult) : Bool
      # g_drive_poll_for_media_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_poll_for_media_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def start(flags : Gio::DriveStartFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_drive_start: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_drive_start(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def start_finish(result : Gio::AsyncResult) : Bool
      # g_drive_start_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_start_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def stop(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_drive_stop: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_drive_stop(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def stop_finish(result : Gio::AsyncResult) : Bool
      # g_drive_stop_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_drive_stop_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Drive__Impl
    include Drive

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
      LibGio.g_drive_get_type
    end

    # Cast a `GObject::Object` to `Drive`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Drive")
    end

    # Cast a `GObject::Object` to `Drive`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
