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

      # C call
      _retval = LibGio.g_drive_can_eject(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def can_poll_for_media : Bool
      # g_drive_can_poll_for_media: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_can_poll_for_media(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def can_start : Bool
      # g_drive_can_start: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_can_start(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def can_start_degraded : Bool
      # g_drive_can_start_degraded: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_can_start_degraded(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def can_stop : Bool
      # g_drive_can_stop: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_can_stop(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def eject(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_drive_eject: (Method)
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
      LibGio.g_drive_eject(@pointer, flags, cancellable, callback, user_data)

      # Return value handling
    end

    def eject_finish(result : Gio::AsyncResult) : Bool
      # g_drive_eject_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_drive_eject_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def eject_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_drive_eject_with_operation: (Method)
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
      LibGio.g_drive_eject_with_operation(@pointer, flags, mount_operation, cancellable, callback, user_data)

      # Return value handling
    end

    def eject_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_drive_eject_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_drive_eject_with_operation_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def enumerate_identifiers : Enumerable(::String)
      # g_drive_enumerate_identifiers: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_drive_enumerate_identifiers(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def icon : Gio::Icon
      # g_drive_get_icon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_drive_get_icon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full)
    end

    def identifier(kind : ::String) : ::String?
      # g_drive_get_identifier: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_drive_get_identifier(@pointer, kind)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def name : ::String
      # g_drive_get_name: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_drive_get_name(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def sort_key : ::String?
      # g_drive_get_sort_key: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_get_sort_key(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def start_stop_type : Gio::DriveStartStopType
      # g_drive_get_start_stop_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_get_start_stop_type(@pointer)

      # Return value handling

      Gio::DriveStartStopType.new(_retval)
    end

    def symbolic_icon : Gio::Icon
      # g_drive_get_symbolic_icon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_drive_get_symbolic_icon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full)
    end

    def volumes : GLib::List
      # g_drive_get_volumes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_drive_get_volumes(@pointer)

      # Return value handling

      GLib::List(Gio::Volume).new(_retval, GICrystal::Transfer::Full)
    end

    def has_media : Bool
      # g_drive_has_media: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_has_media(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def has_volumes : Bool
      # g_drive_has_volumes: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_has_volumes(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_media_check_automatic : Bool
      # g_drive_is_media_check_automatic: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_is_media_check_automatic(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_media_removable : Bool
      # g_drive_is_media_removable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_is_media_removable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_removable : Bool
      # g_drive_is_removable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_drive_is_removable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def poll_for_media(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_drive_poll_for_media: (Method)
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
      LibGio.g_drive_poll_for_media(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    def poll_for_media_finish(result : Gio::AsyncResult) : Bool
      # g_drive_poll_for_media_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_drive_poll_for_media_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def start(flags : Gio::DriveStartFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_drive_start: (Method)
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
      LibGio.g_drive_start(@pointer, flags, mount_operation, cancellable, callback, user_data)

      # Return value handling
    end

    def start_finish(result : Gio::AsyncResult) : Bool
      # g_drive_start_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_drive_start_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def stop(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_drive_stop: (Method)
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
      LibGio.g_drive_stop(@pointer, flags, mount_operation, cancellable, callback, user_data)

      # Return value handling
    end

    def stop_finish(result : Gio::AsyncResult) : Bool
      # g_drive_stop_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_drive_stop_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
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

      def connect(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
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

    struct DisconnectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "disconnected::#{@detail}" : "disconnected"
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

      def connect(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "disconnected")
      end
    end

    def disconnected_signal
      DisconnectedSignal.new(self)
    end

    struct EjectButtonSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "eject-button::#{@detail}" : "eject-button"
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

      def connect(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "eject-button")
      end
    end

    def eject_button_signal
      EjectButtonSignal.new(self)
    end

    struct StopButtonSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "stop-button::#{@detail}" : "stop-button"
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

      def connect(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Drive, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDrive.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "stop-button")
      end
    end

    def stop_button_signal
      StopButtonSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractDrive < GObject::Object
    include Drive

    GICrystal.define_new_method(Gio::AbstractDrive, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
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
