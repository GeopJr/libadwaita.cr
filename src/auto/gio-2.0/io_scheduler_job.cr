module Gio
  # Opaque class for defining and scheduling IO jobs.
  class IOSchedulerJob
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def send_to_mainloop(func : Pointer(Void), user_data : Pointer(Void)?, notify : Pointer(Void)?) : Bool
      # g_io_scheduler_job_send_to_mainloop: (Method)
      # @user_data: (nullable)
      # @notify: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      notify = if notify.nil?
                 LibGLib::DestroyNotify.null
               else
                 notify.to_unsafe
               end

      # C call
      _retval = LibGio.g_io_scheduler_job_send_to_mainloop(self, func, user_data, notify)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def send_to_mainloop_async(func : Pointer(Void), user_data : Pointer(Void)?, notify : Pointer(Void)?) : Nil
      # g_io_scheduler_job_send_to_mainloop_async: (Method)
      # @user_data: (nullable)
      # @notify: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      notify = if notify.nil?
                 LibGLib::DestroyNotify.null
               else
                 notify.to_unsafe
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
