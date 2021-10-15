module GLib
  # The `GMainLoop` struct is an opaque data type
  # representing the main event loop of a GLib or GTK+ application.
  class MainLoop
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(MainLoop.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(MainLoop.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_main_loop_get_type
    end

    def initialize(context : GLib::MainContext?, is_running : Bool)
      # g_main_loop_new: (Constructor)
      # @context: (nullable)
      # Returns: (transfer full)

      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end

      _retval = LibGLib.g_main_loop_new(context, is_running)
      @pointer = _retval
    end

    def context : GLib::MainContext
      # g_main_loop_get_context: (Method)
      # Returns: (transfer none)

      _retval = LibGLib.g_main_loop_get_context(self)
      GLib::MainContext.new(_retval, GICrystal::Transfer::None)
    end

    def is_running : Bool
      # g_main_loop_is_running: (Method)
      # Returns: (transfer none)

      _retval = LibGLib.g_main_loop_is_running(self)
      GICrystal.to_bool(_retval)
    end

    def quit : Nil
      # g_main_loop_quit: (Method)
      # Returns: (transfer none)

      LibGLib.g_main_loop_quit(self)
    end

    def ref : GLib::MainLoop
      # g_main_loop_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGLib.g_main_loop_ref(self)
      GLib::MainLoop.new(_retval, GICrystal::Transfer::Full)
    end

    def run : Nil
      # g_main_loop_run: (Method)
      # Returns: (transfer none)

      LibGLib.g_main_loop_run(self)
    end

    def unref : Nil
      # g_main_loop_unref: (Method)
      # Returns: (transfer none)

      LibGLib.g_main_loop_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
