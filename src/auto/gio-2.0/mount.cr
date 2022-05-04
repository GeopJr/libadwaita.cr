module Gio
  # The #GMount interface represents user-visible mounts. Note, when
  # porting from GnomeVFS, #GMount is the moral equivalent of #GnomeVFSVolume.
  #
  # #GMount is a "mounted" filesystem that you can access. Mounted is in
  # quotes because it's not the same as a unix mount, it might be a gvfs
  # mount, but you can still access the files on it if you use GIO. Might or
  # might not be related to a volume object.
  #
  # Unmounting a #GMount instance is an asynchronous operation. For
  # more information about asynchronous operations, see #GAsyncResult
  # and #GTask. To unmount a #GMount instance, first call
  # g_mount_unmount_with_operation() with (at least) the #GMount instance and a
  # #GAsyncReadyCallback.  The callback will be fired when the
  # operation has resolved (either with success or failure), and a
  # #GAsyncResult structure will be passed to the callback.  That
  # callback should then call g_mount_unmount_with_operation_finish() with the #GMount
  # and the #GAsyncResult data to see if the operation was completed
  # successfully.  If an @error is present when g_mount_unmount_with_operation_finish()
  # is called, then it will be filled with any error information.
  module Mount
    def can_eject : Bool
      # g_mount_can_eject: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_can_eject(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def can_unmount : Bool
      # g_mount_can_unmount: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_can_unmount(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def eject(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_mount_eject: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_mount_eject(self, flags, cancellable, callback, user_data)

      # Return value handling
    end

    def eject_finish(result : Gio::AsyncResult) : Bool
      # g_mount_eject_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_mount_eject_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def eject_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_mount_eject_with_operation: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_mount_eject_with_operation(self, flags, mount_operation, cancellable, callback, user_data)

      # Return value handling
    end

    def eject_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_mount_eject_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_mount_eject_with_operation_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def default_location : Gio::File
      # g_mount_get_default_location: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_default_location(self)

      # Return value handling

      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def drive : Gio::Drive?
      # g_mount_get_drive: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_drive(self)

      # Return value handling

      Gio::Drive__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def icon : Gio::Icon
      # g_mount_get_icon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_icon(self)

      # Return value handling

      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def name : ::String
      # g_mount_get_name: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_name(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def root : Gio::File
      # g_mount_get_root: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_root(self)

      # Return value handling

      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def sort_key : ::String?
      # g_mount_get_sort_key: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_get_sort_key(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def symbolic_icon : Gio::Icon
      # g_mount_get_symbolic_icon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_symbolic_icon(self)

      # Return value handling

      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def uuid : ::String?
      # g_mount_get_uuid: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_uuid(self)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def volume : Gio::Volume?
      # g_mount_get_volume: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_mount_get_volume(self)

      # Return value handling

      Gio::Volume__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def guess_content_type(force_rescan : Bool, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_mount_guess_content_type: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_mount_guess_content_type(self, force_rescan, cancellable, callback, user_data)

      # Return value handling
    end

    def guess_content_type_finish(result : Gio::AsyncResult) : Enumerable(::String)
      # g_mount_guess_content_type_finish: (Method | Throws)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_mount_guess_content_type_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def guess_content_type_sync(force_rescan : Bool, cancellable : Gio::Cancellable?) : Enumerable(::String)
      # g_mount_guess_content_type_sync: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_mount_guess_content_type_sync(self, force_rescan, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def is_shadowed : Bool
      # g_mount_is_shadowed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_is_shadowed(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def remount(flags : Gio::MountMountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_mount_remount: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_mount_remount(self, flags, mount_operation, cancellable, callback, user_data)

      # Return value handling
    end

    def remount_finish(result : Gio::AsyncResult) : Bool
      # g_mount_remount_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_mount_remount_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def shadow : Nil
      # g_mount_shadow: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_shadow(self)

      # Return value handling
    end

    def unmount(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_mount_unmount: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_mount_unmount(self, flags, cancellable, callback, user_data)

      # Return value handling
    end

    def unmount_finish(result : Gio::AsyncResult) : Bool
      # g_mount_unmount_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_mount_unmount_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unmount_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_mount_unmount_with_operation: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_mount_unmount_with_operation(self, flags, mount_operation, cancellable, callback, user_data)

      # Return value handling
    end

    def unmount_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_mount_unmount_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_mount_unmount_with_operation_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unshadow : Nil
      # g_mount_unshadow: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_unshadow(self)

      # Return value handling
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Mount, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Mount__Impl.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Mount, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Mount__Impl.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    struct PreUnmountSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "pre-unmount::#{@detail}" : "pre-unmount"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Mount, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Mount__Impl.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Mount, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Mount__Impl.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "pre-unmount")
      end
    end

    def pre_unmount_signal
      PreUnmountSignal.new(self)
    end

    struct UnmountedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unmounted::#{@detail}" : "unmounted"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Mount, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Mount__Impl.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Mount, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Mount__Impl.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "unmounted")
      end
    end

    def unmounted_signal
      UnmountedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class Mount__Impl < GObject::Object
    include Mount

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_mount_get_type
    end

    # Cast a `GObject::Object` to `Mount`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Mount")
    end

    # Cast a `GObject::Object` to `Mount`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
