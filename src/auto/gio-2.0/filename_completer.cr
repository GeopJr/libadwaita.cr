require "../g_object-2.0/object"

module Gio
  # Completes partial file and directory names given a partial string by
  # looking in the file system for clues. Can return a list of possible
  # completion strings for widget implementations.
  @[GObject::GeneratedWrapper]
  class FilenameCompleter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::FilenameCompleterClass), class_init,
        sizeof(LibGio::FilenameCompleter), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_filename_completer_get_type
    end

    # Creates a new filename completer.
    def initialize
      # g_filename_completer_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_filename_completer_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Obtains a completion for @initial_text from @completer.
    def completion_suffix(initial_text : ::String) : ::String?
      # g_filename_completer_get_completion_suffix: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_filename_completer_get_completion_suffix(self, initial_text)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets an array of completion strings for a given initial text.
    def completions(initial_text : ::String) : Enumerable(::String)
      # g_filename_completer_get_completions: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_filename_completer_get_completions(self, initial_text)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # If @dirs_only is %TRUE, @completer will only
    # complete directory names, and not file names.
    def dirs_only=(dirs_only : Bool) : Nil
      # g_filename_completer_set_dirs_only: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_filename_completer_set_dirs_only(self, dirs_only)

      # Return value handling
    end

    # Emitted when the file name completion information comes available.
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

      def connect(handler : Proc(Gio::FilenameCompleter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::FilenameCompleter.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::FilenameCompleter, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::FilenameCompleter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::FilenameCompleter.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::FilenameCompleter, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
