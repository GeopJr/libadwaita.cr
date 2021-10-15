module Gio
  # The #GVolume interface represents user-visible objects that can be
  # mounted. Note, when porting from GnomeVFS, #GVolume is the moral
  # equivalent of #GnomeVFSDrive.
  #
  # Mounting a #GVolume instance is an asynchronous operation. For more
  # information about asynchronous operations, see #GAsyncResult and
  # #GTask. To mount a #GVolume, first call g_volume_mount() with (at
  # least) the #GVolume instance, optionally a #GMountOperation object
  # and a #GAsyncReadyCallback.
  #
  # Typically, one will only want to pass %NULL for the
  # #GMountOperation if automounting all volumes when a desktop session
  # starts since it's not desirable to put up a lot of dialogs asking
  # for credentials.
  #
  # The callback will be fired when the operation has resolved (either
  # with success or failure), and a #GAsyncResult instance will be
  # passed to the callback.  That callback should then call
  # g_volume_mount_finish() with the #GVolume instance and the
  # #GAsyncResult data to see if the operation was completed
  # successfully.  If an @error is present when g_volume_mount_finish()
  # is called, then it will be filled with any error information.
  #
  # ## Volume Identifiers # {#volume-identifier}
  #
  # It is sometimes necessary to directly access the underlying
  # operating system object behind a volume (e.g. for passing a volume
  # to an application via the commandline). For this purpose, GIO
  # allows to obtain an 'identifier' for the volume. There can be
  # different kinds of identifiers, such as Hal UDIs, filesystem labels,
  # traditional Unix devices (e.g. `/dev/sda2`), UUIDs. GIO uses predefined
  # strings as names for the different kinds of identifiers:
  # #G_VOLUME_IDENTIFIER_KIND_UUID, #G_VOLUME_IDENTIFIER_KIND_LABEL, etc.
  # Use g_volume_get_identifier() to obtain an identifier for a volume.
  #
  #
  # Note that #G_VOLUME_IDENTIFIER_KIND_HAL_UDI will only be available
  # when the gvfs hal volume monitor is in use. Other volume monitors
  # will generally be able to provide the #G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE
  # identifier, which can be used to obtain a hal device by means of
  # libhal_manager_find_device_string_match().
  module Volume
    def can_eject : Bool
      # g_volume_can_eject: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_volume_can_eject(self)
      GICrystal.to_bool(_retval)
    end

    def can_mount : Bool
      # g_volume_can_mount: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_volume_can_mount(self)
      GICrystal.to_bool(_retval)
    end

    def eject(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_volume_eject: (Method)
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

      LibGio.g_volume_eject(self, flags, cancellable, callback, user_data)
    end

    def eject_finish(result : Gio::AsyncResult) : Bool
      # g_volume_eject_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_volume_eject_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def eject_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_volume_eject_with_operation: (Method)
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

      LibGio.g_volume_eject_with_operation(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def eject_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_volume_eject_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_volume_eject_with_operation_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def enumerate_identifiers : Enumerable(::String)
      # g_volume_enumerate_identifiers: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_enumerate_identifiers(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def activation_root : Gio::File?
      # g_volume_get_activation_root: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_activation_root(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def drive : Gio::Drive?
      # g_volume_get_drive: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_drive(self)
      Gio::Drive__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def icon : Gio::Icon
      # g_volume_get_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def identifier(kind : ::String) : ::String?
      # g_volume_get_identifier: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_identifier(self, kind)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def mount : Gio::Mount?
      # g_volume_get_mount: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_mount(self)
      Gio::Mount__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def name : ::String
      # g_volume_get_name: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_name(self)
      GICrystal.transfer_full(_retval)
    end

    def sort_key : ::String?
      # g_volume_get_sort_key: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_volume_get_sort_key(self)
      ::String.new(_retval) unless _retval.null?
    end

    def symbolic_icon : Gio::Icon
      # g_volume_get_symbolic_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_symbolic_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def uuid : ::String?
      # g_volume_get_uuid: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_get_uuid(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def mount(flags : Gio::MountMountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_volume_mount: (Method)
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

      LibGio.g_volume_mount(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def mount_finish(result : Gio::AsyncResult) : Bool
      # g_volume_mount_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_volume_mount_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def should_automount : Bool
      # g_volume_should_automount: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_volume_should_automount(self)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Volume__Impl
    include Volume

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
      LibGio.g_volume_get_type
    end

    # Cast a `GObject::Object` to `Volume`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Volume")
    end

    # Cast a `GObject::Object` to `Volume`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
