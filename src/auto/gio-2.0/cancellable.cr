require "../g_object-2.0/object"

module Gio
  # GCancellable is a thread-safe operation cancellation stack used
  # throughout GIO to allow for cancellation of synchronous and
  # asynchronous operations.
  class Cancellable < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_cancellable_get_type
    end

    def initialize
      # g_cancellable_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_cancellable_new

      # Return value handling
      @pointer = _retval
    end

    def self.current : Gio::Cancellable?
      # g_cancellable_get_current: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_cancellable_get_current

      # Return value handling
      Gio::Cancellable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def cancel : Nil
      # g_cancellable_cancel: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_cancellable_cancel(self)

      # Return value handling
    end

    def connect(callback : Pointer(Void), data : Pointer(Void)?, data_destroy_func : Pointer(Void)?) : UInt64
      # g_cancellable_connect: (Method)
      # @data: (nullable)
      # @data_destroy_func: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end
      data_destroy_func = if data_destroy_func.nil?
                            LibGLib::DestroyNotify.null
                          else
                            data_destroy_func.to_unsafe
                          end

      # C call
      _retval = LibGio.g_cancellable_connect(self, callback, data, data_destroy_func)

      # Return value handling
      _retval
    end

    def disconnect(handler_id : UInt64) : Nil
      # g_cancellable_disconnect: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_cancellable_disconnect(self, handler_id)

      # Return value handling
    end

    def fd : Int32
      # g_cancellable_get_fd: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_cancellable_get_fd(self)

      # Return value handling
      _retval
    end

    def is_cancelled : Bool
      # g_cancellable_is_cancelled: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_cancellable_is_cancelled(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def make_pollfd(pollfd : GLib::PollFD) : Bool
      # g_cancellable_make_pollfd: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_cancellable_make_pollfd(self, pollfd)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def pop_current : Nil
      # g_cancellable_pop_current: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_cancellable_pop_current(self)

      # Return value handling
    end

    def push_current : Nil
      # g_cancellable_push_current: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_cancellable_push_current(self)

      # Return value handling
    end

    def release_fd : Nil
      # g_cancellable_release_fd: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_cancellable_release_fd(self)

      # Return value handling
    end

    def reset : Nil
      # g_cancellable_reset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_cancellable_reset(self)

      # Return value handling
    end

    def set_error_if_cancelled : Bool
      # g_cancellable_set_error_if_cancelled: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_cancellable_set_error_if_cancelled(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def source_new : GLib::Source
      # g_cancellable_source_new: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_cancellable_source_new(self)

      # Return value handling
      GLib::Source.new(_retval, GICrystal::Transfer::Full)
    end

    struct CancelledSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cancelled::#{@detail}" : "cancelled"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Cancellable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Cancellable.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Cancellable, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Cancellable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Cancellable.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Cancellable, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancelled")
      end
    end

    def cancelled_signal
      CancelledSignal.new(self)
    end
  end
end
