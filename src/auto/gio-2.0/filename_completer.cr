require "../g_object-2.0/object"

module Gio
  # Completes partial file and directory names given a partial string by
  # looking in the file system for clues. Can return a list of possible
  # completion strings for widget implementations.
  class FilenameCompleter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_filename_completer_get_type
    end

    def initialize
      # g_filename_completer_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_filename_completer_new

      # Return value handling
      @pointer = _retval
    end

    def completion_suffix(initial_text : ::String) : ::String?
      # g_filename_completer_get_completion_suffix: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_filename_completer_get_completion_suffix(self, initial_text)

      # Return value handling
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def completions(initial_text : ::String) : Enumerable(::String)
      # g_filename_completer_get_completions: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_filename_completer_get_completions(self, initial_text)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def dirs_only=(dirs_only : Bool) : Nil
      # g_filename_completer_set_dirs_only: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_filename_completer_set_dirs_only(self, dirs_only)

      # Return value handling
    end

    struct GotCompletionDataSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "got-completion-data::#{@detail}" : "got-completion-data"
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

      def connect(block : Proc(Gio::FilenameCompleter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::FilenameCompleter.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::FilenameCompleter, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::FilenameCompleter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::FilenameCompleter.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::FilenameCompleter, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "got-completion-data")
      end
    end

    def got_completion_data_signal
      GotCompletionDataSignal.new(self)
    end
  end
end
