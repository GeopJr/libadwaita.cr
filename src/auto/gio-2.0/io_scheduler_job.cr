module Gio
  # Opaque class for defining and scheduling IO jobs.
  class IOSchedulerJob
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::IOSchedulerJob)).zero?
    end

    def send_to_mainloop(func : GLib::SourceFunc) : Bool
      # g_io_scheduler_job_send_to_mainloop: (Method)
      # @user_data: (nullable)
      # @notify: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_user_data : Pointer(Void)) {
          user_data = lib_user_data
          ::Box(Proc(Bool)).unbox(user_data).call
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        notify = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = user_data = notify = Pointer(Void).null
      end

      # C call
      _retval = LibGio.g_io_scheduler_job_send_to_mainloop(self, func, user_data, notify)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def send_to_mainloop_async(func : GLib::SourceFunc) : Nil
      # g_io_scheduler_job_send_to_mainloop_async: (Method)
      # @user_data: (nullable)
      # @notify: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_user_data : Pointer(Void)) {
          user_data = lib_user_data
          ::Box(Proc(Bool)).unbox(user_data).call
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        notify = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = user_data = notify = Pointer(Void).null
      end

      # C call
      LibGio.g_io_scheduler_job_send_to_mainloop_async(self, func, user_data, notify)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
