module GLib
  # The `GMainLoop` struct is an opaque data type
  # representing the main event loop of a GLib or GTK+ application.
  class MainLoop
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(MainLoop.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(MainLoop.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::MainLoop)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_main_loop_get_type
    end

    def initialize(context : GLib::MainContext?, is_running : Bool)
      # g_main_loop_new: (Constructor)
      # @context: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end

      # C call
      _retval = LibGLib.g_main_loop_new(context, is_running)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def context : GLib::MainContext
      # g_main_loop_get_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_loop_get_context(self)

      # Return value handling

      GLib::MainContext.new(_retval, GICrystal::Transfer::None)
    end

    def is_running : Bool
      # g_main_loop_is_running: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_main_loop_is_running(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def quit : Nil
      # g_main_loop_quit: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_loop_quit(self)

      # Return value handling
    end

    def ref : GLib::MainLoop
      # g_main_loop_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_main_loop_ref(self)

      # Return value handling

      GLib::MainLoop.new(_retval, GICrystal::Transfer::Full)
    end

    def run : Nil
      # g_main_loop_run: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_loop_run(self)

      # Return value handling
    end

    def unref : Nil
      # g_main_loop_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_main_loop_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
