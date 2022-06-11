module GLib
  # The `GMainContext` struct is an opaque data
  # type representing a set of sources to be handled in a main loop.
  class MainContext
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(MainContext.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(MainContext.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::MainContext)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_main_context_get_type
    end

    def self.new_with_flags(flags : GLib::MainContextFlags) : self
      # g_main_context_new_with_flags: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_main_context_new_with_flags(flags)

      # Return value handling

      GLib::MainContext.new(_retval, GICrystal::Transfer::Full)
    end

    def acquire : Bool
      # g_main_context_acquire: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_acquire(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def check(max_priority : Int32, fds : Enumerable(GLib::PollFD)) : Bool
      # g_main_context_check: (Method)
      # @fds: (array length=n_fds element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_fds = fds.size # Generator::ArrayArgPlan
      fds = fds.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGLib.g_main_context_check(@pointer, max_priority, fds, n_fds)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def dispatch : Nil
      # g_main_context_dispatch: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_context_dispatch(@pointer)

      # Return value handling
    end

    def find_source_by_funcs_user_data(funcs : GLib::SourceFuncs, user_data : Pointer(Void)?) : GLib::Source
      # g_main_context_find_source_by_funcs_user_data: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGLib.g_main_context_find_source_by_funcs_user_data(@pointer, funcs, user_data)

      # Return value handling

      GLib::Source.new(_retval, GICrystal::Transfer::None)
    end

    def find_source_by_id(source_id : UInt32) : GLib::Source
      # g_main_context_find_source_by_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_find_source_by_id(@pointer, source_id)

      # Return value handling

      GLib::Source.new(_retval, GICrystal::Transfer::None)
    end

    def find_source_by_user_data(user_data : Pointer(Void)?) : GLib::Source
      # g_main_context_find_source_by_user_data: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGLib.g_main_context_find_source_by_user_data(@pointer, user_data)

      # Return value handling

      GLib::Source.new(_retval, GICrystal::Transfer::None)
    end

    def invoke_full(priority : Int32, function : GLib::SourceFunc) : Nil
      # g_main_context_invoke_full: (Method)
      # @data: (nullable)
      # @notify: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if function
        _box = ::Box.box(function)
        function = ->(lib_user_data : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(lib_user_data).call
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        notify = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        function = data = notify = Pointer(Void).null
      end

      # C call
      LibGLib.g_main_context_invoke_full(@pointer, priority, function, data, notify)

      # Return value handling
    end

    def is_owner : Bool
      # g_main_context_is_owner: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_is_owner(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def iteration(may_block : Bool) : Bool
      # g_main_context_iteration: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_iteration(@pointer, may_block)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def pending : Bool
      # g_main_context_pending: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_pending(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def pop_thread_default : Nil
      # g_main_context_pop_thread_default: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_context_pop_thread_default(@pointer)

      # Return value handling
    end

    def prepare : Bool
      # g_main_context_prepare: (Method)
      # @priority: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      priority = Pointer(Int32).null
      # C call
      _retval = LibGLib.g_main_context_prepare(@pointer, priority)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def push_thread_default : Nil
      # g_main_context_push_thread_default: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_context_push_thread_default(@pointer)

      # Return value handling
    end

    def query(max_priority : Int32, timeout_ : Int32, fds : Enumerable(GLib::PollFD)) : Int32
      # g_main_context_query: (Method)
      # @timeout_: (out) (transfer full)
      # @fds: (out) (caller-allocates) (array length=n_fds element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_fds = fds.size # Generator::ArrayArgPlan
      fds = fds.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGLib.g_main_context_query(@pointer, max_priority, timeout_, fds, n_fds)

      # Return value handling

      _retval
    end

    def ref : GLib::MainContext
      # g_main_context_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_main_context_ref(@pointer)

      # Return value handling

      GLib::MainContext.new(_retval, GICrystal::Transfer::Full)
    end

    def release : Nil
      # g_main_context_release: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_context_release(@pointer)

      # Return value handling
    end

    def unref : Nil
      # g_main_context_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_context_unref(@pointer)

      # Return value handling
    end

    def wait(cond : GLib::Cond, mutex : GLib::Mutex) : Bool
      # g_main_context_wait: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_wait(@pointer, cond, mutex)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def wakeup : Nil
      # g_main_context_wakeup: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_context_wakeup(@pointer)

      # Return value handling
    end

    def self.default : GLib::MainContext
      # g_main_context_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_default

      # Return value handling

      GLib::MainContext.new(_retval, GICrystal::Transfer::None)
    end

    def self.thread_default : GLib::MainContext?
      # g_main_context_get_thread_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_context_get_thread_default

      # Return value handling

      GLib::MainContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.ref_thread_default : GLib::MainContext
      # g_main_context_ref_thread_default: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_main_context_ref_thread_default

      # Return value handling

      GLib::MainContext.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
